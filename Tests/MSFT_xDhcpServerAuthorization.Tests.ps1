[CmdletBinding()]
param()

if (!$PSScriptRoot) # $PSScriptRoot is not defined in 2.0
{
    $PSScriptRoot = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path)
}

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$RepoRoot = (Resolve-Path $PSScriptRoot\..).Path
Write-Host $RepoRoot -ForegroundColor Green

$ModuleName = 'MSFT_xDhcpServerAuthorization'
Import-Module (Join-Path $RepoRoot "DSCResources\$ModuleName\$ModuleName.psm1") -Force;

Describe 'xDhcpServerAuthorization' {

    InModuleScope $ModuleName {
        
        ## Mock missing functions
        function Get-DhcpServerInDc { }
        function Add-DhcpServerInDc { }
        ## http://virtualengine.co.uk/2015/mocking-missing-cmdlet-pipelines-with-pester/
        function Remove-DhcpServerInDc { [CmdletBinding()] param ( [Parameter(ValueFromPipeline)] $someValue ) }
        
        ## Test TargetResource parameters with Ensure = 'Present'
        $testPresentParams = @{ Ensure = 'Present'; DnsName = 'test1.contoso.com'; IPAddress = '192.168.1.1'; }
        ## Test TargetResource parameters with Ensure = 'Absent'
        $testAbsentParams = @{ Ensure = 'Absent'; DnsName = 'test1.contoso.com'; IPAddress = '192.168.1.1'; }
        
        ## Authorised server list with test1.contoso.com authorised
        $fakeDhcpServersPresent = @(
            @{ IPAddress = '192.168.1.1'; DnsName = 'test1.contoso.com'; },
            @{ IPAddress = '192.168.1.2'; DnsName = 'test2.contoso.com'; },
            @{ IPAddress = '192.168.1.3'; DnsName = 'test3.contoso.com'; }
        )
        ## Authorised server list with test1.contoso.com not authorised
        $fakeDhcpServersAbsent = @(
            @{ IPAddress = '192.168.1.2'; DnsName = 'test2.contoso.com'; },
            @{ IPAddress = '192.168.1.3'; DnsName = 'test3.contoso.com'; }
        )
        ## Authorised server list with mismathed DnsName, but matched IPAddress
        $fakeDhcpServersMismatchDnsName = @(
            @{ IPAddress = '192.168.1.1'; DnsName = 'test11.contoso.com'; },
            @{ IPAddress = '192.168.1.2'; DnsName = 'test2.contoso.com'; },
            @{ IPAddress = '192.168.1.3'; DnsName = 'test3.contoso.com'; }
        )
        ## Authorised server list with mismathed IPAddress, but matched DnsName
        $fakeDhcpServersMismatchIPAddress = @(
            @{ IPAddress = '192.168.1.11'; DnsName = 'test1.contoso.com'; },
            @{ IPAddress = '192.168.1.2'; DnsName = 'test2.contoso.com'; },
            @{ IPAddress = '192.168.1.3'; DnsName = 'test3.contoso.com'; }
        )

        Context 'Validate Assert-Module method' {
            It 'Throws if DHCP Server module is not present' {
                Mock Get-Module -ParameterFilter { $ModuleName -eq 'DHCPServer'} -MockWith { throw; }
                { Assert-Module -ModuleName DHCPServer } | Should Throw;
            }
        } #end Context Validate Assert-Module method

        
        Context 'Validate Get-TargetResource method' {
            Mock Assert-Module { };

            It 'Returns a [System.Collection.Hashtable] type' {
                Mock Get-DhcpServerInDC { return $fakeDhcpServersPresent; }
                (Get-TargetResource @testPresentParams) -is [System.Collections.Hashtable] | Should Be $true;
            }
            It 'Returns Ensure is Present when DHCP server authorization exists' {
                Mock Get-DhcpServerInDC { return $fakeDhcpServersPresent; }
                (Get-TargetResource @testPresentParams).Ensure | Should Be 'Present';
            }
            It 'Returns Ensure is Absent when DHCP server authorization does not exist' {
                Mock Get-DhcpServerInDC { return $fakeDhcpServersAbsent; }
                (Get-TargetResource @testPresentParams).Ensure | Should Be 'Absent';
            }

        } #end Context Validate Get-TargetResource method
        
        Context 'Validate Test-TargetResource method' {
            Mock Assert-Module { };

            It 'Returns a [System.Boolean] type' {
                Mock Get-DhcpServerInDC { return $fakeDhcpServersPresent; }
                (Test-TargetResource @testPresentParams) -is [System.Boolean] | Should Be $true;
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
                (Test-TargetResource @testPresentParams) -is [System.Boolean] | Should Be $true;
            }
            It 'Passes when DHCP Server authorization does not exist and Ensure is Absent' {
                Mock Get-DhcpServerInDC { return $fakeDhcpServersAbsent; }
                (Test-TargetResource @testAbsentParams) -is [System.Boolean] | Should Be $true;
            }
        
        } #end Context Validate Test-TargetResource method

        #    It "Fails when group does not exist and Ensure is Present" {
        #        Mock Get-TargetResource { return $testAbsentParams }
        #        Test-TargetResource @testPresentParams | Should Be $false
        #    }
        #    It "Fails when group exists, Ensure is Present but Scope is wrong" {
        #        Mock Get-TargetResource {
        #            $duffADGroup = $testPresentParams.Clone();
        #            $duffADGroup['GroupScope'] = 'Universal';
        #            return $duffADGroup;
        #        }
        #        Test-TargetResource @testPresentParams | Should Be $false;
        #    }
        #    It "Fails when group exists, Ensure is Present but Category is wrong" {
        #        Mock Get-TargetResource {
        #            $duffADGroup = $testPresentParams.Clone();
        #            $duffADGroup['Category'] = 'Distribution';
        #            return $duffADGroup;
        #        }
        #        Test-TargetResource @testPresentParams | Should Be $false;
        #    }
        #    It "Fails when group exists, Ensure is Present but Path is wrong" {
        #        Mock Get-TargetResource {
        #            $duffADGroup = $testPresentParams.Clone();
        #            $duffADGroup['Path'] = 'OU=WrongPath,DC=contoso,DC=com';
        #            return $duffADGroup;
        #        }
        #        Test-TargetResource @testPresentParams | Should Be $false;
        #    }
        #    It "Fails when group exists, Ensure is Present but Description is wrong" {
        #        Mock Get-TargetResource {
        #            $duffADGroup = $testPresentParams.Clone();
        #            $duffADGroup['Description'] = 'Test AD group description is wrong';
        #            return $duffADGroup;
        #        }
        #        Test-TargetResource @testPresentParams | Should Be $false;
        #    }
        #    It "Fails when group exists, Ensure is Present but DisplayName is wrong" {
        #        Mock Get-TargetResource {
        #            $duffADGroup = $testPresentParams.Clone();
        #            $duffADGroup['DisplayName'] = 'Wrong display name';
        #            return $duffADGroup;
        #        }
        #        Test-TargetResource @testPresentParams | Should Be $false;
        #    }
        #    It "Fails when group exists and Ensure is Absent" {
        #        Mock Get-TargetResource { return $testPresentParams }
        #        Test-TargetResource @testAbsentParams | Should Be $false
        #    }
        #    It "Passes when group exists, target matches and Ensure is Present" {
        #        Mock Get-TargetResource { return $testPresentParams } 
        #        Test-TargetResource @testPresentParams | Should Be $true
        #    }
        #    It "Passes when group does not exist and Ensure is Absent" {
        #        Mock Get-TargetResource { return $testAbsentParams } 
        #        Test-TargetResource @testAbsentParams | Should Be $true
        #    }
        #} #end Context Validate Test-TargetResource method
        #
        Context 'Validate Set-TargetResource method' {
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
        } #end Context Validate Set-TargetResource method
    
    } #end InModuleScope
}
