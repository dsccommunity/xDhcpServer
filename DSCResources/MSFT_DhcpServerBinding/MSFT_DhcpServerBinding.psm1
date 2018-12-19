$currentPath = Split-Path -Path $MyInvocation.MyCommand.Path -Parent

Import-Module -Name (Join-Path -Path (Split-Path -Path $currentPath -Parent) -ChildPath 'Helper.psm1')

$script:ensureLookup = @{
        Present = $true
        Absent  = $false
}

<#
    .SYNOPSIS
        This function gets a DHCP server binding.

    .PARAMETER InterfaceAlias
        The alias of the network adapter to get binding status for
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $InterfaceAlias
    )

    # Check for DhcpServer module/role
    Assert-Module -ModuleName DHCPServer

    [array]$bindings = Get-DhcpServerv4Binding
    if ($bindings.InterfaceAlias -inotcontains $InterfaceAlias)
    {
        throw "InterfaceAlias $InterfaceAlias not a valid interface on $env:COMPUTERNAME"
    }
    else
    {
        $targetBinding = $bindings.Where({$_.InterfaceAlias -eq $InterfaceAlias})
        return @{
            Ensure         = $script:ensureLookup.GetEnumerator().Where({$_.Value -eq $targetBinding.BindingState}).Name
            InterfaceAlias = $InterfaceAlias
        }
    }
}

<#
    .SYNOPSIS
        This function sets a DHCP server binding.

    .PARAMETER Ensure
        Toggles the binding on or off

    .PARAMETER InterfaceAlias
        The alias of the network adapter to set binding status for
#>
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [System.String]
        $Ensure,

        [Parameter(Mandatory = $true)]
        [System.String]
        $InterfaceAlias
    )

    # Check for DhcpServer module/role
    Assert-Module -ModuleName DHCPServer

    $parameters = @{
        BindingState   = $script:ensureLookup.$Ensure
        InterfaceAlias = $InterfaceAlias
    }

    Write-Verbose "Setting interface '$InterfaceAlias' binding state to '$($script:ensureLookup[$Ensure])'"
    Set-DhcpServerv4Binding @parameters
}

<#
    .SYNOPSIS
        This function tests a DHCP server binding.

    .PARAMETER Ensure
        Toggles the binding on or off

    .PARAMETER InterfaceAlias
        The alias of the network adapter to get binding status for
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [System.String]
        $Ensure,

        [Parameter(Mandatory = $true)]
        [System.String]
        $InterfaceAlias
    )

    # Check for DhcpServer module/role
    Assert-Module -ModuleName DHCPServer

    $bindingState = Get-TargetResource -Ensure $Ensure -InterfaceAlias $InterfaceAlias
    Write-Verbose "Found interface '$InterfaceAlias' with current binding state '$($script:ensureLookup[($bindingState.Ensure)])'"
    if ($bindingState.Ensure -eq $Ensure)
    {
        Write-Verbose "Interface '$InterfaceAlias' is in desired state"
        return $true
    }
    else
    {
        Write-Verbose "Interface '$InterfaceAlias' is NOT in desired state"
        return $false
    }
}

Export-ModuleMember -Function *-TargetResource
