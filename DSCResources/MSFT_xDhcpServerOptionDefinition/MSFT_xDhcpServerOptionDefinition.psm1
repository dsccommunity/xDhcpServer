function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter()] [ValidateNotNullOrEmpty()]
        [String]$Name,

        [Parameter()] [ValidateNotNullOrEmpty()]
        [UInt32]$OptionID,

        [Parameter()] [ValidateSet('Byte,Word,DWord,DWordDWord,IPv4Address,String,BinaryData,EncapsulatedData')]
        [String]$Type,

        [Parameter()]
        [string]$Description,
        
        [Parameter()]
        [bool]$MultiValued,

        [Parameter()] [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4'
    )


    $ensure = 'Absent'
    try
    {
        $dhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition
    }
    catch
    {
    }

#region Input Validation

#endregion Input Validation


}
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter()] [ValidateNotNullOrEmpty()]
        [String]$Name,

        [Parameter()] [ValidateNotNullOrEmpty()]
        [UInt32]$OptionID,

        [Parameter()] [ValidateSet('Byte','Word','DWord','DWordDWord','IPv4Address','String','BinaryData','EncapsulatedData')]
        [String]$Type,

        [Parameter()]
        [string]$Description,
        
        [Parameter()]
        [bool]$MultiValued = $false,

        [Parameter()] [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4',

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present'
    )

        
    #reading the dhcp option
    $dhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition -OptionId $OptionID -ErrorAction SilentlyContinue

    #testing for present
    if ($Ensure -eq 'Present')
    {
        #testing if exists
        if ($dhcpServerOptionDefinition)
        {
            #if option exists we need only to adjust the parameters
            Write-Verbose "Modifying DHCP Option Definition $OptionID"
            set-DhcpServerv4OptionDefinition -OptionId $OptionID -name $Name
        }

        else
        {
            #if option does not exist we need to add it
            write-verbose "Adding DHCP Option Definition $OptionID"
            if ($MultiValued)
            {
                Add-DhcpServerv4OptionDefinition -OptionId $OptionID -name $Name -Type $Type -Description $Description -MultiValued
            }
            else
            {
                Add-DhcpServerv4OptionDefinition -OptionId $OptionID -name $Name -Type $Type -Description $Description
            }

        }
    }
    



}
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter()] [ValidateNotNullOrEmpty()]
        [String]$Name,
         
        [Parameter()] [ValidateNotNullOrEmpty()]
        [UInt32]$OptionID,

        [Parameter()] [ValidateSet('Byte,Word,DWord,DWordDWord,IPv4Address,String,BinaryData,EncapsulatedData')]
        [String]$Type,

        [Parameter()]
        [string]$Description,
        
        [Parameter()]
        [bool]$MultiValued = $false,

        [Parameter()] [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4',

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present'
    )
#region Input Validation

    # Check for DhcpServer module/role
    #Assert-Module -moduleName DHCPServer



#endregion Input Validation


try
{
    #geting the dhcp option definition
    Write-Verbose "Getting DHCP ServerOptionDefinition $OptionID"
    $dhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition -OptionId $OptionID -ErrorAction SilentlyContinue -ErrorVariable err
    
    #testing for Present
    if ($Ensure -eq 'Present')
    {
        if ($dhcpServerOptionDefinition)
        {
            #dhcp server option # exists
            $Result = $true
        }
    }
    # If option # not exists return false.
    else
    {
        $Result = $false
    }
    

}
catch
{
}

$Result
}
