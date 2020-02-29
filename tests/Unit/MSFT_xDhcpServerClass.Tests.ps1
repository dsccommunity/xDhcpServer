$script:dscModuleName = 'xDhcpServer'
$script:dscResourceName = 'MSFT_xDhcpServerClass'

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
}

function Invoke-TestCleanup
{
    Restore-TestEnvironment -TestEnvironment $script:testEnvironment
}

Invoke-TestSetup

try
{
    InModuleScope $script:dscResourceName {
        # Mock missing functions
        function Get-DhcpServerv4Class
        {
            throw 'Stub: Not implemented'
        }

        function Add-DhcpServerv4Class
        {
            throw 'Stub: Not implemented'
        }

        function Set-DhcpServerv4Class
        {
            throw 'Stub: Not implemented'
        }

        function Remove-DhcpServerv4Class
        {
            throw 'Stub: Not implemented'
        }

        #region Pester Test Initialization

        $testClassName = 'Test Class';
        $testClassType = 'Vendor';
        $testAsciiData = 'test data';
        $testClassDescription = 'test class description';
        $testClassAddressFamily = 'IPv4';
        $testEnsure = 'Present'


        $testParams = @{
            Name          = $testClassName;
            Type          = $testClassType;
            AsciiData     = $testAsciiData;
            AddressFamily = 'IPv4'
            Description   = $testClassDescription
            #Ensure = $testEnsure
        }

        $fakeDhcpServerClass = [PSCustomObject] @{
            Name          = $testClassName
            Type          = $testClassType
            AsciiData     = $testAsciiData
            Description   = $testClassDescription
            AddressFamily = $testClassAddressFamily
        }


        #endregion

        Describe 'MSFT_xDhcpServerClass\Get-TargetResource' {
            Mock Assert-Module -ParameterFilter { $ModuleName -eq 'DHCPServer' } { }

            It 'Calls "Assert-Module" to ensure "DHCPServer" module is available' {
                Mock Get-DhcpServerv4Class { return $fakeDhcpServerClass; }

                $result = Get-TargetResource @testParams -Ensure Present;

                Assert-MockCalled Assert-Module -ParameterFilter { $ModuleName -eq 'DHCPServer' } -Scope It;
            }

            It 'Returns a "System.Collections.Hashtable" object type' {
                Mock Get-DhcpServerv4Class { return $fakeDhcpServerClass; }
                $result = Get-TargetResource @testParams -Ensure Present;
                $result -is [System.Collections.Hashtable] | Should Be $true;
            }
        }

        Describe 'MSFT_xDhcpServerClass\Test-TargetResource' {
            Mock Assert-Module -ParameterFilter { $ModuleName -eq 'DHCPServer' } { }

            It 'Returns a "System.Boolean" object type' {
                Mock Get-DhcpServerv4Class { return $fakeDhcpServerClass; }

                $result = Test-TargetResource @testParams -Ensure Present;

                $result -is [System.Boolean] | Should Be $true;
            }

            It 'Passes when all parameters are correct' {
                Mock Get-DhcpServerv4Class { return $fakeDhcpServerClass; }

                $result = Test-TargetResource @testParams -Ensure Present;

                $result | Should Be $true;
            }

        }
        #endregion Function Test-TargetResource

        #region Function Set-TargetResource
        Describe 'MSFT_xDhcpServerClass\Set-TargetResource' {
            Mock Assert-Module -ParameterFilter { $ModuleName -eq 'DHCPServer' } { }

            It 'Calls "Add-DhcpServerv4Class" when "Ensure" = "Present" and class does not exist' {
                Mock Set-DhcpServerv4Class { }
                Mock Add-DhcpServerv4Class { }

                Set-TargetResource @testParams -Ensure Present;

                Assert-MockCalled Add-DhcpServerv4Class -Scope It;
            }

            It 'Calls "Remove-DhcpServerv4Class" when "Ensure" = "Absent" and scope does exist' {
                Mock Get-DhcpServerv4Class { return $fakeDhcpServerClass; }
                Mock Remove-DhcpServerv4Class { }

                Set-TargetResource @testParams -Ensure 'Absent';

                Assert-MockCalled Remove-DhcpServerv4Class -Scope It;
            }

            It 'Calls Set-DhcpServerv4Class when asciidata changes' {
                Mock Get-DhcpServerv4Class { return $fakeDhcpServerClass; }
                Mock Set-DhcpServerv4Class { }

                $testParams.AsciiData = 'differentdata'

                Set-TargetResource @testParams -Ensure 'Present';

                Assert-MockCalled Set-DhcpServerv4Class -Scope It;
            }
        }
    } #end InModuleScope
}
finally
{
    Invoke-TestCleanup
}
