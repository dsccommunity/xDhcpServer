Import-Module $PSScriptRoot\..\Helper.psm1 -Verbose:$false

# Localized messages
data LocalizedData
{
    # Culture="en-US"
    ConvertFrom-StringData @'
    GettingOptionDefinitionIDMessage     = Getting DHCP server option definition "{0}" with vendor class "{1}".
    TestingOptionDefinitionIDMessage     = Begin testing DHCP server option definition "{0}" with vendor class "{1}".
    RemovingOptionDefinitionIDMessage    = Removing DHCP server option definition "{0}" with vendor class "{1}".
    RecreatingOptionDefinitionIDMessage  = Recreating DHCP server option definition "{0}" with vendor class "{1}".
    AddingOptionDefinitionIDMessage      = Adding DHCP server option definition "{0}" with vendor class "{1}".
    SettingOptionDefinitionIDMessage     = Setting DHCP server option definition "{0}" with vendor class "{1}".
    FoundOptionDefinitionIDMessage       = Found DHCP server option Definition "{0}" with vendor class "{1}".
    ComparingOptionDefinitionIDMessage   = Comparing option definition "{0}", vendor class "{1}" with existing definition.
    ExactMatchOptionDefinitionIDMessage  = Matched option definition "{0}" with vendor class "{1}" with existing definition.
    NotMatchOptionDefinitionIDMessage    = Not matched all parameters in option definition "{0}" with vendor class "{1}", should adjust.
'@
}
  
   <#
   
   .SYNOPSIS
    This function gets a DHCP option definition.
    
    .PARAMETER Ensure
    When set to 'Present', the option definition will be created.
    When set to 'Absent', the option definition will be removed.

    .PARAMETER OptionID
    The ID of the option definition.

    .PARAMETER Name
    The name of the option definition.
        
    .PARAMETER VendorClass
    The vendor class of the option definition. Use an empty string for standard class.

    .PARAMETER Type
    The data type of the option definition.
    
    .PARAMETER AddressFamily
    The option definition address family (IPv4 or IPv6). Currently only the IPv4 is supported.

#>

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter()]
        [ValidateSet('Present','Absent')]
        [ValidateNotNullOrEmpty()]
        [String]
        $Ensure = 'Present',

        [Parameter(mandatory = $true)]
        [Validaterange(1,255)]
        [UInt32]
        $OptionID,

        [Parameter(mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]
        $Name,

        [Parameter(mandatory=$true)]
        [ValidateSet('Byte','Word','Dword','DwordDword','IPv4Address','String','BinaryData','EncapsulatedData')]
        [String]
        $Type,
                
        [Parameter(mandatory = $true)]
        [AllowEmptyString()]
        [String]
        $VendorClass,

        [Parameter(mandatory = $true)]
        [ValidateSet('IPv4')]
        [String]
        $AddressFamily
    )

    # Region Input Validation

    # Check for DhcpServer module/role
    Assert-Module -moduleName DHCPServer

    # Endregion Input Validation
     
    $dhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition -OptionId $OptionID -VendorClass $VendorClass -ErrorAction SilentlyContinue
  
    if ($dhcpServerOptionDefinition)
    {
        $hashTable= @{
            OptionId       = $dhcpServerOptionDefinition.OptionID
            Name           = $dhcpServerOptionDefinition.Name
            AddressFamily  = $AddressFamily
            Description    = $dhcpServerOptionDefinition.Description
            Type           = $dhcpServerOptionDefinition.Type
            VendorClass    = $dhcpServerOptionDefinition.VendorClass
            MultiValued    = $dhcpServerOptionDefinition.MultiValued
        }
    }
    else
    {
        $hashTable= @{
            OptionId      = $null
            Name          = $null
            AddressFamily = $null
            Description   = $null
            Type          = $null
            VendorClass   = $null
            MultiValued   = $null
        }
    }
    $hashTable
}

