Import-Module $PSScriptRoot\..\Helper.psm1 -Verbose:$false

# Localized messages
data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
AddingExclusionRangeMessage   = Adding DHCP server exclusion range with the given ScopeId...
CheckExclusionRangeMessage    = Checking DHCP server exclusion range with the given ScopeId...
SetExclusionRangeMessage      = DHCP server exclusion range with ScopeId {0} is now present
RemovingExclusionRangeMessage = Removing DHCP server exclusion range with the given ScopeId...
DeleteExclusionRangeMessage   = DHCP server exclusion range with the given ScopeId is now absent
TestExclusionRangeMessage     = DHCP server exclusion range with the given ScopeId is {0} and it should be {1}

CheckPropertyMessage      = Checking DHCP server scope {0} ...
NotDesiredPropertyMessage = DHCP server scope {0} is not correct. Expected {1}, actual {2}
DesiredPropertyMessage    = DHCP server scope {0} is correct.
SetPropertyMessage        = DHCP server scope {0} is set to {1}.
'@
}

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory)]
        [String]$ScopeId,

        [parameter(Mandatory)]
        [String]$StartRange,

        [parameter(Mandatory)]
        [String]$EndRange,

        [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4'

    )
#region Input Validation

    # Check for DhcpServer module/role
    Assert-Module -moduleName DHCPServer

    # Convert the ScopeId to be a valid IPAddress
    $ScopeId = (Get-ValidIpAddress -ipString $ScopeId -AddressFamily $AddressFamily -parameterName 'ScopeId').ToString()

    # Convert the Start Range to be a valid IPAddress
    $StartRange = (Get-ValidIpAddress -ipString $StartRange -AddressFamily $AddressFamily -parameterName 'StartRange').ToString()

    # Convert the End Range to be a valid IPAddress
    $EndRange = (Get-ValidIpAddress -ipString $EndRange -AddressFamily $AddressFamily -parameterName 'EndRange').ToString()

    # Check to ensure startRange is smaller than endRange
    if($EndRange.Address -lt $StartRange.Address)
    {
        $errorMsg = $LocalizedData.InvalidStartAndEndRangeMessage
        New-TerminatingError -errorId RangeNotCorrect -errorMessage $errorMsg -errorCategory InvalidArgument
    }

#endregion Input Validation

    if ($AddressFamily -eq "IPv4")
    {
      $exclusionRangeSelector = ($_.ScopeId -eq $ScopeId) `
                              -and ($_.StartRange -eq $StartRange) `
                              -and ($_.EndRange -eq $EndRange)

      $dhcpExclusionRange = Get-DhcpServerv4ExclusionRange | Where-Object { $exclusionRangeSelector }
    }
    elseif ($AddressFamily -eq "IPv6")
    {
      # NOTE: We'll never hit this because 'IPv4' is the only memeber of $AddressFamily's ValidateSet
      # TODO: One day do something with IPv6
    }

    if($dhcpExclusionRange)
    {
        $ensure = 'Present'
    }
    else
    {
        $ensure = 'Absent'
    }

    @{
        ScopeId       = $dhcpExclusionRange.ScopeId
        StartRange  = $dhcpExclusionRange.StartRange
        EndRange    = $dhcpExclusionRange.EndRange
        AddressFamily = $AddressFamily
        Ensure        = $Ensure
    }
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory)]
        [String]$ScopeId,

        [parameter(Mandatory)]
        [String]$StartRange,

        [parameter(Mandatory)]
        [String]$EndRange,

        [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4',

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present'
    )


    if($PSBoundParameters.ContainsKey('Debug'))
    {
        $null = $PSBoundParameters.Remove('Debug')
    }

    if($PSBoundParameters.ContainsKey('AddressFamily')) {
        $null = $PSBoundParameters.Remove('AddressFamily')
    }

    Validate-ResourceProperties @PSBoundParameters -Apply

}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory)]
        [String]$ScopeId,

        [parameter(Mandatory)]
        [String]$StartRange,

        [parameter(Mandatory)]
        [String]$EndRange,

        [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4',

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present'
    )

#region Input Validation

    # Check for DhcpServer module/role
    Assert-Module -moduleName DHCPServer

    # Convert the Subnet Mask to be a valid IPAddress
    $ScopeId = (Get-ValidIpAddress -ipString $ScopeId -AddressFamily $AddressFamily -parameterName 'ScopeId').ToString()

    # Convert the Start Range to be a valid IPAddress
    $StartRange = (Get-ValidIpAddress -ipString $StartRange -AddressFamily $AddressFamily -parameterName 'StartRange').ToString()

    # Convert the End Range to be a valid IPAddress
    $EndRange = (Get-ValidIpAddress -ipString $EndRange -AddressFamily $AddressFamily -parameterName 'EndRange').ToString()

    # Check to ensure startRange is smaller than endRange
    if($EndRange.Address -lt $StartRange.Address)
    {
        $errorMsg = $LocalizedData.InvalidStartAndEndRangeMessage
        New-TerminatingError -errorId RangeNotCorrect -errorMessage $errorMsg -errorCategory InvalidArgument
    }

