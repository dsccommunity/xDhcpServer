$script:dscModuleName = 'xDhcpServer'
$script:dscResourceName = 'MSFT_xDhcpServerAuthorization'

function Invoke-TestSetup
{
    try
    {
        Import-Module -Name DscResource.Test -Force -ErrorAction 'Stop'
    }
    catch [System.IO.FileNotFoundException]
    {
        throw 'DscResource.Test module dependency not found. Please run ".\build.ps1 -Tasks build" first.'
    }

    $script:testEnvironment = Initialize-TestEnvironment `
        -DSCModuleName $script:dscModuleName `
        -DSCResourceName $script:dscResourceName `
        -ResourceType 'Mof' `
        -TestType 'Unit'

    # Import the stub functions.
    Import-Module -Name "$PSScriptRoot/Stubs/DhcpServer_2016_OSBuild_14393_2395.psm1" -Force -DisableNameChecking
}

function Invoke-TestCleanup
{
    Restore-TestEnvironment -TestEnvironment $script:testEnvironment
}

Invoke-TestSetup

try
{
    InModuleScope $script:dscResourceName {

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
