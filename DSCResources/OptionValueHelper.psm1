# Localized messages
data LocalizedData
{
    # Culture="en-US"
    ConvertFrom-StringData @'
    ServerGettingValueMessage            = Getting DHCP server option value "{0}" with vendorclass "{1}" and userclass "{2}".
    ServerExactMatchValueMessage         = Found DHCP server option value "{0}" with vendorclass "{1}" and userclass "{2}".
    ServerRemoveValueMessage             = Removing DHCP server option value "{0}" with vendorclass "{1}" and userclass "{2}".
    ServerSettingValueMessage            = Setting DHCP server option value "{0}" with vendorclass "{1}" and userclass "{2}".
    ServerFoundAndRemoveValueMessage     = Found DHCP server option value "{0}" with vendorclass "{1}" and userclass "{2}" should remove it.
    ServerNotFoundDoNothingValueMessage  = DHCP server option value "{0}" with vendorclass "{1}" and userclass "{2}" not found, should do nothing.
    ServerNotFoundValueMessage           = DHCP server option value "{0}" with vendorclass "{1}" and userclass "{2}" not found.
'@
}
   <#
   .SYNOPSIS
        Helper function to get a DHCP option value.

    .PARAMETER ApplyTo
        Specify where to get the DHCP option from.
    
    .PARAMETER OptionId
        The ID of the option.

    .PARAMETER OptionValue
        The data value option.
        
    .PARAMETER VendorClass
        The vendor class of the option. Use an empty string for standard class.

    .PARAMETER UserClass
        The user class of the option.
    
    .PARAMETER ScopeId
        If used, the scope ID to get the option from.

    .PARAMETER PolicyName
        If used, the policy name to get the option from.
    
    .PARAMETER ReservedIP
        If used, the reserved IP to get the option from.

    .PARAMETER AddressFamily
        The option definition address family (IPv4 or IPv6). Currently only the IPv4 is supported.

    .PARAMETER Ensure
        When set to 'Present', the option will be created.
        When set to 'Absent', the option will be removed.
#>
function Get-TargetResourceHelper
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Server','Scope','Policy','ReservedIP')]
        [String]
        $ApplyTo,

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

        [parameter()]
        [AllowNull()]
        [String]
        $ScopeId,

        [parameter()]
        [AllowNull()]
        [String]
        $PolicyName,

        [parameter()]
        [AllowNull()]
        [ipaddress]
        $ReservedIP,
        
        [parameter(Mandatory = $true)]
        [ValidateSet('IPv4')]
        [String]
        $AddressFamily,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    #region Input Validation

    # Check for DhcpServer module/role
    Assert-Module -moduleName DHCPServer
    
    #endregion Input Validation

  # Checking if option needs to be configured for server, DHCP scope, Policy or reservedIP
    switch ($ApplyTo)
    {

        'Server'
        {
             # Geting the dhcp server option Value
             $serverGettingValueMessage = $localizedData.ServerGettingValueMessage -f $OptionId, $VendorClass, $UserClass
             Write-Verbose $serverGettingValueMessage
             $currentConfiguration = Get-DhcpServerv4OptionValue -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass -ErrorAction SilentlyContinue
        }

        'DhcpScope'
        {
            #$currentConfiguration = Get-DhcpServerv4OptionValue -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass -ScopeId $ScopeId -ErrorAction SilentlyContinue
        }

        'Policy'
        {
            #$currentConfiguration = Get-DhcpServerv4OptionValue -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass -PolicyName $PolicyName -ErrorAction SilentlyContinue
        }

        'ReservedIP'
        {
            #$currentConfiguration = Get-DhcpServerv4OptionValue -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass -ReservedIP $ReservedIP -ErrorAction SilentlyContinue
        }
    }

    # Testing for null
    if ($currentConfiguration)
    {
        $hashTable = @{
            ApplyTo       = $ApplyTo
            OptionId      = $currentConfiguration.OptionID
            OptionValue   = $currentConfiguration.OptionValue
            VendorClass   = $currentConfiguration.VendorClass
            UserClass     = $currentConfiguration.UserClass
            ScopeId       = $ScopeId
            PolicyName    = $PolicyName
            ReservedIP    = $ReservedIP
            AddressFamily = $AddressFamily
            Ensure        = 'Present'
        }
    }
    else
    {
        $hashTable = @{
            ApplyTo       = $null
            OptionId      = $null
            OptionValue   = $null
            VendorClass   = $null
            UserClass     = $null
            ScopeId       = $null
            PolicyName    = $null
            ReservedIP    = $null
            AddressFamily = $null
            Ensure        = 'Absent'
        }
    }

    $hashTable
}

   <#
   .SYNOPSIS
        Helper function to test a DHCP option value.

    .PARAMETER ApplyTo
        Specify where to test the DHCP option from.
    
    .PARAMETER OptionId
        The ID of the option.

    .PARAMETER OptionValue
        The data value option.
        
    .PARAMETER VendorClass
        The vendor class of the option. Use an empty string for standard class.

    .PARAMETER UserClass
        The user class of the option.
    
    .PARAMETER ScopeId
        If used, the scope ID to test the option from.

    .PARAMETER PolicyName
        If used, the policy name to test the option from.
    
    .PARAMETER ReservedIP
        If used, the reserved IP to test the option from.

    .PARAMETER AddressFamily
        The option definition address family (IPv4 or IPv6). Currently only the IPv4 is supported.

    .PARAMETER Ensure
        When set to 'Present', the option will be created.
        When set to 'Absent', the option will be removed.
