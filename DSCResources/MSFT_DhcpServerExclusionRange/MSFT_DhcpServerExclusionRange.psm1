$currentPath = Split-Path -Path $MyInvocation.MyCommand.Path -Parent

Import-Module -Name (Join-Path -Path (Split-Path -Path $currentPath -Parent) -ChildPath 'Helper.psm1')

data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
SettingExclusionRange   = Setting DHCP server exclusion range with StartRange "{0}" EndRange "{1}" for ScopeId "{2}"
TestingExclusionRange   = Testing DHCP server exclusion StartRange "{0}" EndRange "{1}" for ScopeId "{2}"
RemovingExclusionRange  = Removing DHCP server exclusion StartRange "{0}" EndRange "{1}" for ScopeId "{2}"
InvalidStartAndEndRange = StartRange must be less than EndRange
NotInDesiredState       = DHCP server scope "{0}" is NOT in desired state. Expected "{1}", actual "{2}"
InDesiredState          = DHCP server scope "{0}" is in desired state.
RetrievingExclusion     = Getting exclusions for scope "{0}"
FoundExclusion          = Found exclusion with StartRange "{0}" and EndRange "{1}"
ExclusionNotFound       = Exclusion with StartRange "{0}" and EndRange "{1}" not found
'@
}

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $ScopeId,

        [Parameter(Mandatory = $true)]
        [String]
        $IPStartRange,

        [Parameter(Mandatory = $true)]
        [String]
        $IPEndRange,

        [Parameter()]
        [ValidateSet('IPv4')]
        [String]
        $AddressFamily = 'IPv4'
    )

    # Check for DhcpServer module/role
    Assert-Module -ModuleName DHCPServer

    $ScopeId = (Get-ValidIpAddress -IpString $ScopeId -AddressFamily $AddressFamily -ParameterName 'ScopeId').IPAddressToString
    $IPStartRange = (Get-ValidIpAddress -IpString $IPStartRange -AddressFamily $AddressFamily -ParameterName 'StartRange').IPAddressToString
    $IPEndRange = (Get-ValidIpAddress -IpString $IPEndRange -AddressFamily $AddressFamily -ParameterName 'EndRange').IPAddressToString

    # Check to ensure startRange is smaller than endRange
    if ($IPEndRange.Address -lt $IPStartRange.Address)
    {
        New-TerminatingError -ErrorId RangeNotCorrect -ErrorMessage $LocalizedData.InvalidStartAndEndRange -ErrorCategory InvalidArgument
    }

    # Retrieve exclusions for the scope
    Write-Verbose -Message ($LocalizedData.RetrievingExclusion -f $ScopeId)
    [array]$dhcpExclusionRange = Get-DhcpServerv4ExclusionRange -ScopeId $ScopeId -ErrorAction SilentlyContinue
    $testExclusionRange = $dhcpExclusionRange | Where-Object{$_.StartRange -eq $IPStartRange -and $_.EndRange -eq $IPEndRange}
    $ipStart = $testExclusionRange.StartRange.IPAddressToString
    $ipEnd = $testExclusionRange.EndRange.IPAddressToString

    if($testExclusionRange)
    {
        Write-Verbose -Message ($LocalizedData.FoundExclusion -f $ScopeId,$ipStart,$ipEnd)
        $ensure = 'Present'
    }
    else
    {
        $ensure = 'Absent'
    }

    @{
        Ensure        = $ensure
        ScopeId       = $ScopeId
        IPStartRange  = $ipStart
        IPEndRange    = $ipEnd
        AddressFamily = $AddressFamily
    }
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $ScopeId,

        [Parameter(Mandatory = $true)]
        [String]
        $IPStartRange,

        [Parameter(Mandatory = $true)]
        [String]
        $IPEndRange,

        [Parameter()]
        [ValidateSet('IPv4')]
        [String]
        $AddressFamily = 'IPv4',

        [Parameter()]
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure = 'Present'
    )

    # Check for DhcpServer module/role
    Assert-Module -ModuleName DHCPServer

    # Add exclusion range
    if ($Ensure -eq 'Present')
    {
        Write-Verbose -Message ($LocalizedData.SettingExclusionRange -f $IPStartRange,$IPEndRange,$ScopeId)
        Add-DhcpServerv4ExclusionRange -ScopeId $ScopeId -StartRange $IPStartRange -EndRange $IPEndRange
    }
    # Remove exclusion range
    else
    {
        Write-Verbose -Message ($LocalizedData.RemovingExclusionRange -f $IPStartRange,$IPEndRange,$ScopeId)
        Remove-DhcpServerv4ExclusionRange -ScopeId $ScopeId -StartRange $IPStartRange -EndRange $IPEndRange
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $ScopeId,

        [Parameter(Mandatory = $true)]
        [String]
        $IPStartRange,

        [Parameter(Mandatory = $true)]
        [String]
        $IPEndRange,

        [Parameter()]
        [ValidateSet('IPv4')]
        [String]
        $AddressFamily = 'IPv4',

        [Parameter()]
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure = 'Present'
    )

    # Check for DhcpServer module/role
    Assert-Module -ModuleName DHCPServer

    $validStartRange = Get-ValidIpAddress -IpString $IPStartRange -AddressFamily $AddressFamily -ParameterName 'StartRange'
    $validEndRange = Get-ValidIpAddress -IpString $IPEndRange -AddressFamily $AddressFamily -ParameterName 'EndRange'

    # Check to ensure startRange is smaller than endRange
    if ($validEndRange.Address -lt $validStartRange.Address)
    {
        New-TerminatingError -ErrorId RangeNotCorrect -ErrorMessage $LocalizedData.InvalidStartAndEndRange -ErrorCategory InvalidArgument
    }

    # Retrieve exclusions for the scope
    Write-Verbose -Message ($LocalizedData.RetrievingExclusion -f $ScopeId)
    [array]$dhcpExclusionRange = Get-DhcpServerv4ExclusionRange -ScopeId $ScopeId -ErrorAction SilentlyContinue
    $testExclusionRange = $dhcpExclusionRange | Where-Object {$_.StartRange -eq $IPStartRange -and $_.EndRange -eq $IPEndRange}
    $ipStart = $testExclusionRange.StartRange.IPAddressToString
    $ipEnd = $testExclusionRange.EndRange.IPAddressToString
    
    if ($Ensure -ieq 'Present')
    {
        if ($testExclusionRange)
        {
            Write-Verbose -Message ($LocalizedData.FoundExclusion -f $ScopeId,$ipStart,$ipEnd)
            return $true
        }
        else
        {
            Write-Verbose -Message ($LocalizedData.ExclusionNotFound -f $IPStartRange,$IPEndRange)
            Write-Verbose -Message ($LocalizedData.NotInDesiredState -f $ScopeId,$Ensure,"Absent")
            return $false
        }
    }
    elseif ($Ensure -ieq 'Absent')
    {
        if (-not $testExclusionRange)
        {
            Write-Verbose -Message ($LocalizedData.ExclusionNotFound -f $IPStartRange,$IPEndRange)
            return $true
        }
        else
        {
            Write-Verbose -Message ($LocalizedData.FoundExclusion -f $ScopeId,$ipStart,$ipEnd)
            Write-Verbose -Message ($LocalizedData.NotInDesiredState -f $ScopeId,$Ensure,"Present")
            return $false
        }
    }
}

Export-ModuleMember -Function *-TargetResource
