Import-Module $PSScriptRoot\..\Helper.psm1 -Verbose:$false

# Localized messages
data LocalizedData
{
    # culture="en-US"
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


function Get-TargetResource
{
    param
    (
        [Parameter(mandatory)][ValidateSet('Present','Absent')]
        [String] $Ensure,

        [Parameter(mandatory)][Validaterange(1,255)]
        [UInt32] $OptionID,
        
        [Parameter(mandatory)][ValidateNotNullOrEmpty()]
        [String] $Name,

        [Parameter(mandatory)][ValidateSet('Byte','Word','DWord','DWordDword','IPv4Address','String','BinaryData','EncapsulatedData')]
        [String] $Type,

        [AllowEmptyString()]
        [String] $Description = '',

        [Parameter(mandatory)][AllowEmptyString()]
        [String] $VendorClass = '',

        [Parameter()]
        [Boolean] $MultiValued,

        [Parameter(mandatory)] [ValidateSet('IPv4')]
        [String] $AddressFamily
    )

    #region Input Validation

    #Check for DhcpServer module/role
    Assert-Module -moduleName DHCPServer

    #endregion Input Validation
     
    $DhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition -OptionId $OptionID -VendorClass $VendorClass -ErrorAction SilentlyContinue
  
    if ($DhcpServerOptionDefinition)
    {
        $HashTable= @{
        OptionId = $DhcpServerOptionDefinition.OptionID
        Name =  $DhcpServerOptionDefinition.Name
        AddressFamily = 'IPv4'
        Description = $DhcpServerOptionDefinition.Description
        Type = $DhcpServerOptionDefinition.Type
        VendorClass = $DhcpServerOptionDefinition.VendorClass
        MultiValued = $DhcpServerOptionDefinition.MultiValued
        }
    }
    else
    {
        $HashTable= @{
        OptionId = ''
        Name =  ''
        AddressFamily = ''
        Description = ''
        Type = ''
        VendorClass = ''
        MultiValued = ''
        }
    }
    $HashTable
}
function Set-TargetResource
{
    param
    (
        [Parameter(mandatory)][ValidateSet('Present','Absent')]
        [String] $Ensure,

        [Parameter(mandatory)][Validaterange(1,255)]
        [UInt32] $OptionID,
        
        [Parameter(mandatory)][ValidateNotNullOrEmpty()]
        [String] $Name,

        [AllowEmptyString()]
        [String] $Description = '',

        [Parameter(mandatory)][AllowEmptyString()]
        [String] $VendorClass = '',

        [Parameter(mandatory)][ValidateSet('Byte','Word','DWord','DWordDword','IPv4Address','String','BinaryData','EncapsulatedData')]
        [String] $Type,

        [Parameter()]
        [Boolean] $MultiValued,

        [Parameter(mandatory)] [ValidateSet('IPv4')]
        [String] $AddressFamily
    )
        
    #reading the dhcp option
    $dhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition -OptionId $OptionID -VendorClass $VendorClass -ErrorAction SilentlyContinue

    #testing for present
    if ($Ensure -eq 'Present')
    {
        #testing if exists
        if ($dhcpServerOptionDefinition)
        {
            #if it exists and  any of multivalued, type or vendorclass is being changed remove then re-add the whole option definition
            if (($dhcpServerOptionDefinition.type -ne $Type) -or ($dhcpServerOptionDefinition.MultiValued -ne $MultiValued) -or ($dhcpServerOptionDefinition.VendorClass -ne $Vendorclass))
            {
                
                $scopeIDMessage = $($LocalizedData.RecreatingOptionDefinitionIDMessage) -f $OptionID, $VendorClass
                Write-Verbose -Message $scopeIDMessage
                Remove-DhcpServerv4OptionDefinition -OptionId $OptionID -VendorClass $VendorClass
                Add-DhcpServerv4OptionDefinition -OptionId $OptionID -name $Name -Type $Type -Description $Description -MultiValued:$MultiValued -VendorClass $Vendorclass
            }
            else
            {
                #if option exists we need only to adjust the parameters
                $SettingIDMessage = $($LocalizedData.SettingOptionDefinitionIDMessage) -f $OptionID, $VendorClass
                Write-Verbose -Message $SettingIDMessage
                set-DhcpServerv4OptionDefinition -OptionId $OptionID -VendorClass $VendorClass -name $Name -Description $Description
            }
        }

        #if option does not exist we need to add it
        else
        {
            $scopeIDMessage = $($LocalizedData.AddingOptionDefinitionIDMessage) -f $OptionID, $VendorClass
            Write-Verbose -Message $scopeIDMessage
            Add-DhcpServerv4OptionDefinition -OptionId $OptionID -name $Name -Type $Type -Description $Description -MultiValued:$MultiValued -VendorClass $Vendorclass
        }
    }
    
    #testing for 'absent'
    else
    {
    if ($dhcpServerOptionDefinition)
        {
            $scopeIDMessage = $($LocalizedData.RemovingOptionDefinitionIDMessage) -f $OptionID,$VendorClass
            Write-Verbose -Message $scopeIDMessage            
            Remove-DhcpServerv4OptionDefinition -OptionId $OptionID -VendorClass $VendorClass
        }
    
    }
}
function Test-TargetResource
{
    param
    (
        [Parameter(Mandatory)][ValidateSet('Present','Absent')]
        [System.String] $Ensure,
        
        [Parameter(mandatory)][Validaterange(1,255)]
        [UInt32] $OptionID,
        
        [Parameter(mandatory)][ValidateNotNullOrEmpty()]
        [String] $Name,

        [AllowEmptyString()]
        [String] $Description = '',

        [Parameter(mandatory)][AllowEmptyString()]
        [String] $VendorClass = '',

        [Parameter(mandatory)][ValidateSet('Byte','Word','DWord','DWordDword','IPv4Address','String','BinaryData','EncapsulatedData')]
        [String] $Type,

        [Parameter()]
        [Boolean] $MultiValued,

        [Parameter(mandatory)] [ValidateSet('IPv4')]
        [String] $AddressFamily
    )
    
    #region Input Validation

    # Check for DhcpServer module/role
    Assert-Module -moduleName DHCPServer
    #endregion Input Validation

    $TestingIDMessage = $($LocalizedData.TestingOptionDefinitionIDMessage) -f $OptionID, $VendorClass
    #geting the dhcp option definition
    Write-Verbose -Message $TestingIDMessage

    $GettingIDMessage = $($LocalizedData.GettingOptionDefinitionIDMessage) -f $OptionID, $VendorClass
    Write-Verbose -Message $GettingIDMessage
    $DhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition -OptionId $OptionID -VendorClass $VendorClass -ErrorAction SilentlyContinue
    
    if ($DhcpServerOptionDefinition)
    {
        $FoundIDMessage = $($LocalizedData.FoundOptionDefinitionIDMessage) -f $OptionID, $VendorClass
        Write-Verbose $FoundIDMessage
    }

    #testing for Ensure = Present
    if ($Ensure -eq 'Present')
    {
        #Testing if $$DhcpServerOptionDefinition is not null       
        if ($DhcpServerOptionDefinition)
        {
            $ComparingIDMessage = $($LocalizedData.ComparingOptionDefinitionIDMessage) -f $OptionID, $VendorClass
            Write-Verbose $ComparingIDMessage
            
            #Since $DhcpServerOptionDefinition is not null compare all the Values
            if (($DhcpServerOptionDefinition.OptionID -eq $OptionID) -and ($DhcpServerOptionDefinition.Name -eq $Name) -and ($DhcpServerOptionDefinition.Description -eq $Description) -and ($DhcpServerOptionDefinition.VendorClass -eq $VendorClass) -and ($DhcpServerOptionDefinition.Type -eq $Type) -and ($DhcpServerOptionDefinition.Multivalued -eq $MultiValued))
            {
                $ExactMatchIDMessage = $($LocalizedData.ExactMatchOptionDefinitionIDMessage) -f $OptionID, $VendorClass
                Write-Verbose $ExactMatchIDMessage

                $result = $true
            }
            else
            {
                $NotMatchIDMessage = $($LocalizedData.NotMatchOptionDefinitionIDMessage) -f $OptionID, $VendorClass
                Write-Verbose $NotMatchIDMessage
                $result = $false            
            }
        }
        else
        {
            #If $DhcpServerOptionDefinition is null return false
            $Result = $false
        }
    }
    #If ensure = Absent
    else
    {
        if ($DhcpServerOptionDefinition)
        {
            #testing if $DhcpServerOptionDefinition is not null, if it exists return false
            $result = $false
        }
        else
        {
            $result = $true
        }
    }
$result
}