<#
    
    .SYNOPSIS
    This function sets the state of a DHCP option definition.
    
    .PARAMETER Ensure
    When set to 'Present', the option definition will be created.
    When set to 'Absent', the option definition will be removed.

    .PARAMETER OptionID
    The ID of the option definition.
        
    .PARAMETER Name
    The name of the option definition.

    .PARAMETER Description
    Description of the option definition.

    .PARAMETER VendorClass
    The vendor class of the option definition. Use an empty string for standard class.

    .PARAMETER Type
    The data type of the option definition.

    .PARAMETER Multivalued
    Whether the option definition is multivalued or not.

    .PARAMETER AddressFamily
    The option definition address family (IPv4 or IPv6). Currently only the IPv4 is supported.

#>

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter()]
        [ValidateSet('Present','Absent')]
        [ValidateNotNullOrEmpty()]
        [String]
        $Ensure = 'Present',

        [Parameter(mandatory=$true)]
        [Validaterange(1,255)]
        [UInt32]
        $OptionID,
        
        [Parameter(mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]
        $Name,
        
        [Parameter()]
        [AllowEmptyString()]
        [String]
        $Description,

        [Parameter(mandatory=$true)]
        [AllowEmptyString()]
        [String]
        $VendorClass,

        [Parameter(mandatory=$true)]
        [ValidateSet('Byte','Word','Dword','DwordDword','IPv4Address','String','BinaryData','EncapsulatedData')]
        [String]
        $Type,

        [Parameter()]
        [Boolean]
        $MultiValued,

        [Parameter(mandatory=$true)]
        [ValidateSet('IPv4')]
        [String]
        $AddressFamily
    )
        
    # Reading the dhcp option
    $dhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition -OptionId $OptionID -VendorClass $VendorClass -ErrorAction SilentlyContinue

    # Testing for present
    if ($Ensure -eq 'Present')
    {
        # Testing if exists
        if ($dhcpServerOptionDefinition)
        {
            # If it exists and any of multivalued, type or vendorclass is being changed remove then re-add the whole option definition
            if (($dhcpServerOptionDefinition.type -ne $Type) -or ($dhcpServerOptionDefinition.MultiValued -ne $MultiValued) -or ($dhcpServerOptionDefinition.VendorClass -ne $Vendorclass))
            {
                $scopeIDMessage = $($localizedData.RecreatingOptionDefinitionIDMessage) -f $OptionID, $VendorClass
                Write-Verbose -Message $scopeIDMessage
                Remove-DhcpServerv4OptionDefinition -OptionId $OptionID -VendorClass $VendorClass
                Add-DhcpServerv4OptionDefinition -OptionId $OptionID -name $Name -Type $Type -Description $Description -MultiValued:$MultiValued -VendorClass $Vendorclass
            }
            else
            {
                # If option exists we need only to adjust the parameters
                $settingIDMessage = $($localizedData.SettingOptionDefinitionIDMessage) -f $OptionID, $VendorClass
                Write-Verbose -Message $settingIDMessage
                set-DhcpServerv4OptionDefinition -OptionId $OptionID -VendorClass $VendorClass -name $Name -Description $Description
            }
        }

        # If option does not exist we need to add it
        else
        {
            $scopeIDMessage = $($localizedData.AddingOptionDefinitionIDMessage) -f $OptionID, $VendorClass
            Write-Verbose -Message $scopeIDMessage
            Add-DhcpServerv4OptionDefinition -OptionId $OptionID -name $Name -Type $Type -Description $Description -MultiValued:$MultiValued -VendorClass $Vendorclass
        }
    }
    
    # Testing for 'absent'
    else
    {
    if ($dhcpServerOptionDefinition)
        {
            $scopeIDMessage = $($localizedData.RemovingOptionDefinitionIDMessage) -f $OptionID,$VendorClass
            Write-Verbose -Message $scopeIDMessage            
            Remove-DhcpServerv4OptionDefinition -OptionId $OptionID -VendorClass $VendorClass
        }
    }
}

