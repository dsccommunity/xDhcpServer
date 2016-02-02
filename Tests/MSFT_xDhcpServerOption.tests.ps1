<# 
.summary
    Test suite for MSFT_xDhcpServerOption.psm1
    These tests require RSAT on client.
    On 8.1 it's found here: http://www.microsoft.com/en-us/download/confirmation.aspx?id=39296&6B49FDFB-8E5B-4B07-BC31-15695C5A2143=1
#>
[CmdletBinding()]
param()

$global:DhpcOptionTest=$true
$ModuleName = 'MSFT_xDhcpServerOption'
Import-Module "$PSScriptRoot\..\DSCResources\$ModuleName\$ModuleName.psm1"

$ErrorActionPreference = 'stop'
Set-StrictMode -Version latest

# should check for the server OS
if($env:APPVEYOR_BUILD_VERSION)
{
  Add-WindowsFeature RSAT-DHCP -verbose
}

function Suite.BeforeAll {
    # Remove any leftovers from previous test runs
    Suite.AfterAll 

}

function Suite.AfterAll {
    Remove-Module MSFT_xDhcpServerOption
    $global:DhpcOptionTest=$null
}

function Suite.BeforeEach {
}

try
{
    Describe 'Validate "ValidateResourceProperties" method' {
        InModuleScope $ModuleName {

        BeforeEach {
            Suite.BeforeEach
        }

        AfterEach {
        }
            $global:dnsDomainName = 'contoso.com'
            $global:dnsIpAddress = @('2.1.1.2','2.1.1.3')
            $global:routeripAddress = '1.1.1.2'
            Mock -CommandName Set-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith { }
            
            # Absent removes the whole option, so this is not new to this issue.
            # So not currently testing Absent and Apply = $true
            foreach($params in @(@{Ensure='Present';Apply=$false},@{Ensure='Absent';Apply=$false},@{Ensure='Present';Apply=$true}))
            {
                It "Return true when DNS Server scalar match, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{name='DNS Servers';Value=$dnsIpAddress[1]})
                    } 

                    $expectedReturn = $true
                    if($params.Ensure -eq 'Absent')
                    {
                        $expectedReturn = $false
                    }            
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }    
                    $result = MSFT_xDhcpServerOption\ValidateResourceProperties @params -scopeId '1.1.1.0' -DnsServerIPAddress $dnsIpAddress[1] -Verbose
                    
                    $result | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue  -Scope It
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue -Exactly 0 -Scope It
                }
                It "Return true when DNS Server array match, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{name='DNS Servers';Value=$dnsIpAddress})
                    } 

                    $expectedReturn = $true
                    if($params.Ensure -eq 'Absent')
                    {
                        $expectedReturn = $false
                    }            
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }      
                    $result = MSFT_xDhcpServerOption\ValidateResourceProperties @params -scopeId '1.1.1.0' -DnsServerIPAddress $dnsIpAddress -Verbose
                    
                    $result | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue -Scope It
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue -Exactly 0 -Scope It
                }
                It "Return false when DNS Server mismatch, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{name='DNS Servers';Value=$dnsIpAddress})
                    } 

                    $expectedReturn = $false
                    $setMockCalledParams = @{}
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }          
                    else
                    {
                        $setMockCalledParams.Add('Exactly',$true)
                        $setMockCalledParams.Add('Times',0)
                    }  
                    $result = MSFT_xDhcpServerOption\ValidateResourceProperties @params -scopeId '1.1.1.0' -DnsServerIPAddress '1.2.2.1' -Verbose
                    
                    $result | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue -Scope It           
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue @setMockCalledParams -Scope It
                }
                
                It "Return false when DNS Server empty, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{name='DNS Domain Name';Value=$dnsDomainName})
                    } 

                    $expectedReturn = $false
                    $setMockCalledParams = @{}
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }          
                    else
                    {
                        $setMockCalledParams.Add('Exactly',$true)
                        $setMockCalledParams.Add('Times',0)
                    }  
                    $result = MSFT_xDhcpServerOption\ValidateResourceProperties @params -scopeId '1.1.1.0' -DnsServerIPAddress '1.2.2.1' -Verbose
                    
                    $result | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue -Scope It           
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue @setMockCalledParams -Scope It
                }
                
                It "Return true when DNS domain name match, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{name='DNS Domain Name';Value=$dnsDomainName})
                    } 

                    $expectedReturn = $true
                    if($params.Ensure -eq 'Absent')
                    {
                        $expectedReturn = $false
                    }            
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }          
                    $result = MSFT_xDhcpServerOption\ValidateResourceProperties @params -scopeId '1.1.1.0' -DnsDomain $dnsDomainName -Verbose
                    
                    $result | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue -Scope It
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue -Exactly 0 -Scope It
                }
                
                It "Return false when DNS domain name mismatch, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{name='DNS Domain Name';Value=$dnsDomainName})
                    } 

                    $expectedReturn = $false
                    $setMockCalledParams = @{}
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }          
                    else
                    {
                        $setMockCalledParams.Add('Exactly',$true)
                        $setMockCalledParams.Add('Times',0)
                    }  
                    $result = MSFT_xDhcpServerOption\ValidateResourceProperties @params -scopeId '1.1.1.0' -DnsDomain 'wrong.com' -Verbose
                    
                    $result | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue -Scope It           
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue @setMockCalledParams -Scope It
                }
                It "Return true when Router scalar match, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{OptionId=3;Value=$routeripAddress})
                    } 

                    $expectedReturn = $true
                    if($params.Ensure -eq 'Absent')
                    {
                        $expectedReturn = $false
                    }            
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }          
                    $result = MSFT_xDhcpServerOption\ValidateResourceProperties @params -scopeId '1.1.1.0' -Router $routeripAddress -Verbose
                    
                    $result | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue -Scope It
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue -Exactly 0 -Scope It
                }

                It "Return true when Router array match, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{OptionId=3;Value=$routeripAddress})
                    } 

                    $expectedReturn = $true
                    if($params.Ensure -eq 'Absent')
                    {
                        $expectedReturn = $false
                    }            
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }          
                    $result = MSFT_xDhcpServerOption\ValidateResourceProperties @params -scopeId '1.1.1.0' -Router $routeripAddress -Verbose
                    
                    $result | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue -Scope It        
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue -Exactly 0 -Scope It
                }

                It "Return false when Router scalar mismatch, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{OptionId=3;Value=$routeripAddress})
                    } 

                    $expectedReturn = $false
                    $setMockCalledParams = @{}
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }          
                    else
                    {
                        $setMockCalledParams.Add('Exactly',$true)
                        $setMockCalledParams.Add('Times',0)
                    }  
                    $result = MSFT_xDhcpServerOption\ValidateResourceProperties @params -scopeId '1.1.1.0' -Router '1.1.1.3' -Verbose
                    
                    $result | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue -Scope It           
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue @setMockCalledParams -Scope It
                }

                It "Return false when Router array mismatch, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{OptionId=3;Value=$routeripAddress})
                    } 

                    $expectedReturn = $false
                    $setMockCalledParams = @{}
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }          
                    else
                    {
                        $setMockCalledParams.Add('Exactly',$true)
                        $setMockCalledParams.Add('Times',0)
                    }  
                    
                    
                    $result = MSFT_xDhcpServerOption\ValidateResourceProperties @params -scopeId '1.1.1.0' -Router  @('1.1.1.2','1.1.1.4') -Verbose
                    
                    $result | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue -Scope It         
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue @setMockCalledParams -Scope It
                }
                
                It "Return false when Router array extra element, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{OptionId=3;Value=$routeripAddress})
                    } 

                    $expectedReturn = $false
                    $setMockCalledParams = @{}
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }          
                    else
                    {
                        $setMockCalledParams.Add('Exactly',$true)
                        $setMockCalledParams.Add('Times',0)
                    }  
                    
                    $result = MSFT_xDhcpServerOption\ValidateResourceProperties @params -scopeId '1.1.1.0'-Router  @('1.1.1.2','1.1.1.3', '1.1.1.4') -Verbose
                    
                    $result | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue -Scope It             
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue @setMockCalledParams -Scope It
                }
                
                It "Return false when Router array missing element, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{OptionId=3;Value=$routeripAddress})
                    } 

                    $expectedReturn = $false
                    $setMockCalledParams = @{}
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }          
                    else
                    {
                        $setMockCalledParams.Add('Exactly',$true)
                        $setMockCalledParams.Add('Times',0)
                    }  
                    $result = MSFT_xDhcpServerOption\ValidateResourceProperties @params -scopeId '1.1.1.0' -Router  @('1.1.1.2','1.1.1.3') -Verbose
                    
                    $result | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue -Scope It
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue @setMockCalledParams -Scope It
                }
            }

    } #end in module scope
    } #end describe
}
finally
{
    Suite.AfterAll
}