#endregion Input Validation

    if($PSBoundParameters.ContainsKey('Debug'))
    {
        $null = $PSBoundParameters.Remove('Debug')
    }

    if($PSBoundParameters.ContainsKey('AddressFamily')) {
        $null = $PSBoundParameters.Remove('AddressFamily')
    }

    Validate-ResourceProperties @PSBoundParameters

}

function Validate-ResourceProperties
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory)]
        [String]$ScopeId,

        [parameter(Mandatory)]
        [String]$StartRange,

        [parameter(Mandatory)]
        [String]$EndRange,

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present',

        [Switch]$Apply
    )

    $checkExclusionRangeMessage = $LocalizedData.CheckExclusionRangeMessage
    Write-Verbose -Message $checkExclusionRangeMessage

    $exclusionRangeSelector = ($_.ScopeId -eq $ScopeId) `
                            -and ($_.StartRange -eq $StartRange) `
                            -and ($_.EndRange -eq $EndRange)

    $dhcpExclusionRange = Get-DhcpServerv4ExclusionRange | Where-Object { $exclusionRangeSelector }

    # Initialize the parameter collection
    if($Apply)
    {
        $parameters = @{}
    }

    # dhcpExclusionRange is set
    if($dhcpExclusionRange)
    {
        $TestExclusionRangeMessage = $($LocalizedData.TestExclusionRangeMessage) -f 'present', $Ensure
        Write-Verbose -Message $TestExclusionRangeMessage

        # if it should be present, test individual properties to match parameter values
        if($Ensure -eq 'Present')
        {
            #region Test the ScopeId
            $checkPropertyMsg = $($LocalizedData.CheckPropertyMessage) -f 'scopeid'
            Write-Verbose -Message $checkPropertyMsg

            if($dhcpExclusionRange.ScopeId -ne $ScopeId)
            {
                $notDesiredPropertyMsg = $($LocalizedData.NotDesiredPropertyMessage) -f 'scopeid',$ScopeId,$($dhcpExclusionRange.ScopeId)
                Write-Verbose -Message $notDesiredPropertyMsg

                if($Apply)
                {
                    $parameters['ScopeId'] = $ScopeId
                }
                else
                {
                    return $false
                }
            }
            else
            {
                $desiredPropertyMsg = $($LocalizedData.DesiredPropertyMessage) -f 'scopeid'
                Write-Verbose -Message $desiredPropertyMsg
            }
            #endregion scopeid

            if($Apply)
            {
                # If parameters contains more than 0 key, set the DhcpServer scope
                if($parameters.Count -gt 0)
                {
                    Add-DhcpServerv4ExclusionRange @parameters -ScopeId $dhcpExclusionRange.ScopeId
                    Write-PropertyMessage -Parameters $parameters -keysToSkip ScopeId `
                                          -Message $($LocalizedData.SetPropertyMessage) -Verbose
                }
            } # end Apply
            else
            {
                return $true
            }
        } # end ensure eq present

        # If dhcpExclusionRange should be absent
        else
        {
            if($Apply)
            {
                $removingExclusionRangeMsg = $LocalizedData.RemovingExclusionRangeMessage
                Write-Verbose -Message $removingExclusionRangeMsg

                # Remove the scope
                Remove-DhcpServerv4ExclusionRange -ScopeId $dhcpExclusionRange.ScopeId -Confirm:$false

                $deleteExclusionRangeMsg = $LocalizedData.deleteExclusionRangeMessage
                Write-Verbose -Message $deleteExclusionRangeMsg
            }
            else
            {
                return $false
            }
        }# end ensure -eq 'Absent'
    } # if $dhcpExclusionRange

    #If dhcpExclusionRange is not set, create it if needed
    else
    {
        $TestExclusionRangeMessage = $($LocalizedData.TestExclusionRangeMessage) -f 'absent', $Ensure
        Write-Verbose -Message $TestExclusionRangeMessage

        if($Ensure -eq 'Present')
        {
            if($Apply)
            {
                # Add mandatory parameters
                $parameters['ScopeId']    = $ScopeId
                $parameters['StartRange'] = $StartRange
                $parameters['EndRange']   = $EndRange

                $AddingExclusionRangeMessage = $LocalizedData.AddingExclusionRangeMessage
                Write-Verbose -Message $AddingExclusionRangeMessage

                try
                {
                    # Create a new exclusion range with specified properties
                    Add-DhcpServerv4ExclusionRange @parameters

                    $setExclusionRangeMessage = $($LocalizedData.SetExclusionRangeMessage) -f $ScopeId
                    Write-Verbose -Message $setExclusionRangeMessage
                }
                catch
                {
                    New-TerminatingError -errorId DhcpServerExclusionRangeFailure -errorMessage $_.Exception.Message -errorCategory InvalidOperation
                }
            }# end Apply
            else
            {
                return $false
            }
        } # end Ensure -eq Present
        else
        {
            return $true
        }
    } # else !dhcpscope
}

Export-ModuleMember -Function *-TargetResource

