$Global:DSCModuleName      = 'xDhcpServer'
$Global:DSCResourceName    = 'MSFT_xDhcpServerClass'

#region HEADER
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
#endregion

# TODO: Other Optional Init Code Goes Here...

# Begin Testing
try
{

    #region Pester Tests

    # The InModuleScope command allows you to perform white-box unit testing on the internal
    # (non-exported) code of a Script Module.
    InModuleScope $Global:DSCResourceName {

        ## Mock missing functions
        function Get-DhcpServerv4Class { }



        #region Pester Test Initialization
        
        $testClassName = 'Test Class';
        $testClassType = 'Vendor';
        $testAsciiData = 'test data';
        $testClassDescription = 'test class description';
        $testClassAddressFamily = 'IPv4';
        $testEnsure = 'Present'

        
        $testParams = @{
            Name = $testClassName;
            Type = $testClassType;
            AsciiData = $testAsciiData;
            AddressFamily = 'IPv4'
            Description = $testClassDescription
            Ensure = $testEnsure
        }
        
        $fakeDhcpServerClass = [PSCustomObject] @{
        'Name'=$testClassName;
        'Type'=$testClassType
        'AsciiData' = $testAsciiData
        'Description' = $testClassDescription
        'AddressFamily' = $testClassAddressFamily
        }
        
        
        #endregion

        #region Function Get-TargetResource
        Describe "$($Global:DSCResourceName)\Get-TargetResource" {
            
        Mock Assert-Module -ParameterFilter { $ModuleName -eq 'DHCPServer' } { }


        It 'Calls "Assert-Module" to ensure "DHCPServer" module is available' {
            Mock Get-DhcpServerv4Class { return $fakeDhcpServerClass; }
     
            $result = Get-TargetResource @testParams;
                           
            Assert-MockCalled Assert-Module -ParameterFilter { $ModuleName -eq 'DHCPServer' } -Scope It;
            }


        It 'Returns a "System.Collections.Hashtable" object type' {
            Mock Get-DhcpServerv4Class { return $fakeDhcpServerClass; }
                $result = Get-TargetResource @testParams;
                $result -is [System.Collections.Hashtable] | Should Be $true;
            }
        }
        #endregion Function Get-TargetResource
        
        #region Function Test-TargetResource
        Describe "$($Global:DSCResourceName)\Test-TargetResource" {

            Mock Assert-Module -ParameterFilter { $ModuleName -eq 'DHCPServer' } { }

            It 'Returns a "System.Boolean" object type' {
                Mock Get-DhcpServerv4Class { return $fakeDhcpServerClass; }

                $result = Test-TargetResource @testParams;

                $result -is [System.Boolean] | Should Be $true;
            }

            It 'Passes when all parameters are correct' {
                Mock Get-DhcpServerv4Class { return $fakeDhcpServerClass; }
                
                $result = Test-TargetResource @testParams;
                
                $result | Should Be $true;
            }

   
        
        }
        #endregion Function Test-TargetResource 

        #region Function Set-TargetResource
 <#       Describe "$($Global:DSCResourceName)\Set-TargetResource" {
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
        #endregion Function Set-TargetResource
        
        #region Function Get-IPv4Address
        Describe "$($Global:DSCResourceName)\Get-IPv4Address" {
            
            It 'Returns a IPv4 address' {
                $result = Get-IPv4Address;
                
                $result -match '\d+\.\d+\.\d+\.\d+' | Should Be $true;
            }
            
        }
        #endregion Function Get-IPv4Address
        
        #region Function Get-Hostname
        Describe "$($Global:DSCResourceName)\Get-Hostname" {
            
            It 'Returns at least the current NetBIOS name' {
                $hostname = [System.Net.Dns]::GetHostname();
                
                $result = Get-Hostname;
            
                $result -match $hostname | Should Be $true;
            }
            
        }
        #endregion Function Get-Hostname
        #>
    
    } #end InModuleScope

}
finally
{
    #region FOOTER
    Restore-TestEnvironment -TestEnvironment $TestEnvironment
    #endregion
}
