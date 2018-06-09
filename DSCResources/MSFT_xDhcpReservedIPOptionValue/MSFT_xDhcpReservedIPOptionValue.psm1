$currentPath = Split-Path -Path $MyInvocation.MyCommand.Path -Parent

$modulePathhelper            = (Join-Path -Path (Split-Path -Path $currentPath -Parent) -ChildPath 'Helper.psm1')
$modulePathOptionValueHelper = (Join-Path -Path (Split-Path -Path $currentPath -Parent) -ChildPath 'OptionValueHelper.psm1')

Import-Module -Name $modulePathhelper
Import-Module -Name $modulePathOptionValueHelper

   <#
   .SYNOPSIS
        This function gets a DHCP reserved IP option value.

    .PARAMETER ReservedIP
        The Reserved IP to get the option value from.
    
    .PARAMETER OptionId
        The ID of the option.

    .PARAMETER Value
        The data value.
        
    .PARAMETER VendorClass
        The vendor class of the option. Use an empty string for standard class.

    .PARAMETER UserClass
        The user class of the option.
    
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
        $ReservedIP,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [UInt32]
        $OptionId,

        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [String]
        $VendorClass,

        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [String]
        $UserClass,

        [parameter(Mandatory = $true)]
        [ValidateSet('IPv4')]
        [String]
        $AddressFamily,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure = 'Present'
    )
  
    $result = Get-TargetResourceHelper -ApplyTo 'ReservedIP' -ReservedIP $ReservedIP -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass -AddressFamily $AddressFamily -Ensure $Ensure        
    $result

 }

   <#
   .SYNOPSIS
        This function sets a DHCP reserved IP option value.

    .PARAMETER ReservedIP
        The reserved IP.

    .PARAMETER OptionId
        The Option ID.

    .PARAMETER Value
        The option data value.
        
    .PARAMETER VendorClass
        The vendor class of the option. Use an empty string for standard class.

    .PARAMETER UserClass
        The user class of the option.

    .PARAMETER AddressFamily
        The option definition address family (IPv4 or IPv6). Currently only the IPv4 is supported.

    .PARAMETER Ensure
        When set to 'Present', the option will be created.
        When set to 'Absent', the option will be removed.
#>

function Set-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]  
        [String]
        $ReservedIP,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [UInt32]
        $OptionId,
        
        [parameter(Mandatory = $true)]
        [String[]]
        $Value,

        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [String]
        $VendorClass,

        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [String]
        $UserClass,

        [parameter(Mandatory = $true)]
        [ValidateSet('IPv4')]
        [String]
        $AddressFamily,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure = 'Present'
    )

    Set-TargetResourceHelper -ApplyTo 'ReservedIP' -ReservedIP $ReservedIP -OptionId $OptionId -Value $Value -VendorClass $VendorClass -UserClass $UserClass -AddressFamily $AddressFamily -Ensure $Ensure
}

   <#
   .SYNOPSIS
        This function tests a DHCP reserved IP option value.

    .PARAMETER ReservedIP
        The reserved IP.

    .PARAMETER OptionId
        The Option ID.

    .PARAMETER Value
        The option data value.
        
    .PARAMETER VendorClass
        The vendor class of the option. Use an empty string for standard class.

    .PARAMETER UserClass
        The user class of the option.
    
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
        $ReservedIP,
        
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [UInt32]
        $OptionId,

        [parameter(Mandatory = $true)]
        [String[]]
        $Value,

        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [String]
        $VendorClass,

        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [String]
        $UserClass,

        [parameter(Mandatory = $true)]
        [ValidateSet('IPv4')]
        [String]
        $AddressFamily,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure = 'Present'
    )

    $result = Test-TargetResourceHelper -ApplyTo 'ReservedIP' -ReservedIP $ReservedIP -OptionId $OptionId -Value $Value -VendorClass $VendorClass -UserClass $UserClass -AddressFamily $AddressFamily -Ensure $Ensure
    $result
}
