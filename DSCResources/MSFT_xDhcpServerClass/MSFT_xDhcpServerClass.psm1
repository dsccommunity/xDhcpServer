function Get-TargetResource
{
    param
    (
        [Parameter(Mandatory)][ValidateSet('Present','Absent')]
        [System.String] $Ensure,
        
        [parameter(Mandatory)] [ValidateNotNullOrEmpty()]
        [String]$Name,

        [parameter(Mandatory)][ValidateSet('Vendor','User')]
        [String]$Type,

        [parameter(Mandatory)][ValidateNotNullOrEmpty()]
        [string] $AsciiData,
        
        [AllowEmptyString()]
        [string]$Description = '',
        
        [parameter(Mandatory)][ValidateSet('IPv4')]
        [String]$AddressFamily
    )
    
    $DhcpServerClass = Get-DhcpServerv4Class -Name $Name -ErrorAction SilentlyContinue

    if ($DhcpServerClass)
    {
        $HashTable = @{
        'Name'=$DhcpServerClass.Name
        'Type'=$DhcpServerClass.Type
        'AsciiData' = $DhcpServerClass.AsciiData
        'Description' = $DhcpServerClass.Description
        'AddressFamily' = 'IPv4'
        }
    }
    else
    {
        $HashTable = @{
        'Name' = ''
        'Type' = ''
        'AsciiData' = ''
        'Description' = ''
        'AddressFamily' = ''
        }
    }

    $HashTable

}
function Set-TargetResource
{
    param
    (
        [Parameter(Mandatory)][ValidateSet('Present','Absent')]
        [System.String] $Ensure,
        
        [parameter(Mandatory)] [ValidateNotNullOrEmpty()]
        [String]$Name,

        [parameter(Mandatory)][ValidateSet('Vendor','User')]
        [String]$Type,

        [parameter(Mandatory)][ValidateNotNullOrEmpty()]
        [string] $AsciiData,
        
        [AllowEmptyString()]
        [string]$Description = '',
        
        [parameter(Mandatory)][ValidateSet('IPv4')]
        [String]$AddressFamily
    )
        

    $DhcpServerClass = Get-DhcpServerv4Class $Name -ErrorAction SilentlyContinue
    
    #testing for ensure = present
    if ($Ensure -eq 'Present')
    {
        #testing if class exists
        if ($DhcpServerClass)
        {
            #if it exists we use the set verb
            Write-Verbose "Setting DHCP Server Class $Name"
            set-DhcpServerv4Class -Name $Name -Type $Type -Data $AsciiData -Description $Description
        }

        #class not exists
        else
        {
            Write-Verbose "Adding DHCP Server Class $Name"
            Add-DhcpServerv4Class -Name $Name -Type $Type -Data $AsciiData -Description $Description
        }
    }
    
    #ensure = absent
    else
    {
        Write-Verbose "Removing DHCP Server Class $Name"
        Remove-DhcpServerv4Class -Name $Name -Type $Type
    }
}
function Test-TargetResource
{
    param
    (
        [Parameter(Mandatory)][ValidateSet('Present','Absent')]
        [System.String] $Ensure,
        
        [parameter(Mandatory)] [ValidateNotNullOrEmpty()]
        [String]$Name,

        [parameter(Mandatory)][ValidateSet('Vendor','User')]
        [String]$Type,

        [parameter(Mandatory)][ValidateNotNullOrEmpty()]
        [string] $AsciiData,
        
        [AllowEmptyString()]
        [string]$Description = '',
        
        [parameter(Mandatory)][ValidateSet('IPv4')]
        [String]$AddressFamily
    )
    
    $DhcpServerClass = Get-DhcpServerv4Class -Name $Name -ErrorAction SilentlyContinue

    #testing for ensure = present
    if ($Ensure -eq 'Present')
    {
        #testing if $DhcpServerClass is not null
        if ($DhcpServerClass)
        {
            #since $DhcpServerClass is not null compare the values
            if (($DhcpServerClass.Type -eq $Type) -and ($DhcpServerClass.asciiData -eq $AsciiData) -and ($DhcpServerClass.Description -eq $Description))
            {
                $result = $true
            }

            else
            {
                $result = $false
            }
        }
        #if $DhcpServerClass return false
        else
        {
            $result = $false        
        }
    }
    
    
    #ensure = absent
    else
    {
        #testing if $DhcpServerClass is not null, if it exists return false
        if ($DhcpServerClass)
        {
            $result = $false            
        }
        #if it not exists return true
        else
        {
            $result = $true
        }
    }
    $result
}