Import-Module $PSScriptRoot\..\Helper.psm1 -Verbose:$false

# Localized messages
data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
ResolvingIPv4Address = Resolving local IPv4 IP addresses
ResolvingHostname    = Resolving local hostname
AuthorizingServer    = Authorizing DHCP Server '{0}' with IP address '{1}'
UnauthorizingServer  = Unauthorizing DHCP Server '{0}' with IP address '{1}'
ServerIsAuthorized  = DHCP Server '{0}' with IP address '{1}' IS authorized
ServerNotAuthorized  = DHCP Server '{0}' with IP address '{1}' is NOT authorized
'@
}

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory)]
        [ValidateSet('Present','Absent')]
        [System.String] $Ensure,

        [ValidateNotNullOrEmpty()]
        [System.String] $DnsName = ( Get-Hostname ),

        [ValidateNotNullOrEmpty()]
        [System.String] $IPAddress = ( Get-IPv4Address | Select-Object -First 1 )
    )
    $targetResource = @{
        DnsName = $DnsName;
        IPAddress = $IPAddress;
        Ensure = ''
    }
    if ($Ensure -eq 'Present') {
        if (Test-TargetResource -Ensure $Ensure -DnsName $DnsName -IPAddress $IPAddress) {
            $targetResource['Ensure'] = 'Present';
        }
        else { $targetResource['Ensure'] = 'Absent'; }
    }
    elseif ($Ensure -eq 'Absent') {
        if (Test-TargetResource -Ensure $Ensure -DnsName $DnsName -IPAddress $IPAddress) {
            $targetResource['Ensure'] = 'Absent';
        }
        else { $targetResource['Ensure'] = 'Present'; }
    }
    return $targetResource;
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [ValidateSet('Present','Absent')]
        [System.String] $Ensure,

        [ValidateNotNullOrEmpty()]
        [System.String] $DnsName = ( Get-Hostname ),

        [ValidateNotNullOrEmpty()]
        [System.String] $IPAddress = ( Get-IPv4Address | Select-Object -First 1 )
    )
    Assert-Module -ModuleName 'DHCPServer';
    $IPAddress = Get-ValidIPAddress -IPString $IPAddress -AddressFamily 'IPv4' -ParameterName 'IPAddress';

    if ($Ensure -eq 'Present') {
        Write-Verbose ($LocalizedData.AuthorizingServer -f $DnsName, $IPAddress);
        Add-DhcpServerInDc -DnsName $DnsName -IPAddress $IPAddress;
    }
    elseif ($Ensure -eq 'Absent') {
        Write-Verbose ($LocalizedData.UnauthorizingServer -f $DnsName, $IPAddress);
        Get-DhcpServerInDC | Where-Object { ($_.DnsName -eq $DnsName) -and ($_.IPAddress -eq $IPAddress) } | Remove-DhcpServerInDc;
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory)]
        [ValidateSet('Present','Absent')]
        [System.String] $Ensure,

        [ValidateNotNullOrEmpty()]
        [System.String] $DnsName = ( Get-Hostname ),

        [ValidateNotNullOrEmpty()]
        [System.String] $IPAddress = ( Get-IPv4Address | Select-Object -First 1 )
    )
    Assert-Module -ModuleName 'DHCPServer';
    $IPAddress = Get-ValidIPAddress -IPString $IPAddress -AddressFamily 'IPv4' -ParameterName 'IPAddress';
    $dhcpServer = Get-DhcpServerInDC | Where-Object { ($_.DnsName -eq $DnsName) -and ($_.IPAddress -eq $IPAddress) };

    if ($dhcpServer) { Write-Verbose ($LocalizedData.ServerIsAuthorized -f $DnsName, $IPAddress); }
    else { Write-Verbose ($LocalizedData.ServerNotAuthorized -f $DnsName, $IPAddress); }

    if (($Ensure -eq 'Present') -and ($dhcpServer)) {
        return $true;
    }
    elseif (($Ensure -eq 'Absent') -and (-not $dhcpServer)) {
        return $true;
    }

    return $false;
}

## Internal function used to return all IPv4 addresses
function Get-IPv4Address {
    [CmdletBinding()]
    [OutputType([System.String])]
    param ( )
    process {
        Write-Verbose $LocalizedData.ResolvingIPv4Address;
        Get-WmiObject Win32_NetworkAdapterConfiguration -Namespace 'root\CIMV2' |
            Where IPEnabled -eq 'True' |
                ForEach { Write-Output ($_.IPAddress -notmatch ':'); }
    } #end process
} #end function Get-IPv4Address

## Internal function used to resolve the local hostname
function Get-Hostname {
    [CmdletBinding()]
    [OutputType([System.String])]
    param ( )
    process {
        Write-Verbose $LocalizedData.ResolvingHostname;
        $globalIpProperties = [System.Net.NetworkInformation.IPGlobalProperties]::GetIPGlobalProperties();
        if ($globalIpProperties.DomainName) {
            return '{0}.{1}' -f $globalIpProperties.HostName, $globalIpProperties.DomainName;
        }
        else {
            return $globalIpProperties.HostName;
        }
    } #end process
} #end function Get-Hostname

Export-ModuleMember -Function *-TargetResource;
