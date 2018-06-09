# Localized messages
data LocalizedData
{
    # Culture="en-US"
    ConvertFrom-StringData @'
    ServerGettingValueMessage                  = Getting DHCP server option value "{0}" with vendor class "{1}" and user class "{2}".
    ServerExactMatchValueMessage               = Found DHCP server option value "{0}" with vendor class "{1}" and user class "{2}".
    ServerRemoveValueMessage                   = Removing DHCP server option value "{0}" with vendor class "{1}" and user class "{2}".
    ServerSettingValueMessage                  = Setting DHCP server option value "{0}" with vendor class "{1}" and user class "{2}".
    ServerFoundAndRemoveValueMessage           = Found DHCP server option value "{0}" with vendor class "{1}" and user class "{2}", should remove it.
    ServerNotFoundDoNothingValueMessage        = DHCP server option value "{0}" with vendor class "{1}" and user class "{2}" not found, should do nothing.
    ServerNotFoundValueMessage                 = DHCP server option value "{0}" with vendor class "{1}" and user class "{2}" not found.

    ScopeGettingValueMessage                   = Getting DHCP scope option value "{0}" with vendor class "{1}" and user class "{2}" and Scope ID "{3}".
    ScopeExactMatchValueMessage                = Found DHCP server option value "{0}" with vendor class "{1}" and user class "{2}" and scope ID "{3}".
    ScopeRemoveValueMessage                    = Removing DHCP server option value "{0}" with vendor class "{1}" and user class "{2}" and scope ID "{3}".
    ScopeSettingValueMessage                   = Setting DHCP server option value "{0}" with vendor class "{1}" and user class "{2}" and scope ID "{3}".
    ScopeFoundAndRemoveValueMessage            = Found DHCP server option value "{0}" with vendor class "{1}" and user class "{2}" and scope ID "{3}", should remove it.
    ScopeNotFoundDoNothingValueMessage         = DHCP server option value "{0}" with vendor class "{1}" and user class "{2}" and scope ID "{3}" not found, should do nothing.
    ScopeNotFoundValueMessage                  = DHCP server option value "{0}" with vendor class "{1}" and user class "{2}" and scope ID "{3}" not found.

    PolicyGettingValueMessage                  = Getting DHCP policy option value "{0}" and vendor class "{1}" and policy name "{2}" and Scope Id "{3}".
    PolicyExactMatchValueMessage               = Found DHCP policy option value "{0}" with vendor class "{1}" and policy name "{2}".
    PolicyRemoveValueMessage                   = Removing DHCP policy option value "{0}" with vendor class "{1}" and policy name "{2}".
    $policyWithScopeRemoveValueMessage         = Removing DHCP policy option value "{0}" with vendor class "{1}" and policy name "{2}" and scope ID "{3}".
    PolicySettingValueMessage                  = Setting DHCP policy option value "{0}" with vendor class "{1}" and policy name "{2}".
    policyWithScopeSettingValueMessage         = Setting DHCP policy option value "{0}" with vendor class "{1}" and policy name "{2}" and scope ID "{3}".
    PolicyFoundAndRemoveValueMessage           = Found DHCP policy option value "{0}" with vendor class "{1}" and policy name "{2}", should remove it.
    PolicyNotFoundDoNothingValueMessage        = DHCP policy option value "{0}" with vendor class "{1}" and policy name "{2}" not found, should do nothing.
    PolicyNotFoundValueMessage                 = DHCP policy option value "{0}" with vendor class "{1}" and policy name "{2}" not found.

    ReservedIPGettingValueMessage              = Getting DHCP reserved IP option value "{0}" with vendor class "{1}" and user class "{2}" and reserved IP "{3}".
    ReservedIPExactMatchValueMessage           = Found DHCP reserved IP option value "{0}" with vendor class "{1}" and user class "{2}" and reserved IP "{3}".
    ReservedIPRemoveValueMessage               = Removing DHCP reserved IP option value "{0}" with vendor class "{1}" and user class "{2}" and reserved IP "{3}".
    ReservedIPSettingValueMessage              = Setting DHCP reserved IP option value "{0}" with vendor class "{1}" and user class "{2}" and reserved IP "{3}".
    ReservedIPFoundAndRemoveValueMessage       = Found DHCP reserved IP option value "{0}" with vendor class "{1}" and user class "{2}" and reserved IP "{3}", should remove it.
    ReservedIPNotFoundDoNothingValueMessage    = DHCP reserved IP option value "{0}" with vendor class "{1}" and user class "{2}" and reserved IP "{3}" not found, should do nothing.
    ReservedIPNotFoundValueMessage             = DHCP reserved IP option value "{0}" with vendor class "{1}" and user class "{2}" and reserved "{3}" not found.
'@
}


   <#
   .SYNOPSIS
        Helper function to get a DHCP option value.

    .PARAMETER ApplyTo
        Specify where to get the DHCP option from.
    
    .PARAMETER OptionId
        The option ID.

    .PARAMETER OptionValue
        The option data value.
        
    .PARAMETER VendorClass
        The option vendor class. Use an empty string for standard class.

    .PARAMETER UserClass
        The option user class.
    
    .PARAMETER ScopeId
        If used, the option scope ID.

    .PARAMETER PolicyName
        If used, the option policy name.
    
    .PARAMETER ReservedIP
        If used, the option reserved IP.

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
        [String]
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
             # Getting the dhcp server option Value
             $serverGettingValueMessage = $localizedData.ServerGettingValueMessage -f $OptionId, $VendorClass, $UserClass
             Write-Verbose $serverGettingValueMessage
             $currentConfiguration = Get-DhcpServerv4OptionValue -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass -ErrorAction SilentlyContinue
        }

        'Scope'
        {
            # Getting the dhcp server option Value
            $scopeGettingValueMessage = $localizedData.ScopeGettingValueMessage -f $OptionId, $VendorClass, $UserClass, $ScopeId
            Write-Verbose $scopeGettingValueMessage
            $currentConfiguration = Get-DhcpServerv4OptionValue -ScopeId $ScopeId -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass -ErrorAction SilentlyContinue
        }

        'Policy'
        {
            # Getting the dhcp policy option Value
            $policyGettingValueMessage = $localizedData.PolicyGettingValueMessage -f $OptionId, $VendorClass, $ScopeId, $PolicyName
            Write-Verbose $policyGettingValueMessage
            
            # Policy can exist on server or scope level, so we need to address both cases 
            # If ScopeId is $null
            if ($ScopeId)
            {
                $currentConfiguration = Get-DhcpServerv4OptionValue -PolicyName $PolicyName -OptionId $OptionId -VendorClass $VendorClass -ScopeId $ScopeId -ErrorAction SilentlyContinue
            }
            else
            {
                $currentConfiguration = Get-DhcpServerv4OptionValue -PolicyName $PolicyName -OptionId $OptionId -VendorClass $VendorClass -ErrorAction SilentlyContinue
            }
        }

        'ReservedIP'
        {
            # Getting the dhcp reserved IP option Value
            $reservedIPGettingValueMessage = $localizedData.ReservedIPGettingValueMessage -f $OptionId, $VendorClass, $PolicyName, $ReservedIP
            Write-Verbose $reservedIPGettingValueMessage
            $currentConfiguration = Get-DhcpServerv4OptionValue -ReservedIP $ReservedIP -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass -ErrorAction SilentlyContinue
        }
    }

    # Testing for null
    if ($currentConfiguration)
    {
        $hashTable = @{
            ApplyTo       = $ApplyTo
            OptionId      = $currentConfiguration.OptionID
            Value         = $currentConfiguration.Value
            VendorClass   = $currentConfiguration.VendorClass
            UserClass     = $currentConfiguration.UserClass
            ScopeId       = $currentConfiguration.ScopeId
            PolicyName    = $currentConfiguration.PolicyName
            ReservedIP    = $currentConfiguration.ReservedIP
            AddressFamily = $AddressFamily
            Ensure        = 'Present'
        }
    }
    else
    {
        $hashTable = @{
            ApplyTo       = $null
            OptionId      = $null
            Value         = $null
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
        Specify where to test the DHCP option.
    
    .PARAMETER OptionId
        The option ID.

    .PARAMETER Value
        The option data value.
        
    .PARAMETER VendorClass
        The option vendor class. Use an empty string for standard class.

    .PARAMETER UserClass
        The option user class.
    
    .PARAMETER ScopeId
        If used, the option scope ID.

    .PARAMETER PolicyName
        If used, the option policy name.
    
    .PARAMETER ReservedIP
        If used, the option reserved IP.

    .PARAMETER AddressFamily
        The option definition address family (IPv4 or IPv6). Currently only the IPv4 is supported.

    .PARAMETER Ensure
        When set to 'Present', the option will be created.
        When set to 'Absent', the option will be removed.
#>
function Test-TargetResourceHelper
{
    [CmdletBinding()]
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
        $Value,

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
        [String]
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
                # Since we need to compare an array of strings we need to use the Compare-Object cmdlet
                if (($currentConfiguration.Ensure -eq 'Present') -and (@(Compare-Object -ReferenceObject $currentConfiguration.Value -DifferenceObject $Value -SyncWindow 0 -CaseSensitive).Length -eq 0))
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
                if ($currentConfiguration.Ensure -eq 'Present')
                {
                    # Found a match, should return $false since it should not be here
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

        'Scope'
        {
            # Trying to get the option value
            $currentConfiguration = Get-TargetResourceHelper -ApplyTo 'Scope' -ScopeId $ScopeId -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass -AddressFamily $AddressFamily -Ensure $Ensure
            # Testing for Ensure = Present
            if ($Ensure -eq 'Present')
            {
                if (($currentConfiguration.Ensure -eq 'Present') -and (@(Compare-Object -ReferenceObject $currentConfiguration.Value -DifferenceObject $Value -SyncWindow 0 -CaseSensitive).Length -eq 0))
                {
                    # Found an exact match
                    $scopeExactMatchValueMessage = $localizedData.ScopeExactMatchValueMessage -f $OptionId, $VendorClass, $UserClass, $ScopeId
                    Write-Verbose $scopeExactMatchValueMessage
                    $result = $true
                }
                else
                {
                    # Not found Option Value
                    $scopeNotFoundValueMessage = $localizedData.ScopeNotFoundValueMessage -f $OptionId, $VendorClass, $UserClass, $ScopeId
                    Write-Verbose $scopeNotFoundValueMessage
                    $result = $false
                }
            }

            # Ensure = 'Absent'
            else
            {
                if (($currentConfiguration.Ensure -eq 'Present'))
                {
                    # Found a match, should return $false since it should not be here
                    $scopeFoundAndRemoveValueMessage = $localizedData.ScopeFoundAndRemoveValueMessage -f $OptionId, $VendorClass, $UserClass, $ScopeId
                    Write-Verbose $scopeFoundAndRemoveValueMessage
                    $result = $false
                }
                else
                {
                    # Not found Option Value, return $true
                    $scopeNotFoundDoNothingValueMessage = $localizedData.ScopeNotFoundDoNothingValueMessage -f $OptionId, $VendorClass, $UserClass, $ScopeId
                    Write-Verbose $scopeNotFoundDoNothingValueMessage
                    $result = $true
                }       
            }                  
        }

        'Policy'
        {
            # Trying to get the option value
            $currentConfiguration = Get-TargetResourceHelper -ApplyTo 'Policy' -PolicyName $PolicyName -OptionId $OptionId -ScopeId $ScopeId -VendorClass $VendorClass -UserClass $UserClass -AddressFamily $AddressFamily -Ensure $Ensure
            # Testing for Ensure = Present
            if ($Ensure -eq 'Present')
            {
                if (($currentConfiguration.Ensure -eq 'Present') -and (@(Compare-Object -ReferenceObject $currentConfiguration.Value -DifferenceObject $Value -SyncWindow 0 -CaseSensitive).Length -eq 0))
                {
                    # Found an exact match
                    $policyExactMatchValueMessage = $localizedData.PolicyExactMatchValueMessage -f $OptionId, $VendorClass, $PolicyName
                    Write-Verbose $policyExactMatchValueMessage
                    $result = $true
                }
                else
                {                    
                    # Not found Option Value
                    $policyNotFoundValueMessage = $localizedData.PolicyNotFoundValueMessage -f $OptionId, $VendorClass, $PolicyName
                    Write-Verbose $policyNotFoundValueMessage
                    $result = $false
                }
            }

            # Ensure = 'Absent'
            else
            {
                if (($currentConfiguration.Ensure -eq 'Present'))
                {
                    # Found a match, should return $false since it should not be here
                    $policyFoundAndRemoveValueMessage = $localizedData.PolicyFoundAndRemoveValueMessage -f $OptionId, $VendorClass, $PolicyName
                    Write-Verbose $policyFoundAndRemoveValueMessage
                    $result = $false
                }
                else
                {
                    # Not found Option Value, return $true
                    $policyNotFoundDoNothingValueMessage = $localizedData.PolicyNotFoundDoNothingValueMessage -f $OptionId, $VendorClass, $PolicyName
                    Write-Verbose $policyNotFoundDoNothingValueMessage
                    $result = $true
                }       
            }                  
        }

        'ReservedIP'
        {
            # Trying to get the option value
            $currentConfiguration = Get-TargetResourceHelper -ApplyTo 'ReservedIP' -ReservedIP $ReservedIP -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass -AddressFamily $AddressFamily -Ensure $Ensure
            # Testing for Ensure = Present
            if ($Ensure -eq 'Present')
            {
                # Comparing only the data value, since we already found an option ID that matchs the other parameters
                if (($currentConfiguration.Ensure -eq 'Present') -and (@(Compare-Object -ReferenceObject $currentConfiguration.Value -DifferenceObject $Value -SyncWindow 0 -CaseSensitive).Length -eq 0))
                {
                    # Found an exact match
                    $reservedIPExactMatchValueMessage = $localizedData.ReservedIPExactMatchValueMessage -f $OptionId, $VendorClass, $UserClass, $ReservedIP
                    Write-Verbose $reservedIPExactMatchValueMessage
                    $result = $true
                }
                else
                {                    
                    # Not found Option Value
                    $reservedIPNotFoundValueMessage = $localizedData.ReservedIPNotFoundValueMessage -f $OptionId, $VendorClass, $UserClass, $ReservedIP
                    Write-Verbose $reservedIPNotFoundValueMessage
                    $result = $false
                }
            }

            # Ensure = 'Absent'
            else
            {
                if ($currentConfiguration.Ensure -eq 'Present')
                {
                    # Found a match, should return $false since it should not be here
                    $reservedIPFoundAndRemoveValueMessage = $localizedData.ReservedIPFoundAndRemoveValueMessage -f $OptionId, $VendorClass, $UserClass, $ScopeId, $ReservedIP
                    Write-Verbose $reservedIPFoundAndRemoveValueMessage
                    $result = $false
                }
                else
                {
                    # Not found Option Value, return $true
                    $reservedIPNotFoundDoNothingValueMessage = $localizedData.ReservedIPNotFoundDoNothingValueMessage -f $OptionId, $VendorClass, $UserClass, $scopeId, $ReservedIP
                    Write-Verbose $reservedIPNotFoundDoNothingValueMessage
                    $result = $true
                }       
            }                  
        }
    }

    $result
}

   <#
   .SYNOPSIS
        Helper function to set a DHCP option value.

    .PARAMETER ApplyTo
        Specify where to set the DHCP option.
    
    .PARAMETER OptionId
        The option ID.

    .PARAMETER Value
        The option data value.
        
    .PARAMETER VendorClass
        The option vendor class. Use an empty string for standard class.

    .PARAMETER UserClass
        The option user class.
    
    .PARAMETER ScopeId
        If used, the option scope ID.

    .PARAMETER PolicyName
        If used, the option policy name.
    
    .PARAMETER ReservedIP
        If used, the option reserved IP.

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
        $Value,

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
        [String]
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
               $serverSettingValueMessage = $localizedData.ServerSettingValueMessage -f $OptionId, $VendorClass, $UserClass
               Write-Verbose $serverSettingValueMessage
               Set-DhcpServerv4OptionValue -OptionId $OptionId -Value $Value -VendorClass $VendorClass -UserClass $UserClass
            }

            # Ensure = 'Absent'
            else
            {
                # If it exists and Ensure is 'Present' we should remove it
                if ($currentConfiguration.Ensure -eq 'Present')
                {
                    $serverRemoveValueMessage = $localizedData.ServerRemoveValueMessage -f $OptionId, $VendorClass, $UserClass
                    Write-Verbose $serverRemoveValueMessage
                    Remove-DhcpServerv4OptionValue -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass
                }
            }   
        }

        'Scope'
        {
            $currentConfiguration = Get-TargetResourceHelper -ApplyTo 'Scope' -ScopeId $ScopeId -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass -AddressFamily $AddressFamily -Ensure $Ensure
    
            # Testing for Ensure = Present
            if ($Ensure -eq 'Present')
            {
                # If value should be present we just set it
                $scopeSettingValueMessage = $localizedData.ScopeSettingValueMessage -f $OptionId, $VendorClass, $UserClass, $ScopeId
                Write-Verbose $scopeSettingValueMessage
                Set-DhcpServerv4OptionValue -ScopeId $ScopeId -OptionId $OptionId -Value $Value -VendorClass $VendorClass -UserClass $UserClass
            }

            # Ensure = 'Absent'
            else
            {
                # If it exists and Ensure is 'Present' we should remove it
                if ($currentConfiguration.Ensure -eq 'Present')
                {
                    $scopeRemoveValueMessage = $localizedData.ScopeRemoveValueMessage -f $OptionId, $VendorClass, $UserClass, $ScopeId
                    Write-Verbose $scopeRemoveValueMessage
                    Remove-DhcpServerv4OptionValue -ScopeId $ScopeId -OptionId $currentConfiguration.OptionId -VendorClass $VendorClass -UserClass $UserClass
                }
            }   
        }

        'Policy'
        {
            # If $ScopeId exist
            if ($ScopeId)
            {
                $currentConfiguration = Get-TargetResourceHelper -ApplyTo 'Policy' -PolicyName $PolicyName -ScopeId $ScopeId -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass -AddressFamily $AddressFamily -Ensure $Ensure
            
                # Testing for Ensure = Present
                if ($Ensure -eq 'Present')
                {
                    # If value should be present we just set it
                    $policyWithScopeSettingValueMessage = $localizedData.PolicyWithScopeSettingValueMessage -f $OptionId, $VendorClass, $PolicyName, $ScopeId
                    Write-Verbose $policyWithScopeSettingValueMessage
                    Set-DhcpServerv4OptionValue -PolicyName $PolicyName -OptionId $OptionId -ScopeId $ScopeId -Value $Value -VendorClass $VendorClass
                }

                # Ensure = 'Absent'
                else
                {
                    # If it exists and Ensure is 'Present' we should remove it
                    if ($currentConfiguration.Ensure -eq 'Present')
                    {
                        $policyWithScopeRemoveValueMessage = $localizedData.policyWithScopeRemoveValueMessage -f $OptionId, $VendorClass, $PolicyName, $ScopeId
                        Write-Verbose $policyWithScopeRemoveValueMessage                            
                        Remove-DhcpServerv4OptionValue -PolicyName $PolicyName -ScopeId $ScopeId -OptionId $OptionId -VendorClass $VendorClass
                    }
                }
            }
            # If $ScopeId is null
            else
            {
                $currentConfiguration = Get-TargetResourceHelper -ApplyTo 'Policy' -PolicyName $PolicyName -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass -AddressFamily $AddressFamily -Ensure $Ensure
                # Testing for Ensure = Present
                if ($Ensure -eq 'Present')
                {
                    # If value should be present we just set it
                    $policySettingValueMessage = $localizedData.PolicySettingValueMessage -f $OptionId, $VendorClass, $PolicyName
                    Write-Verbose $policySettingValueMessage
                    Set-DhcpServerv4OptionValue -PolicyName $PolicyName -OptionId $OptionId -Value $Value -VendorClass $VendorClass
                }
                else
                {
                    # If it exists and Ensure is 'Present' we should remove it
                    if ($currentConfiguration.Ensure -eq 'Present')
                    {
                        $policyRemoveValueMessage = $localizedData.PolicyRemoveValueMessage -f $OptionId, $VendorClass, $PolicyName
                        Write-Verbose $policyRemoveValueMessage
                        Remove-DhcpServerv4OptionValue -PolicyName $PolicyName -OptionId $OptionId -VendorClass $VendorClass
                    }
                }
            }
        }

        'ReservedIP'
        {
            $currentConfiguration = Get-TargetResourceHelper -ApplyTo 'ReservedIP' -ReservedIP $ReservedIP -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass -AddressFamily $AddressFamily -Ensure $Ensure
    
            # Testing for Ensure = Present
            if ($Ensure -eq 'Present')
            {
                # If value should be present we just set it
                $reservedIPSettingValueMessage = $localizedData.ReservedIPSettingValueMessage -f $OptionId, $VendorClass, $UserClass, $ReservedIP
                Write-Verbose $reservedIPSettingValueMessage
                Set-DhcpServerv4OptionValue -ReservedIP $ReservedIP -OptionId $OptionId -Value $Value -VendorClass $VendorClass -UserClass $UserClass
            }

            # Ensure = 'Absent'
            else
            {
                # If it exists and Ensure is 'Present' we should remove it
                if ($currentConfiguration.Ensure -eq 'Present')
                {
                    $reservedIPRemoveValueMessage = $localizedData.ReservedIPRemoveValueMessage -f $OptionId, $VendorClass, $UserClass, $ReservedIP
                    Write-Verbose $reservedIPRemoveValueMessage
                    Remove-DhcpServerv4OptionValue -ReservedIP $ReservedIP -OptionId $OptionId -VendorClass $VendorClass -UserClass $UserClass
                }
            }   
        }
    }
}
