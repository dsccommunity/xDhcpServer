Import-Module $PSScriptRoot\..\Helper.psm1 -Verbose:$false

# Localized messages
data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
ResolvingIPv4Address      = Resolving first local IPv4 IP address ...
ResolvingHostname         = Resolving local hostname ...
AuthorizingServer         = Authorizing DHCP Server '{0}' with IP address '{1}'
UnauthorizingServer       = Unauthorizing DHCP Server '{0}' with IP address '{1}'
ServerIsAuthorized        = DHCP Server '{0}' with IP address '{1}' IS authorized
ServerNotAuthorized       = DHCP Server '{0}' with IP address '{1}' is NOT authorized
IncorrectPropertyValue    = Property '{0}' is incorrect. Expected '{1}', actual '{2}'
SecurityGroupsPresent     = DHCP security groups are present on the machine.
SecurityGroupsNotPresent  = DHCP security groups are not present on the machine.
ResourceInDesiredState    = DHCP Server '{0}' is in the desired state
ResourceNotInDesiredState = DHCP Server '{0}' is NOT in the desired state
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
        [System.String] 
        $Ensure,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] 
        $DnsName = ( Get-Hostname ),

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] 
        $IPAddress = ( Get-IPv4Address | Select-Object -First 1 ),

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $EnsureDhcpServerSecurityGroup = 'Absent'
    )
    Assert-Module -ModuleName 'DHCPServer';
    $IPAddress = Get-ValidIPAddress -IPString $IPAddress -AddressFamily 'IPv4' -ParameterName 'IPAddress'
    $dhcpServer = Get-DhcpServerInDC | Where-Object { ($_.DnsName -eq $DnsName) -and ($_.IPAddress -eq $IPAddress) }

    $targetResource = @{
        DnsName = $dhcpServer.DnsName
        IPAddress = $dhcpServer.IPAddress
    }
    if ($dhcpServer)
    {
        Write-Verbose ($LocalizedData.ServerIsAuthorized -f $DnsName, $IPAddress)
        $returnEnsure = 'Present'
    }
    else
    {
        Write-Verbose ($LocalizedData.ServerNotAuthorized -f $DnsName, $IPAddress)
        $returnEnsure = 'Absent'
    }

    $systemGroupStatus = Get-SystemGroupsStatus
    if($systemGroupStatus -eq 'Present')
    {
        Write-Verbose ($LocalizedData.SecurityGroupsPresent)
    }
    else
    {
        Write-Verbose ($LocalizedData.SecurityGroupsNotPresent)
    }

    $returnValue = @{
        Ensure = $returnEnsure
        DnsName = $DnsName
        IPAddress = $IPAddress
        EnsureDhcpServerSecurityGroup = $systemGroupStatus
    }

    $returnValue
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [ValidateSet('Present','Absent')]
        [System.String] 
        $Ensure,

        [ValidateNotNullOrEmpty()]
        [System.String] 
        $DnsName = ( Get-Hostname ),

        [ValidateNotNullOrEmpty()]
        [System.String] 
        $IPAddress = ( Get-IPv4Address | Select-Object -First 1 ),

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $EnsureDhcpServerSecurityGroup = 'Absent'
    )
    Assert-Module -ModuleName 'DHCPServer'
    $IPAddress = Get-ValidIPAddress -IPString $IPAddress -AddressFamily 'IPv4' -ParameterName 'IPAddress'

    if ($Ensure -eq 'Present')
    {
        Write-Verbose ($LocalizedData.AuthorizingServer -f $DnsName, $IPAddress)
        Add-DhcpServerInDc -DnsName $DnsName -IPAddress $IPAddress
    }
    elseif ($Ensure -eq 'Absent')
    {
        Write-Verbose ($LocalizedData.UnauthorizingServer -f $DnsName, $IPAddress)
        Get-DhcpServerInDC | Where-Object { ($_.DnsName -eq $DnsName) -and ($_.IPAddress -eq $IPAddress) } | Remove-DhcpServerInDc
    }

    $systemGroupStatus = Get-SystemGroupsStatus
    if ($EnsureDhcpServerSecurityGroup -and $systemGroupStatus -ne $EnsureDhcpServerSecurityGroup)
    {
        if($EnsureDhcpServerSecurityGroup -eq 'Present')
        {
            Add-DhcpServerSecurityGroup
        }
        else
        {
            Remove-DhcpServerSecurityGroup
        }
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
        [System.String] 
        $Ensure,

        [ValidateNotNullOrEmpty()]
        [System.String] 
        $DnsName = ( Get-Hostname ),

        [ValidateNotNullOrEmpty()]
        [System.String] 
        $IPAddress = ( Get-IPv4Address | Select-Object -First 1 ),

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $EnsureDhcpServerSecurityGroup = 'Absent'
    )
    $targetResource = Get-TargetResource @PSBoundParameters
    $isCompliant = $true
    
    if ($targetResource.Ensure -ne $Ensure)
    {
        Write-Verbose ($LocalizedData.IncorrectPropertyValue -f 'Ensure', $Ensure, $targetResource.Ensure)
        $isCompliant = $false

    }
    elseif ($Ensure -eq 'Present')
    {
        if ($targetResource.DnsName -ne $DnsName)
        {
            Write-Verbose ($LocalizedData.IncorrectPropertyValue -f 'DnsName', $DnsName, $targetResource.DnsName)
            $isCompliant = $false
        }
        if ($targetResource.IPAddress -ne $IPAddress)
        {
            Write-Verbose ($LocalizedData.IncorrectPropertyValue -f 'IPAddress', $IPAddress, $targetResource.IPAddress)
            $isCompliant = $false
        }
    }

    

    if ($targetResource.EnsureDhcpServerSecurityGroup -ne $EnsureDhcpServerSecurityGroup)
    {
        Write-Verbose ($LocalizedData.IncorrectPropertyValue -f 'EnsureDhcpServerSecurityGroup', $EnsureDhcpServerSecurityGroup, $targetResource.EnsureDhcpServerSecurityGroup)
        $isCompliant = $false
    }
    
    if ($isCompliant)
    {
        Write-Verbose ($LocalizedData.ResourceInDesiredState -f $DnsName)
    }
    else {
        Write-Verbose ($LocalizedData.ResourceNotInDesiredState -f $DnsName)
    }
    return $isCompliant
}

