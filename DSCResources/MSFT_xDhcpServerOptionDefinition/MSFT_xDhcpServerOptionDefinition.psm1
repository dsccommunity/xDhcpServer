Import-Module $PSScriptRoot\..\Helper.psm1 -Verbose:$false

# Localized messages
data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
    GettingOptionDefinitionIDMessage = Getting DHCP Server Option Definition {0}
    RemovingOptionDefinitionIDMessage    = Removing DHCP Server Option Definition {0}
    RecreatingOptionDefinitionIDMessage = Recreating {0}
    AddingOptionDefinitionIDMessage = Adding DHCP server option definition {0}
    SettingOptionDefinitionIDMessage = "Setting DHCP server option definition {0}"
'@
}



function Get-TargetResource
{
    param
    (
        [Parameter(mandatory)][ValidateSet('Present','Absent')]
        [String] $Ensure,

        [Parameter(mandatory)][Validaterange(1,255)]
        [UInt32]$OptionID,
        
        [Parameter(mandatory)][ValidateNotNullOrEmpty()]
        [String]$Name,

        [AllowEmptyString()]
        [String]$Description = '',

        [AllowEmptyString()]
        [String]$VendorClass,

        [Parameter(mandatory)][ValidateSet('Byte','Word','DWord','DWordDword','IPv4Address','String','BinaryData','EncapsulatedData')]
        [String] $Type,

        [Parameter()]
        [Bool]$MultiValued,

        [Parameter()]
        [String[]]$DefaultValue,

        [Parameter()] [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4'
    )


    #region Input Validation

    #Check for DhcpServer module/role
    Assert-Module -moduleName DHCPServer

    #endregion Input Validation
     
    $DhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition -OptionId $OptionID -ErrorAction SilentlyContinue
  
    if ($DhcpServerOptionDefinition)
    {
        $HashTable= @{
        OptionId = $DhcpServerOptionDefinition.OptionID
        Name =  $DhcpServerOptionDefinition.Name
        AddressFamily = 'IPv4'
        Description = $DhcpServerOptionDefinition.Description
        Type = $DhcpServerOptionDefinition.Type
        DefaultValue = $DhcpServerOptionDefinition.DefaultValue
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
        DefaultValue = ''
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
        [UInt32]$OptionID,
        
        [Parameter(mandatory)][ValidateNotNullOrEmpty()]
        [String]$Name,

        [AllowEmptyString()]
        [String]$Description = '',

        [AllowEmptyString()]
        [String]$VendorClass,

        [Parameter(mandatory)][ValidateSet('Byte','Word','DWord','DWordDword','IPv4Address','String','BinaryData','EncapsulatedData')]
        [String] $Type,

        [Parameter()]
        [Bool]$MultiValued,

        [Parameter()]
        [String[]]$DefaultValue,

        [Parameter()] [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4'
    )
        
    #reading the dhcp option
    $dhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition -OptionId $OptionID -ErrorAction SilentlyContinue

    #testing for present
    if ($Ensure -eq 'Present')
    {
        #testing if exists
        if ($dhcpServerOptionDefinition)
        {
            #if it exists and  any of multivalued, type or vendorclass is being changed remove then re-add the whole option definition
            if (($dhcpServerOptionDefinition.type -ne $Type) -or ($dhcpServerOptionDefinition.MultiValued -ne $MultiValued) -or ($dhcpServerOptionDefinition.VendorClass -ne $Vendorclass))
            {
                
                Write-Verbose "($LocalizedData.RecreatingptionDefinitionIDMessage) $OptionID"
                Remove-DhcpServerv4OptionDefinition -OptionId $OptionID
                Add-DhcpServerv4OptionDefinition -OptionId $OptionID -name $Name -Type $Type -Description $Description -MultiValued:$MultiValued -VendorClass $Vendorclass
            }
            else
            {
                #if option exists we need only to adjust the parameters
                Write-Verbose "($LocalizedData.SettingOptionDefinitionIDMessage) $OptionID"
                set-DhcpServerv4OptionDefinition -OptionId $OptionID -name $Name -Description $Description
            }
        }

        #if option does not exist we need to add it
        else
        {
            Write-Verbose "($LocalizedData.AddingOptionDefinitionIDMessage) $OptionID"
            Add-DhcpServerv4OptionDefinition -OptionId $OptionID -name $Name -Type $Type -Description $Description -MultiValued:$MultiValued -VendorClass $Vendorclass
        }
    }
    
    #testing for 'absent'
    else
    {
    if ($dhcpServerOptionDefinition)
        {
            
            Write-Verbose "$($LocalizedData.RemovingOptionDefinitionIDMessage) $OptionID"
            Remove-DhcpServerv4OptionDefinition -OptionId $OptionID
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
        [UInt32]$OptionID,
        
        [Parameter(mandatory)][ValidateNotNullOrEmpty()]
        [String]$Name,

        [AllowEmptyString()]
        [String]$Description = '',

        [AllowEmptyString()]
        [String]$VendorClass,

        [Parameter(mandatory)][ValidateSet('Byte','Word','DWord','DWordDword','IPv4Address','String','BinaryData','EncapsulatedData')]
        [String] $Type,

        [Parameter()]
        [Bool]$MultiValued,

        [Parameter()]
        [String[]]$DefaultValue,

        [Parameter()] [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4'
    )
    
    #region Input Validation

    # Check for DhcpServer module/role
    Assert-Module -moduleName DHCPServer
    #endregion Input Validation

    #geting the dhcp option definition
    Write-Verbose "$($LocalizedData.GettingOptionDefinitionMessage) $OptionID"
    $DhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition -OptionId $OptionID -ErrorAction SilentlyContinue
    
    #testing for Ensure = Present
    if ($Ensure -eq 'Present')
    {

        #Testing if $$DhcpServerOptionDefinition is not null       
        if ($DhcpServerOptionDefinition)
        {
            #Since $DhcpServerOptionDefinition is not null compare all the Values
            if (($DhcpServerOptionDefinition.OptionID -eq $OptionID) -and ($DhcpServerOptionDefinition.Name -eq $Name) -and ($DhcpServerOptionDefinition.Description -eq $Description) -and ($DhcpServerOptionDefinition.VendorClass -eq $VendorClass) -and ($DhcpServerOptionDefinition.Type -eq $Type) -and ($DhcpServerOptionDefinition.Multivalued -eq $MultiValued) -and ($DhcpServerOptionDefinition.Defaultvalue -eq $DefaultValue))
            {
                $result = $true
            }
            else
            {
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
