Import-Module $PSScriptRoot\..\Helper.psm1 -Verbose:$false

# Localized messages
data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'

'@
}

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [String]$DnsName,

        [parameter(Mandatory = $true)]
        [String]$IPAddress,

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present'
    )

    Assert-Module -ModuleName 'DHCPServer';
    $targetResource = @{
        DnsName = $DnsName;
        IPAddress = $IPAddress;
        Ensure = ''
    }
    if ($Ensure -eq 'Present') {
        if (Test-TargetResource @PSBoundParameters) {
            $targetResource['Ensure'] = 'Present';
        }
        else {
            $targetResource['Ensure'] = 'Absent';
        }
    }
    elseif ($Ensure -eq 'Absent') {
        if (Test-TargetResource @PSBoundParameters) {
            $targetResource['Ensure'] = 'Absent';
        }
        else {
            $targetResource['Ensure'] = 'Present';
        }
    }

    return $targetResource;

}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [String]$DnsName,

        [parameter(Mandatory = $true)]
        [String]$IPAddress,

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present'
    )

    Assert-Module -ModuleName 'DHCPServer';
    $IPAddress = Get-ValidIPAddress -IPString $IPAddress -AddressFamily 'IPv4' -ParameterName 'IPAddress';

    if ($Ensure -eq 'Present') {
        # Add the DHCP Server authorisation
        Add-DhcpServerInDc -DnsName $DnsName -IPAddress $IPAddress;
    }
    else {
        # Remove the DHCP Server authorisation
        Get-DhcpServerInDC | Where-Object { ($_.DnsName -eq $DnsName) -and ($_.IPAddress -eq $IPAddress) } | Remove-DhcpServerInDc;
    }

}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [String]$DnsName,

        [parameter(Mandatory = $true)]
        [String]$IPAddress,

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present'
    )

    Assert-Module -ModuleName 'DHCPServer';
    $IPAddress = Get-ValidIPAddress -IPString $IPAddress -AddressFamily 'IPv4' -ParameterName 'IPAddress';
    $dhcpServer = Get-DhcpServerInDC | Where-Object { ($_.DnsName -eq $DnsName) -and ($_.IPAddress -eq $IPAddress) };

    if (($Ensure -eq 'Present') -and ($dhcpServer)) {
        return $true;
    }
    elseif (($Ensure -eq 'Absent') -and (-not $dhcpServer)) {
        return $true;
    }

    return $false;

}
