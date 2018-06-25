$script:DSCModuleName      = 'xDhcpServer'
$script:ModuleName    = 'Helper'

#region HEADER
$script:moduleRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if ( (-not (Test-Path -Path (Join-Path -Path $moduleRoot -ChildPath 'DSCResource.Tests'))) -or
     (-not (Test-Path -Path (Join-Path -Path $moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1'))) )
{
    & git @('clone','https://github.com/PowerShell/DscResource.Tests.git',(Join-Path -Path $moduleRoot -ChildPath '\DSCResource.Tests\'))
}
else
{
    & git @('-C',(Join-Path -Path $moduleRoot -ChildPath '\DSCResource.Tests\'),'pull')
}
Import-Module (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1') -Force
Import-Module (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResources\Helper.psm1')

#endregion

# Begin Testing
try
{
    #region Pester Tests

    # The InModuleScope command allows you to perform white-box unit testing on the internal
    # (non-exported) code of a Script Module.
    InModuleScope $script:ModuleName {

        $testParams = @{
            ScopeId = '192.168.1.0'
            IPStartRange = '192.168.1.10'
            IPEndRange = '192.168.1.99'
            SubnetMask = '255.255.255.0'
            AddressFamily = 'IPv4'
        }

        #region Function Get-TargetResource
        Describe "$($script:ModuleName)\Assert-ScopeParameter" {
            It 'Returns nothing when parameters are correct' {
                { Assert-ScopeParameter @testParams } | Should Not Throw 
            }

            It 'Throws an exception with information about incorrect <Parameter> (<Value>)' {
                param (
                    [String]$Parameter,
                    [String]$Value,
                    [String]$ErrorPattern
                )
                $brokenTestParams = $testParams.Clone()
                $brokenTestParams[$Parameter] = $Value
                try {
                    Assert-ScopeParameter @brokenTestParams
                } catch {
                    $exception = $_.Exception
                }
                $exception.Message | Should BeLike $ErrorPattern
            } -TestCases @(
                @{
                    Parameter = 'ScopeId'
                    Value = '192.168.1.42'
                    ErrorPattern = 'Value of byte 4 in ScopeId (42) is not valid.*'
                }
                @{
                    Parameter = 'IPStartRange'
                    Value = '192.168.0.1'
                    ErrorPattern = 'Value of byte 3 in IPStartRange (0) is not valid.*'
                }
                @{
                    Parameter = 'IPEndRange'
                    Value = '192.167.1.100'
                    ErrorPattern = 'Value of byte 2 in IPEndRange (167) is not valid.*'
                }
                @{
                    Parameter = 'IPEndRange'
                    Value = '192.168.1.2'
                    ErrorPattern = 'Value * are not valid. Start should be lower than end.'
                }
            )
        }
    }
}
finally
{
    #region FOOTER
    Restore-TestEnvironment -TestEnvironment $TestEnvironment
    #endregion

    # TODO: Other Optional Cleanup Code Goes Here...
}