#>
function Test-TargetResourceHelper
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Server','Scope','Policy','ReservedIP')]
        [String]
        $ApplyTo,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [UInt32]
        $OptionId,

        [parameter(Mandatory = $true)]
        [String[]]
        $OptionValue,

        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [String]
        $VendorClass,

        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [String]
        $UserClass,

        [parameter()]
        [AllowNull()]
        [String]
        $ScopeId,

        [parameter()]
        [AllowNull()]
        [String]
        $PolicyName,

        [parameter()]
        [AllowNull()]
        [ipaddress]
        $ReservedIP,
        
        [parameter(Mandatory = $true)]
        [ValidateSet('IPv4')]
        [String]
        $AddressFamily,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [System.String]
        $Ensure = 'Present'
    )

     # Checking if option needs to be configured for server, DHCP scope, Policy or reservedIP
    switch ($ApplyTo)
    {
        'Server'
        {
            # Trying to get the option value
            $currentConfiguration = Get-TargetResourceHelper -ApplyTo 'Server' -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass -AddressFamily $AddressFamily -Ensure $Ensure
            # Testing for Ensure = Present
            if ($Ensure -eq 'Present')
            {
                if (($currentConfiguration.OptionId -eq $OptionId) -and ($currentConfiguration.OptionValue -eq $OptionValue) -and ($currentConfiguration.VendorClass -eq $VendorClass) -and ($currentConfiguration.UserClass -eq $UserClass))
                {
                    # Found an exact match
                    $serverExactMatchValueMessage = $localizedData.ServerExactMatchValueMessage -f $OptionId, $VendorClass, $UserClass
                    Write-Verbose $serverExactMatchValueMessage
                    $result = $true
                }
                else
                {                    
                    # Not found Option Value
                    $serverNotFoundValueMessage = $localizedData.ServerNotFoundValueMessage -f $OptionId, $VendorClass, $UserClass
                    Write-Verbose $serverNotFoundValueMessage
                    $result = $false
                }
            }

            # Ensure = 'Absent'
            else
            {
                if (($currentConfiguration.OptionId -eq $OptionId) -and ($currentConfiguration.OptionValue -eq $OptionValue) -and ($currentConfiguration.VendorClass -eq $VendorClass) -and ($currentConfiguration.UserClass -eq $UserClass))
                {
                    # Found an exact match, should return $false since it should not be here
                    $serverFoundAndRemoveValueMessage = $localizedData.ServerFoundAndRemoveValueMessage -f $OptionId, $VendorClass, $UserClass
                    Write-Verbose $serverFoundAndRemoveValueMessage
                    $result = $false
                }
                else
                {
                    # Not found Option Value, return $true
                    $serverNotFoundDoNothingValueMessage = $localizedData.ServerNotFoundDoNothingValueMessage -f $OptionId, $VendorClass, $UserClass
                    Write-Verbose $serverNotFoundDoNothingValueMessage
                    $result = $true
                }       
            }   
        }

        'DhcpScope'
        {
        
        }

        'Policy'
        {
        
        }

        'ReservedIP'
        {
        
        }
    }

    $result
}
   <#
   .SYNOPSIS
        Helper function to set a DHCP option value.

    .PARAMETER ApplyTo
        Specify where to set the DHCP option from.
    
    .PARAMETER OptionId
        The ID of the option.

    .PARAMETER OptionValue
        The data value option.
        
    .PARAMETER VendorClass
        The vendor class of the option. Use an empty string for standard class.

    .PARAMETER UserClass
        The user class of the option.
    
    .PARAMETER ScopeId
        If used, the scope ID to set the option.

    .PARAMETER PolicyName
        If used, the policy name to set the option.
    
    .PARAMETER ReservedIP
        If used, the reserved IP to set the option.

    .PARAMETER AddressFamily
        The option definition address family (IPv4 or IPv6). Currently only the IPv4 is supported.

    .PARAMETER Ensure
        When set to 'Present', the option will be created.
        When set to 'Absent', the option will be removed.
