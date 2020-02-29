$script:dscModuleName   = 'xDhcpServer'
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
        function Get-DhcpServerInDc
        {
            throw 'Stub: Not implemented'
        }

        function Add-DhcpServerInDc
        {
            throw 'Stub: Not implemented'
        }


        function Remove-DhcpServerInDc
        {
            [CmdletBinding()]
            param
            (
                [Parameter(ValueFromPipeline)]
                $someValue
            )

            throw 'Stub: Not implemented'
        }

        # Test TargetResource parameters with Ensure = 'Present'.
        $testPresentParams = @{
            Ensure = 'Present'
            DnsName = 'test1.contoso.com'
            IPAddress = '192.168.1.1'
        }
        # Test TargetResource parameters with Ensure = 'Absent'.
        $testAbsentParams = @{
            Ensure = 'Absent'
            DnsName = 'test1.contoso.com'
            IPAddress = '192.168.1.1'
        }

        # Authorized server list with test1.contoso.com authorized.
        $fakeDhcpServersPresent = @(
            @{
                IPAddress = '192.168.1.1'
                DnsName = 'test1.contoso.com'
            },
            @{
                IPAddress = '192.168.1.2'
                DnsName = 'test2.contoso.com'
            },
            @{
                IPAddress = '192.168.1.3'
                DnsName = 'test3.contoso.com'
            }
        )

        # Authorized server list with test1.contoso.com not authorized
        $fakeDhcpServersAbsent = @(
            @{
                IPAddress = '192.168.1.2'
                DnsName = 'test2.contoso.com'
            },
            @{
                IPAddress = '192.168.1.3'
                DnsName = 'test3.contoso.com'
            }
        )

        # Authorized server list with mismatched DnsName, but matched IPAddress
        $fakeDhcpServersMismatchDnsName = @(
            @{
                IPAddress = '192.168.1.1'
                DnsName = 'test11.contoso.com'
            },
            @{
                IPAddress = '192.168.1.2'
                DnsName = 'test2.contoso.com'
            },
            @{
                IPAddress = '192.168.1.3'
                DnsName = 'test3.contoso.com'
            }
        )

        # Authorized server list with mismatched IPAddress, but matched DnsName
        $fakeDhcpServersMismatchIPAddress = @(
            @{
                IPAddress = '192.168.1.11'
                DnsName = 'test1.contoso.com'
            },
            @{
                IPAddress = '192.168.1.2'
                DnsName = 'test2.contoso.com'
            },
            @{
                IPAddress = '192.168.1.3'
                DnsName = 'test3.contoso.com'
            }
        )

        Describe 'MSFT_xDhcpServerAuthorization\Get-TargetResource' {
            Mock Assert-Module { };

            It 'Returns a [System.Collection.Hashtable] type' {
                Mock Get-DhcpServerInDC { return $fakeDhcpServersPresent; }

                $result = Get-TargetResource @testPresentParams;

                $result -is [System.Collections.Hashtable] | Should Be $true;
            }
            It 'Returns Ensure is Present when DHCP server authorization exists' {
                Mock Get-DhcpServerInDC { return $fakeDhcpServersPresent; }

                $result = Get-TargetResource @testPresentParams

                $result.Ensure | Should Be 'Present';
            }
            It 'Returns Ensure is Absent when DHCP server authorization does not exist' {
                Mock Get-DhcpServerInDC { }

                $result = Get-TargetResource @testPresentParams;

                $result.Ensure | Should Be 'Absent';
            }

        }

        Describe 'MSFT_xDhcpServerAuthorization\Test-TargetResource' {
            Mock Assert-Module { };

            It 'Returns a [System.Boolean] type' {
                Mock Get-DhcpServerInDC { return $fakeDhcpServersPresent; }

                $result = Test-TargetResource @testPresentParams;

                $result -is [System.Boolean] | Should Be $true;
            }
            It 'Fails when DHCP Server authorization does not exist and Ensure is Present' {
                Mock Get-DhcpServerInDC { return $fakeDhcpServersAbsent; }

                Test-TargetResource @testPresentParams | Should Be $false;
            }
            It 'Fails when DHCP Server authorization does exist and Ensure is Absent' {
                Mock Get-DhcpServerInDC { return $fakeDhcpServersPresent; }

                Test-TargetResource @testAbsentParams | Should Be $false;
            }
            It 'Fails when DHCP Server authorization does exist, Ensure is Present but DnsName is wrong' {
                Mock Get-DhcpServerInDC { return $fakeDhcpServersMismatchDnsName; }

                Test-TargetResource @testPresentParams | Should Be $false;
            }
            It 'Fails when DHCP Server authorization does exist, Ensure is Present but IPAddress is wrong' {
                Mock Get-DhcpServerInDC { return $fakeDhcpServersMismatchIPAddress; }

                Test-TargetResource @testPresentParams | Should Be $false;
            }
            It 'Passes when DHCP Server authorization does exist and Ensure is Present' {
                Mock Get-DhcpServerInDC { return $fakeDhcpServersPresent; }

                $result = Test-TargetResource @testPresentParams

                $result -is [System.Boolean] | Should Be $true;
            }
            It 'Passes when DHCP Server authorization does not exist and Ensure is Absent' {
                Mock Get-DhcpServerInDC { return $fakeDhcpServersAbsent; }

                $result = Test-TargetResource @testAbsentParams

                $result -is [System.Boolean] | Should Be $true;
            }

        }

        Describe 'MSFT_xDhcpServerAuthorization\Set-TargetResource' {
            Mock Assert-Module { };

            It 'Calls Add-DhcpServerInDc when Ensure is Present' {
                Mock Add-DhcpServerInDC { }

                Set-TargetResource @testPresentParams;

                Assert-MockCalled Add-DhcpServerInDC -Scope It;
            }
            It 'Calls Remove-DhcpServerInDc when Ensure is Present' {
                Mock Get-DhcpServerInDC { return $fakeDhcpServersPresent; }
                Mock Remove-DhcpServerInDC { }

                Set-TargetResource @testAbsentParams;

                Assert-MockCalled Remove-DhcpServerInDC -Scope It;
            }

        }

        Describe 'MSFT_xDhcpServerAuthorization\Get-IPv4Address' {

            It 'Returns a IPv4 address' {
                $result = Get-IPv4Address;

                $result -match '\d+\.\d+\.\d+\.\d+' | Should Be $true;
            }

        }

        Describe 'MSFT_xDhcpServerAuthorization\Get-Hostname' {

            It 'Returns at least the current NetBIOS name' {
                $hostname = [System.Net.Dns]::GetHostname();

                $result = Get-Hostname;

                $result -match $hostname | Should Be $true;
            }

        }
    } #end InModuleScope
}
finally
{
    Invoke-TestCleanup
}