## Internal function used to return all IPv4 addresses
function Get-IPv4Address
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param ( )
    process
    {
        Write-Verbose $LocalizedData.ResolvingIPv4Address
        Get-WmiObject Win32_NetworkAdapterConfiguration -Namespace 'root\CIMV2' |
            Where-Object IPEnabled -eq 'True' |
                ForEach-Object {
                    Write-Output ($_.IPAddress -notmatch ':')
                }
    } #end process
} #end function Get-IPv4Address

## Internal function used to resolve the local hostname
function Get-Hostname 
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param ( )
    process
    {
        Write-Verbose $LocalizedData.ResolvingHostname;
        $globalIpProperties = [System.Net.NetworkInformation.IPGlobalProperties]::GetIPGlobalProperties();
        if ($globalIpProperties.DomainName)
        {
            return '{0}.{1}' -f $globalIpProperties.HostName, $globalIpProperties.DomainName
        }
        else
        {
            return $globalIpProperties.HostName
        }
    } #end process
} #end function Get-Hostname

function Get-SystemGroupsStatus
{
    [CmdletBinding(SupportsShouldProcess = $false)]
    [OutputType([System.String])]
    param()

    $adsiComp = [adsi]("WinNT://localhost,computer")
    try
    {
        $adsiComp.Children.Find('DHCP Administrators', 'Group') | Out-Null
        return 'Present'
    }
    catch [System.Management.Automation.MethodInvocationException]
    {}

    try
    {
        $adsiComp.Children.Find('DHCP Users', 'Group') | Out-Null
        return 'Present'
    }
    catch [System.Management.Automation.MethodInvocationException]
    {}
    
    return 'Absent'
}

function Remove-DhcpServerSecurityGroup
{
    [CmdletBinding(SupportsShouldProcess = $false)]
    param()

    $adsiComp = [adsi]("WinNT://localhost,computer")

    try
    {
        $adminGroup = $adsiComp.Children.Find('DHCP Administrators', 'Group')
        $adsiComp.Children.Remove($adminGroup)
    }
    catch [System.Management.Automation.MethodInvocationException]
    {}

    try
    {
        $userGroup = $adsiComp.Children.Find('DHCP Users', 'Group')
        $adsiComp.Children.Remove($userGroup)
    }
    catch [System.Management.Automation.MethodInvocationException]
    {}
}

Export-ModuleMember -Function *-TargetResource;
