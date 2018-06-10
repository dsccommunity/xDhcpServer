$currentPath = Split-Path -Path $MyInvocation.MyCommand.Path -Parent

$modulePathhelper            = (Join-Path -Path (Split-Path -Path $currentPath -Parent) -ChildPath 'Helper.psm1')
$modulePathOptionValueHelper = (Join-Path -Path (Split-Path -Path $currentPath -Parent) -ChildPath 'OptionValueHelper.psm1')

Import-Module -Name $modulePathhelper
Import-Module -Name $modulePathOptionValueHelper

   <#
   .SYNOPSIS
        This function gets a DHCP policy option value.

    .PARAMETER PolicyName
        The Policy name.
    
    .PARAMETER OptionId
        The ID of the option.

    .PARAMETER Value
        The data value option.
        
    .PARAMETER ScopeId
        The scope ID to get the value. If not used server level values are retrieved.

    .PARAMETER VendorClass
        The vendor class of the option. Use an empty string for standard class.

    .PARAMETER AddressFamily
        The option definition address family (IPv4 or IPv6). Currently only the IPv4 is supported.

    .PARAMETER Ensure
        When set to 'Present', the option will be created.
        When set to 'Absent', the option will be removed.
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]  
        [String]
        $PolicyName,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [UInt32]
        $OptionId,

        [parameter(Mandatory = $false)]
        [AllowNull()]
        [String]
        $ScopeId,

        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [String]
        $VendorClass,

        [parameter(Mandatory = $true)]
        [ValidateSet('IPv4')]
        [String]
        $AddressFamily,

        [Parameter()]
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure = 'Present'
    )
  
    $result = Get-TargetResourceHelper -ApplyTo 'Policy' -PolicyName $PolicyName -OptionId $OptionId -ScopeId $ScopeId -VendorClass $VendorClass -UserClass '' -AddressFamily $AddressFamily -Ensure $Ensure        
    $result

 }

   <#
   .SYNOPSIS
        This function sets a DHCP policy option value.

    .PARAMETER PolicyName
        The policy name.

    .PARAMETER OptionId
        The ID of the option.

    .PARAMETER Value
        The data value option.

    .PARAMETER ScopeId
        The scope ID to set the value. If not used server level values are used.
        
    .PARAMETER VendorClass
        The vendor class of the option. Use an empty string for standard class.

    .PARAMETER AddressFamily
        The option definition address family (IPv4 or IPv6). Currently only the IPv4 is supported.

    .PARAMETER Ensure
        When set to 'Present', the option will be created.
        When set to 'Absent', the option will be removed.
#>
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]  
        [String]
        $PolicyName,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [UInt32]
        $OptionId,
        
        [parameter()]
        [String[]]
        $Value,

        [parameter(Mandatory = $false)]
        [String]
        $ScopeId,

        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [String]
        $VendorClass,

        [parameter(Mandatory = $true)]
        [ValidateSet('IPv4')]
        [String]
        $AddressFamily,

        [Parameter()]
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure = 'Present'
    )

    Set-TargetResourceHelper -ApplyTo 'Policy' -PolicyName $PolicyName -OptionId $OptionId -Value $Value -ScopeId $ScopeId -VendorClass $VendorClass -UserClass '' -AddressFamily $AddressFamily -Ensure $Ensure
}

   <#
   .SYNOPSIS
        This function tests a DHCP policy option value.

    .PARAMETER PolicyName
        The policy name.

    .PARAMETER OptionId
        The ID of the option.

    .PARAMETER Value
        The data value option.

    .PARAMETER ScopeId
        The scope ID to test the value. If not used server level values are tested.
        
    .PARAMETER VendorClass
        The vendor class of the option. Use an empty string for standard class.

    .PARAMETER AddressFamily
        The option definition address family (IPv4 or IPv6). Currently only the IPv4 is supported.

    .PARAMETER Ensure
        When set to 'Present', the option will be created.
        When set to 'Absent', the option will be removed.
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]  
        [String]
        $PolicyName,
        
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [UInt32]
        $OptionId,

        [parameter()]
        [String[]]
        $Value,

        [parameter(Mandatory = $false)]
        [String]
        $ScopeId,

        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [String]
        $VendorClass,

        [parameter(Mandatory = $true)]
        [ValidateSet('IPv4')]
        [String]
        $AddressFamily,

        [Parameter()]
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure = 'Present'
    )

    $result = Test-TargetResourceHelper -ApplyTo 'Policy' -PolicyName $PolicyName -OptionId $OptionId -Value $Value -ScopeId $ScopeId -VendorClass $VendorClass -UserClass '' -AddressFamily $AddressFamily -Ensure $Ensure
    $result
}