<#
    
    .SYNOPSIS
    This function tests if the DHCP option definition is created.
    
    .PARAMETER Ensure
    When set to 'Present', the option definition will be created.
    When set to 'Absent', the option definition will be removed.

    .PARAMETER OptionID
    The ID of the option definition.
        
    .PARAMETER Name
    The name of the option definition.

    .PARAMETER Description
    Description of the option definition.

    .PARAMETER VendorClass
    The vendor class of the option definition. Use an empty string for standard class.

    .PARAMETER Type
    The data type of the option definition.

    .PARAMETER Multivalued
    Whether the option definition is multivalued or not.

    .PARAMETER AddressFamily
    The option definition address family (IPv4 or IPv6). Currently only the IPv4 is supported.

#>

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter()]
        [ValidateSet('Present','Absent')]
        [ValidateNotNullOrEmpty()]
        [String]
        $Ensure = 'Present',
        
        [Parameter(mandatory=$true)]
        [Validaterange(1,255)]
        [UInt32] $OptionID,
        
        [Parameter(mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]
        $Name,

        [Parameter()]
        [AllowEmptyString()]
        [String]
        $Description,

        [Parameter(mandatory=$true)]
        [AllowEmptyString()]
        [String]
        $VendorClass = '',

        [Parameter(mandatory=$true)]
        [ValidateSet('Byte','Word','Dword','DwordDword','IPv4Address','String','BinaryData','EncapsulatedData')]
        [String]
        $Type,

        [Parameter()]
        [Boolean]
        $MultiValued,

        [Parameter(mandatory=$true)]
        [ValidateSet('IPv4')]
        [String]
        $AddressFamily
    )
    
    # Region Input Validation

    # Check for DhcpServer module/role
    Assert-Module -moduleName DHCPServer
    # Endregion Input Validation

    $testingIDMessage = $($localizedData.TestingOptionDefinitionIDMessage) -f $OptionID, $VendorClass
    # Geting the dhcp option definition
    Write-Verbose -Message $testingIDMessage

    $gettingIDMessage = $($localizedData.GettingOptionDefinitionIDMessage) -f $OptionID, $VendorClass
    Write-Verbose -Message $gettingIDMessage
    $dhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition -OptionId $OptionID -VendorClass $VendorClass -ErrorAction SilentlyContinue
    
    if ($dhcpServerOptionDefinition)
    {
        $foundIDMessage = $($localizedData.FoundOptionDefinitionIDMessage) -f $OptionID, $VendorClass
        Write-Verbose $foundIDMessage
    }

    # Testing for Ensure = Present
    if ($Ensure -eq 'Present')
    {
        # Testing if $$dhcpServerOptionDefinition is not null       
        if ($dhcpServerOptionDefinition)
        {
            $comparingIDMessage = $($localizedData.ComparingOptionDefinitionIDMessage) -f $OptionID, $VendorClass
            Write-Verbose $comparingIDMessage
            
            # Since $dhcpServerOptionDefinition is not null compare all the Values
            if (($dhcpServerOptionDefinition.OptionID -eq $OptionID) -and ($dhcpServerOptionDefinition.Name -eq $Name) -and ($dhcpServerOptionDefinition.Description -eq $Description) -and ($dhcpServerOptionDefinition.VendorClass -eq $VendorClass) -and ($dhcpServerOptionDefinition.Type -eq $Type) -and ($dhcpServerOptionDefinition.Multivalued -eq $MultiValued))
            {
                $exactMatchIDMessage = $($localizedData.ExactMatchOptionDefinitionIDMessage) -f $OptionID, $VendorClass
                Write-Verbose $exactMatchIDMessage

                $result = $true
            }
            else
            {
                $notMatchIDMessage = $($localizedData.NotMatchOptionDefinitionIDMessage) -f $OptionID, $VendorClass
                Write-Verbose $notMatchIDMessage
                $result = $false            
            }
        }
        else
        {
            # If $dhcpServerOptionDefinition is null return false
            $result = $false
        }
    }
    # If Ensure = Absent
    else
    {
        if ($dhcpServerOptionDefinition)
        {
            # Testing if $dhcpServerOptionDefinition is not null, if it exists return false
            $result = $false
        }
        else
        {
            $result = $true
        }
    }
$result
}
