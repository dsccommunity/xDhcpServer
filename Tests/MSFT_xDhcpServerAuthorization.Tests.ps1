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
        
        Context 'Validate Get-IPv4Address method' {
            
            It 'Returns a IPv4 address' {
                $result = Get-IPv4Address;
                
                $result -match '\d+\.\d+\.\d+\.\d+' | Should Be $true;
            }
            
        } #end context Validate Get-IPv4Address method
        
        Context 'Validate Get-Hostname method' {
            
            It 'Returns at least the current NetBIOS name' {
                $hostname = [System.Net.Dns]::GetHostname();
                
                $result = Get-Hostname;
            
                $result -match $hostname | Should Be $true;
            }
            
        } #end context Validate Get-Hostname method

        Context 'Validate Get-TargetResource method' {
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

        } #end Context Validate Get-TargetResource method
        
        Context 'Validate Test-TargetResource method' {
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
        
        } #end Context Validate Test-TargetResource method

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