#>
function Set-TargetResourceHelper
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Server','Scope','Policy','ReservedIP')]
        [String]
        $ApplyTo,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [UInt32]
        $OptionId,

        [parameter(Mandatory = $true)]
        [String[]]
        $OptionValue,

        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [String]
        $VendorClass,

        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [String]
        $UserClass,

        [parameter()]
        [AllowNull()]
        [String]
        $ScopeId,

        [parameter()]
        [AllowNull()]
        [String]
        $PolicyName,

        [parameter()]
        [AllowNull()]
        [ipaddress]
        $ReservedIP,
        
        [parameter(Mandatory = $true)]
        [ValidateSet('IPv4')]
        [String]
        $AddressFamily,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    # Checking if option needs to be configured for server, DHCP scope, Policy or reservedIP
    switch ($ApplyTo)
    {
        'Server'
        {
            $currentConfiguration = Get-TargetResourceHelper -ApplyTo 'Server' -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass -AddressFamily $AddressFamily -Ensure $Ensure
    
            # Testing for Ensure = Present
            if ($Ensure -eq 'Present')
            {
                if (($currentConfiguration.OptionId -eq $OptionId) -and ($currentConfiguration.OptionValue -eq $OptionValue) -and ($currentConfiguration.VendorClass -eq $VendorClass) -and ($currentConfiguration.UserClass -eq $UserClass))
                {
                    # Found a Value match
                    $serverExactMatchValueMessage = $localizedData.ServerExactMatchValueMessage -f $OptionId, $VendorClass
                    Write-Verbose $serverExactMatchValueMessage
                }
                else
                {
                    # Value not found, setting it
                    $serverSettingValueMessage = $localizedData.ServerSettingValueMessage
                    Write-Verbose $serverSettingValueMessage
                    Set-DhcpServerv4OptionValue -OptionId $OptionId -Value $OptionValue -VendorClass $VendorClass -UserClass $UserClass
                }
            }

            # Ensure = 'Absent'
            else
            {
                # If it exists and Ensure is 'Present' we should remove it
                if ($currentConfiguration.Ensure -eq 'Present')
                {
                    $serverRemoveValueMessage = $localizedData.ServerRemoveValueMessage
                    Write-Verbose $serverRemoveValueMessage
                    Remove-DhcpServerv4OptionValue -OptionId $currentConfiguration.OptionId -VendorClass $VendorClass -UserClass $UserClass
                }
            }   
        }

        'DhcpScope'
        {
            $currentConfiguration = Get-TargetResourceHelper -ApplyTo 'Scope' -OptionId $OptionId -ScopeId $ScopeId -VendorClass $VendorClass -UserClass $UserClass -AddressFamily $AddressFamily -Ensure $Ensure
        }

        'Policy'
        {
        
        }

        'ReservedIP'
        {
        
        }
    }
}
