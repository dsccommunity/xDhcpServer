$Global:DSCModuleName      = 'xDhcpServer'
$Global:DSCResourceName    = 'MSFT_xDhcpServerOptionDefinition'

# region HEADER
[String] $moduleRoot = Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $Script:MyInvocation.MyCommand.Path))
if ( (-not (Test-Path -Path (Join-Path -Path $moduleRoot -ChildPath 'DSCResource.Tests'))) -or `
     (-not (Test-Path -Path (Join-Path -Path $moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1'))) )
{
    & git @('clone','https://github.com/PowerShell/DscResource.Tests.git',(Join-Path -Path $moduleRoot -ChildPath '\DSCResource.Tests\'))
}
else
{
    & git @('-C',(Join-Path -Path $moduleRoot -ChildPath '\DSCResource.Tests\'),'pull')
}
Import-Module (Join-Path -Path $moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1') -Force
$TestEnvironment = Initialize-TestEnvironment `
    -DSCModuleName $Global:DSCModuleName `
    -DSCResourceName $Global:DSCResourceName `
    -TestType Unit
# endregion

# Begin Testing

try
{
    InModuleScope $Global:DSCResourceName {
        
        $OptionID = 22
        $Name =  'Test name'
        $AddressFamily = 'IPv4'
        $Description = 'Test Description'
        $Type = 'IPv4Address'
        $VendorClass = ''
        $MultiValued = $false
        
        $testParams = @{
            OptionID      = $OptionID
            Name          = $Name
            AddressFamily = $AddressFamily
            Description   = $Description
            Type          = $Type
            VendorClass   = $VendorClass
            MultiValued   = $MultiValued
        }
                
        $fakeDhcpServerv4OptionDefinition = [PSCustomObject] @{
            OptionID      = $OptionID
            Name          = $Name
            AddressFamily = $AddressFamily
            Description   = $Description
            Type          = $Type
            VendorClass   = $VendorClass
            MultiValued   = $MultiValued
            }

        # endregion Pester Test Initialization

        # region Function Get-TargetResource
        Describe "$($Global:DSCResourceName)\Get-TargetResource" {

            Mock Assert-Module -ParameterFilter { $ModuleName -eq 'DHCPServer' } { }
            Mock Get-DhcpServerv4OptionDefinition { return $fakeDhcpServerv4OptionDefinition }
            Mock Set-DhcpServerv4OptionDefinition { }
            Mock Add-DhcpServerv4OptionDefinition { }
            Mock Remove-DhcpServerv4OptionDefinition { }

            It 'Calls "Assert-Module" to ensure "DHCPServer" module is available' {
     
                $result = Get-TargetResource -OptionID $OptionID -Name $Name -Type $Type -VendorClass $VendorClass -AddressFamily IPv4 -Ensure Present;
            }
        
            It 'Returns a "System.Collections.Hashtable" object type' {

                    $result = Get-TargetResource -OptionID $OptionID -Name $Name -Type $Type -VendorClass $VendorClass -AddressFamily IPv4 -Ensure Present;
                    $result -is [System.Collections.Hashtable] | Should Be $true;
            }
        }
        # endregion Function Get-TargetResource


        # region Function Test-TargetResource
        Describe "$($Global:DSCResourceName)\Test-TargetResource" {

            Mock Assert-Module -ParameterFilter { $ModuleName -eq 'DHCPServer' } { }
            Mock Get-DhcpServerv4OptionDefinition { return $fakeDhcpServerv4OptionDefinition }
            Mock Set-DhcpServerv4OptionDefinition { }
            Mock Add-DhcpServerv4OptionDefinition { }
            Mock Remove-DhcpServerv4OptionDefinition { }

            It 'Returns a "System.Boolean" object type' {
            Mock Get-DhcpServerv4OptionDefinition { return $fakeDhcpServerv4OptionDefinition; }

            $result = Test-TargetResource @testParams -Ensure Present;
            $result -is [System.Boolean] | Should Be $true;
            }

            It 'Passes when all parameters are correct' {
                Mock Get-DhcpServerv4OptionDefinition { return $fakeDhcpServerv4OptionDefinition; }
                
                $result = Test-TargetResource @testParams -Ensure Present;
                $result | Should Be $true;
            }
        
        }
        # endregion Function Test-TargetResource 

        # region Function Set-TargetResource

        Describe "$($Global:DSCResourceName)\Set-TargetResource" {

        Mock Assert-Module -ParameterFilter { $ModuleName -eq 'DHCPServer' } { }
       # Mock Get-DhcpServerv4OptionDefinition { return $fakeDhcpServerv4OptionDefinition }
        Mock Set-DhcpServerv4OptionDefinition { }
        Mock Add-DhcpServerv4OptionDefinition { }
        Mock Remove-DhcpServerv4OptionDefinition { }


            It 'Calls "Add-DhcpServerv4OptionDefinition" when "Ensure" = "Present" and definition does not exist' {
                
                Mock Get-DhcpServerv4OptionDefinition { return $null }

                $TempParams = $testParams.Clone() 
                $TempParams.OptionID = 2
                Set-TargetResource @TempParams -Ensure 'Present'
          
                Assert-MockCalled Add-DhcpServerv4OptionDefinition -Scope It
            }

            It 'Calls "Remove-DhcpServerv4OptionDefinition" when "Ensure" = "Absent" and Definition does exist' {

                Mock Get-DhcpServerv4OptionDefinition { return $fakeDhcpServerv4OptionDefinition }

                # $TempParams = $testParams.Clone()
                # Set-TargetResource @testParams -Ensure 'Absent'
                Set-TargetResource @testParams -Ensure 'Absent'
            
                Assert-MockCalled -CommandName Remove-DhcpServerv4OptionDefinition -Scope It
            }

            it 'Calls Set-DhcpServerv4OptionDefinition when "Ensure" = "Present" and Name or Description has changed' {
               
                Mock Get-DhcpServerv4OptionDefinition { return $fakeDhcpServerv4OptionDefinition }

                $TempParams = $testParams.Clone() 
                $TempParams.Description = 'New Description'
                Set-TargetResource @TempParams -Ensure 'Present'
                
                Assert-MockCalled -CommandName Set-DhcpServerv4OptionDefinition -Scope It
            }

            it 'Calls "Remove-DhcpServerv4OptionDefinition" and then "Add-DhcpServerv4OptionDefinition" when "Ensure" = "Present" and Type, MultiValued, VendorClass has changed' {

                Mock Get-DhcpServerv4OptionDefinition { return $fakeDhcpServerv4OptionDefinition }

                $TempParams = $testParams.Clone()
                $TempParams.Type = 'Byte'
                Set-TargetResource @TempParams -Ensure 'Present'

                Assert-MockCalled -CommandName Remove-DhcpServerv4OptionDefinition -Scope It
                Assert-MockCalled -CommandName Add-DhcpServerv4OptionDefinition -Scope It
            }
            

            it 'Calls "Remove-DhcpServerv4OptionDefinition" and then "Add-DhcpServerv4OptionDefinition" when "Ensure" = "Present" and Type has changed' {
                
                Mock Get-DhcpServerv4OptionDefinition { return $fakeDhcpServerv4OptionDefinition }
                
                $TempParams = $testParams.Clone()
                $TempParams.Type = 'Byte'
                Set-TargetResource @tempParams -Ensure 'Present'
            
                Assert-MockCalled -CommandName Remove-DhcpServerv4OptionDefinition -Scope It
                Assert-MockCalled -CommandName Add-DhcpServerv4OptionDefinition -Scope It
            }


            it 'Calls "Remove-DhcpServerv4OptionDefinition" and then "Add-DhcpServerv4OptionDefinition" when "Ensure" = "Present" and MultiValued has changed' {
                
                Mock Get-DhcpServerv4OptionDefinition { return $fakeDhcpServerv4OptionDefinition }

                $TempParams = $testParams.Clone()
                $TempParams.MultiValued = $true
                Set-TargetResource @TempParams -Ensure 'Present'

                Assert-MockCalled -CommandName Remove-DhcpServerv4OptionDefinition -Scope It -Times 1 -Exactly
                Assert-MockCalled -CommandName Add-DhcpServerv4OptionDefinition -Scope It -Times 1 -Exactly
            }

            it 'Calls "Remove-DhcpServerv4OptionDefinition" and then "Add-DhcpServerv4OptionDefinition" when "Ensure" = "Present" and VendorClass has changed' {
                
                Mock Get-DhcpServerv4OptionDefinition { return $fakeDhcpServerv4OptionDefinition }                
                
                $TempParams = $testParams.Clone()
                $TempParams.VendorClass = 'NewVendorClass'
                Set-TargetResource @TempParams -Ensure 'Present'

                Assert-MockCalled -CommandName Remove-DhcpServerv4OptionDefinition -Scope It -Times 1 -Exactly
                Assert-MockCalled -CommandName Add-DhcpServerv4OptionDefinition -Scope It -Times 1 -Exactly
            }

            
            it 'Calls "Remove-DhcpServerv4OptionDefinition" and then "Add-DhcpServerv4OptionDefinition" when "Ensure" = "Present" and VendorClass and Description has changed' {
                
                Mock Get-DhcpServerv4OptionDefinition { return $fakeDhcpServerv4OptionDefinition }

                $TempParams = $testParams.Clone()
                $TempParams.VendorClass = 'NewVendorClass'
                $TempParams.Description = 'New Description'
                Set-TargetResource @TempParams -Ensure 'Present'

                Assert-MockCalled -CommandName Remove-DhcpServerv4OptionDefinition -Scope It -Times 1 -Exactly
                Assert-MockCalled -CommandName Add-DhcpServerv4OptionDefinition -Scope It -Times 1 -Exactly
            }

            it 'Calls "Set-DhcpServerv4OptionDefinition" when "Ensure" = "Present" and Description has changed' {

                Mock Get-DhcpServerv4OptionDefinition { return $fakeDhcpServerv4OptionDefinition }

                $TempParams = $testParams.Clone()
                $TempParams.Description = 'New Description'
                Set-TargetResource @testParams -Ensure 'Present'
                
                Assert-MockCalled -CommandName set-DhcpServerv4OptionDefinition -Scope It
            }
        }
        # End region Function Set-TargetResource
    }
    # endregion

}
finally
{
     # region FOOTER
    Restore-TestEnvironment -TestEnvironment $TestEnvironment
    # endregion
}
