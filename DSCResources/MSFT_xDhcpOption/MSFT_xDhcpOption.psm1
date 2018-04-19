Import-Module $PSScriptRoot\..\Helper.psm1 -Verbose:$false


# Localized messages
data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
    SettingClassIDMessage     = Setting DHCP Server Class {0}

'@
}


function Get-TargetResource
{
    param
    (
        [Parameter(Mandatory)][ValidateSet('Present','Absent')]
        [System.String] $Ensure,
        
        [parameter(Mandatory)] [ValidateNotNullOrEmpty()]
        [UInt32]$OptionID,

        [parameter(Mandatory)]
        [String[]]$Value,

        [Parameter(Mandatory)][ValidateSet('Server','Scope','Policy','ReservedIP')]
        [String]$ApplyTo,

        [parameter(ParameterSetName='VendorClass')]
        [String] $VendorClass,

        [parameter(ParameterSetName='UserClass')]
        [String] $UserClass
    )
}


function Set-TargetResource
{
    param
    (
        [Parameter(Mandatory)][ValidateSet('Present','Absent')]
        [System.String] $Ensure,
        
        [parameter(Mandatory)] [ValidateNotNullOrEmpty()]
        [UInt32]$OptionID,

        [parameter(Mandatory)]
        [String[]]$Value,

        [Parameter(Mandatory)][ValidateSet('Server','Scope','Policy','ReservedIP')]
        [String]$ApplyTo,

        [parameter(ParameterSetName='VendorClass')]
        [String] $VendorClass,

        [parameter(ParameterSetName='UserClass')]
        [String] $UserClass
    )
}

function Test-TargetResource
{
    param
    (
        [Parameter(Mandatory)][ValidateSet('Present','Absent')]
        [System.String] $Ensure,
        
        [parameter(Mandatory)] [ValidateNotNullOrEmpty()]
        [UInt32]$OptionID,

        [parameter(Mandatory)]
        [String[]]$Value,

        [Parameter(Mandatory)][ValidateSet('Server','Scope','Policy','ReservedIP')]
        [String]$ApplyTo,

        [parameter(ParameterSetName='VendorClass')]
        [String] $VendorClass,

        [parameter(ParameterSetName='UserClass')]
        [String] $UserClass
    )

}