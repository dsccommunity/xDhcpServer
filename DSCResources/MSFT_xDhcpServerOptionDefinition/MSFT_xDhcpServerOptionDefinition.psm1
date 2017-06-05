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

        [Parameter()] [ValidateSet('Byte,Word,DWord,DWordDWord,IPv4Address,String,BinaryData,EncapsulatedData')]
        [String]$Type,

        [Parameter()]
        [string]$Description,
        
        [Parameter()]
        [bool]$MultiValued,

        [Parameter()] [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4',

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present'
    )

}
function test-TargetResource
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
        [bool]$MultiValued,

        [Parameter()] [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4',

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present'
    )
#region Input Validation

    # Check for DhcpServer module/role
    Assert-Module -moduleName DHCPServer


    #geting the dhcp option definition
    $dhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition -OptionId $OptionID -ErrorAction SilentlyContinue -ErrorVariable err

    if($err)
    {
        $errorMsg = $($LocalizedData.InvalidScopeIdMessage) -f $ScopeID
        New-TerminatingError -errorId ScopeIdNotFound -errorMessage $errorMsg -errorCategory InvalidOperation
    }



#endregion Input Validation


try
{
    #geting the dhcp option definition
    $dhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition -OptionId $OptionID -ErrorAction SilentlyContinue -ErrorVariable err
    

    #testing for Present
    if ($Ensure -eq 'Present')
    {
        if (!$dhcpServerOptionDefinition)
        {
            #dhcp server option does not exists
            $Result = $false
        }
    }
    # If Options should be absent, return False or remove it
    else
    {
        
    }
    



}
catch()
{
}

}