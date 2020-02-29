$script:dscModuleName = 'xDhcpServer'
$script:dscResourceName = 'MSFT_xDhcpServerOptionDefinition'

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
        $optionId = 22
        $name = 'Test name'
        $addressFamily = 'IPv4'
        $description = 'Test Description'
        $type = 'IPv4Address'
        $vendorClass = ''
        $multiValued = $false

        $testParams = @{
            OptionId      = $optionId
            Name          = $name
            AddressFamily = $addressFamily
            Description   = $description
            Type          = $type
            VendorClass   = $vendorClass
            MultiValued   = $multiValued
        }

        $fakeDhcpServerv4OptionDefinition = [PSCustomObject] @{
            OptionId      = $optionId
            Name          = $name
            AddressFamily = $addressFamily
            Description   = $description
            Type          = $type
            VendorClass   = $vendorClass
            MultiValued   = $multiValued
        }

        Describe 'MSFT_xDhcpServerOptionDefinition\Get-TargetResource' {
            BeforeAll {
                Mock -CommandName Assert-Module
                Mock -CommandName Set-DhcpServerv4OptionDefinition
                Mock -CommandName Add-DhcpServerv4OptionDefinition
                Mock -CommandName Remove-DhcpServerv4OptionDefinition
                Mock -CommandName Get-DhcpServerv4OptionDefinition -MockWith {
                    return $fakeDhcpServerv4OptionDefinition
                }
            }

            It 'Should call "Assert-Module" to ensure "DHCPServer" module is available' {
                $result = Get-TargetResource -OptionId $OptionId -Name $Name -Type $Type -VendorClass $VendorClass -AddressFamily IPv4 -Ensure Present
                Assert-MockCalled -CommandName Assert-Module -Exactly -Times 1 -Scope It
            }

            It 'Returns a "System.Collections.Hashtable" object type' {
                $result = Get-TargetResource -OptionId $OptionId -Name $Name -Type $Type -VendorClass $VendorClass -AddressFamily IPv4 -Ensure Present
                $result -is [System.Collections.Hashtable] | Should -Be $true
            }
        }

        Describe 'MSFT_xDhcpServerOptionDefinition\Test-TargetResource' {
            BeforeAll {
                Mock -CommandName Assert-Module
            }

            Mock -CommandName Get-DhcpServerv4OptionDefinition -MockWith {
                return $fakeDhcpServerv4OptionDefinition
            }

            Mock -CommandName Set-DhcpServerv4OptionDefinition
            Mock -CommandName Add-DhcpServerv4OptionDefinition
            Mock -CommandName Remove-DhcpServerv4OptionDefinition

            It 'Returns a "System.Boolean" object type' {
                $result = Test-TargetResource @testParams -Ensure Present
                $result | Should -BeOfType [System.Boolean]
            }

            It 'Passes when all parameters are correct' {
                $result = Test-TargetResource @testParams -Ensure Present
                $result | Should -Be $true
            }
        }

        Describe 'MSFT_xDhcpServerOptionDefinition\Set-TargetResource' {
            BeforeAll {
                Mock -CommandName Assert-Module
            }

            Mock -CommandName Set-DhcpServerv4OptionDefinition
            Mock -CommandName Add-DhcpServerv4OptionDefinition
            Mock -CommandName Remove-DhcpServerv4OptionDefinition

            It 'Should call "Add-DhcpServerv4OptionDefinition" when "Ensure" = "Present" and definition does not exist' {
                Mock -CommandName Get-DhcpServerv4OptionDefinition -MockWith {
                    return $null
                }

                $TempParams = $testParams.Clone()
                $TempParams.OptionId = 2
                Set-TargetResource @TempParams -Ensure 'Present'

                Assert-MockCalled Add-DhcpServerv4OptionDefinition -Exactly -Times 1 -Scope It
            }

            It 'Should call "Remove-DhcpServerv4OptionDefinition" when "Ensure" = "Absent" and Definition does exist' {
                Mock -CommandName Get-DhcpServerv4OptionDefinition -MockWith {
                    return $fakeDhcpServerv4OptionDefinition
                }

                Set-TargetResource @testParams -Ensure 'Absent'
                Assert-MockCalled -CommandName Remove-DhcpServerv4OptionDefinition -Exactly -Times 1 -Scope It
            }

            It 'Should call Set-DhcpServerv4OptionDefinition when "Ensure" = "Present" and Name or Description has changed' {
                Mock -CommandName Get-DhcpServerv4OptionDefinition -MockWith {
                    return $fakeDhcpServerv4OptionDefinition
                }

                $TempParams = $testParams.Clone()
                $TempParams.Description = 'New Description'
                Set-TargetResource @TempParams -Ensure 'Present'

                Assert-MockCalled -CommandName Set-DhcpServerv4OptionDefinition -Exactly -Times 1 -Scope It
            }

            It 'Should call "Remove-DhcpServerv4OptionDefinition" and then "Add-DhcpServerv4OptionDefinition" when "Ensure" = "Present" and Type, MultiValued, VendorClass has changed' {
                Mock -CommandName Get-DhcpServerv4OptionDefinition -MockWith {
                    return $fakeDhcpServerv4OptionDefinition
                }

                $TempParams = $testParams.Clone()
                $TempParams.Type = 'Byte'
                Set-TargetResource @TempParams -Ensure 'Present'

                Assert-MockCalled -CommandName Remove-DhcpServerv4OptionDefinition -Exactly -Times 1 -Scope It
                Assert-MockCalled -CommandName Add-DhcpServerv4OptionDefinition -Exactly -Times 1 -Scope It
            }


            It 'Should call "Remove-DhcpServerv4OptionDefinition" and then "Add-DhcpServerv4OptionDefinition" when "Ensure" = "Present" and Type has changed' {
                Mock -CommandName Get-DhcpServerv4OptionDefinition -MockWith {
                    return $fakeDhcpServerv4OptionDefinition
                }

                $TempParams = $testParams.Clone()
                $TempParams.Type = 'Byte'
                Set-TargetResource @tempParams -Ensure 'Present'

                Assert-MockCalled -CommandName Remove-DhcpServerv4OptionDefinition -Exactly -Times 1 -Scope It
                Assert-MockCalled -CommandName Add-DhcpServerv4OptionDefinition -Exactly -Times 1 -Scope It
            }


            It 'Should call "Remove-DhcpServerv4OptionDefinition" and then "Add-DhcpServerv4OptionDefinition" when "Ensure" = "Present" and MultiValued has changed' {
                Mock -CommandName Get-DhcpServerv4OptionDefinition -MockWith {
                    return $fakeDhcpServerv4OptionDefinition
                }

                $TempParams = $testParams.Clone()
                $TempParams.MultiValued = $true
                Set-TargetResource @TempParams -Ensure 'Present'

                Assert-MockCalled -CommandName Remove-DhcpServerv4OptionDefinition -Exactly -Times 1 -Scope It
                Assert-MockCalled -CommandName Add-DhcpServerv4OptionDefinition -Exactly -Times 1 -Scope It
            }

            It 'Should call "Remove-DhcpServerv4OptionDefinition" and then "Add-DhcpServerv4OptionDefinition" when "Ensure" = "Present" and VendorClass has changed' {
                Mock -CommandName Get-DhcpServerv4OptionDefinition -MockWith {
                    return $fakeDhcpServerv4OptionDefinition
                }

                $TempParams = $testParams.Clone()
                $TempParams.VendorClass = 'NewVendorClass'
                Set-TargetResource @TempParams -Ensure 'Present'

                Assert-MockCalled -CommandName Remove-DhcpServerv4OptionDefinition -Exactly -Times 1 -Scope It
                Assert-MockCalled -CommandName Add-DhcpServerv4OptionDefinition -Exactly -Times 1 -Scope It
            }


            It 'Should call "Remove-DhcpServerv4OptionDefinition" and then "Add-DhcpServerv4OptionDefinition" when "Ensure" = "Present" and VendorClass and Description has changed' {
                Mock -CommandName Get-DhcpServerv4OptionDefinition -MockWith {
                    return $fakeDhcpServerv4OptionDefinition
                }

                $TempParams = $testParams.Clone()
                $TempParams.VendorClass = 'NewVendorClass'
                $TempParams.Description = 'New Description'
                Set-TargetResource @TempParams -Ensure 'Present'

                Assert-MockCalled -CommandName Remove-DhcpServerv4OptionDefinition -Exactly -Times 1 -Scope It
                Assert-MockCalled -CommandName Add-DhcpServerv4OptionDefinition -Exactly -Times 1 -Scope It
            }

            It 'Should call "Set-DhcpServerv4OptionDefinition" when "Ensure" = "Present" and Description has changed' {
                Mock -CommandName Get-DhcpServerv4OptionDefinition -MockWith {
                    return $fakeDhcpServerv4OptionDefinition
                }

                $TempParams = $testParams.Clone()
                $TempParams.Description = 'New Description'
                Set-TargetResource @testParams -Ensure 'Present'

                Assert-MockCalled -CommandName Set-DhcpServerv4OptionDefinition -Exactly -Times 1 -Scope It
            }
        }
    }
}
finally
{
    Invoke-TestCleanup
}
