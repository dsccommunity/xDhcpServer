#region HEADER

# Unit Test Template Version: 1.2.1
$script:moduleRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if ( (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests'))) -or `
     (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1'))) )
{
    & git @('clone','https://github.com/PowerShell/DscResource.Tests.git',(Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests'))
}

Import-Module -Name (Join-Path -Path $script:moduleRoot -ChildPath (Join-Path -Path 'DSCResource.Tests' -ChildPath 'TestHelper.psm1')) -Force

$TestEnvironment = Initialize-TestEnvironment `
    -DSCModuleName 'xDhcpServer' `
    -DSCResourceName 'MSFT_DhcpServerBinding' `
    -TestType Unit

#endregion HEADER

function Invoke-TestSetup {
}

function Invoke-TestCleanup {
    Restore-TestEnvironment -TestEnvironment $TestEnvironment
}

# Begin Testing
try
{
    Invoke-TestSetup

    InModuleScope 'MSFT_DhcpServerBinding' {

        $interfaceAlias = 'Ethernet'
        $ensure         = 'Present'
        $ipAddress      = '10.0.0.1'

        $testParamsPresent = @{
            InterfaceAlias = $interfaceAlias
            Ensure         = $ensure
        }

        $testParamsAbsent = @{
            InterfaceAlias = $interfaceAlias
            Ensure         = 'Absent'
        }

        $badAliasParams = @{
            InterfaceAlias = 'fake'
            Ensure         = $ensure
        }

        $setParamsAbsent = @{
            BindingState   = $false
            InterfaceAlias = $interfaceAlias
        }

        $bindingNotPreset = ,@(
            [pscustomobject]@{
                InterfaceAlias = $interfaceAlias
                IPAddress      = [IPAddress]$ipAddress
                BindingState   = $false
            }
        )

        $bindingPresent = ,@(
            [pscustomobject]@{
                InterfaceAlias = $interfaceAlias
                IPAddress      = [IPAddress]$ipAddress
                BindingState   = $true
            }
        )

        Describe 'xDhcpServer\Get-TargetResource' {

            Mock Get-DhcpServerv4Binding -MockWith {return $bindingPresent}
            Mock Assert-Module -ParameterFilter { $ModuleName -eq 'DHCPServer' } { }

            It 'Should call "Assert-Module" to ensure "DHCPServer" module is available' {

                $result = Get-TargetResource @testParamsPresent

                Assert-MockCalled -CommandName Assert-Module
            }

            It 'Returns a "System.Collections.Hashtable" object type' {

                $result = Get-TargetResource @testParamsPresent
                $result | Should BeOfType [System.Collections.Hashtable]
            }

            It 'Returns all correct values when binding is present'{

                Mock Get-DhcpServerv4Binding -MockWith {return $bindingPresent}

                $result = Get-TargetResource @testParamsPresent
                $result.Ensure         | Should Be $ensure
                $result.InterfaceAlias | Should Be $interfaceAlias
            }

            It 'Returns all correct values when binding is NOT present'{

                Mock Get-DhcpServerv4Binding -MockWith {return $bindingNotPreset}

                $result = Get-TargetResource @testParamsPresent
                $result.Ensure         | Should Be 'Absent'
                $result.InterfaceAlias | Should Be $interfaceAlias
            }

            It 'Should throw if InterfaceAlias not found' {
                Mock Get-DhcpServerv4Binding -MockWith {return $bindingPresent}
                {Get-TargetResource @badAliasParams} | Should -Throw "InterfaceAlias $($badAliasParams.InterfaceAlias) not a valid interface on $env:COMPUTERNAME"
            }
        }


        Describe 'xDhcpServer\Test-TargetResource' {

            Mock Assert-Module -ParameterFilter { $ModuleName -eq 'DHCPServer' } { }

            It 'Returns a "System.Boolean" object type' {

                Mock Get-DhcpServerv4Binding -MockWith {return  $bindingPresent}

                $result = Test-TargetResource @testParamsPresent
                $result | Should BeOfType [System.Boolean]
            }

            It 'Returns $true when the binding exists and Ensure = Present' {

                Mock Get-DhcpServerv4Binding -MockWith {return $bindingPresent}

                $result = Test-TargetResource @testParamsPresent
                $result | Should Be $true
            }

            It 'Returns $false when the binding exists and Ensure = Absent' {

                Mock Get-DhcpServerv4Binding -MockWith {return $bindingPresent}

                $result = Test-TargetResource @testParamsAbsent
                $result | Should Be $false
            }

            It 'Returns $true when the binding does not exist and Ensure = Absent' {

                Mock Get-DhcpServerv4Binding -MockWith {return $bindingNotPreset}

                $result = Test-TargetResource @testParamsAbsent
                $result | Should Be $true
            }

            It 'Returns $false when the binding does not exist and Ensure = Present' {

                Mock Get-DhcpServerv4Binding -MockWith {return $bindingNotPreset}

                $result = Test-TargetResource @testParamsPresent
                $result | Should Be $false
            }
        }

        Describe 'xDhcpServer\Set-TargetResource' {

            Mock Assert-Module -ParameterFilter { $ModuleName -eq 'DHCPServer' } { }
            Mock Set-DhcpServerv4Binding -MockWith {return $bindingNotPreset}

            It 'Should call "Set-DhcpServerv4Binding"' {
                Set-TargetResource @testParamsPresent
                Assert-MockCalled -CommandName Set-DhcpServerv4Binding -Times 1
            }
        }
    }
}
finally
{
    Invoke-TestCleanup
}
