<#
.summary
    Test suite for MSFT_xDhcpServerExclusionRange.psm1
    These tests require RSAT on client.
    On 8.1 it's found here: http://www.microsoft.com/en-us/download/confirmation.aspx?id=39296&6B49FDFB-8E5B-4B07-BC31-15695C5A2143=1
#>
[CmdletBinding()]
param()

$global:DhpcExclusionRangeTest=$true
$ModuleName = 'MSFT_xDhcpServerExclusionRange'
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
    Remove-Module MSFT_xDhcpServerExclusionRange
    $global:DhpcExclusionRangeTest=$null
}

function Suite.BeforeEach {
}

try
{
    Describe 'Validate "Validate-ResourceProperties" method' {

        InModuleScope $ModuleName {

            BeforeEach {
                Suite.BeforeEach
            }

            AfterEach {
            }

            $global:ScopeId = '1.1.1.0'
            $global:StartRange = '1.1.1.200'
            $global:EndRange = '1.1.1.254'

            Mock -CommandName Get-DhcpServerv4ExclusionRange -ModuleName MSFT_xDhcpServerExclusionRange -MockWith {
                return @(new-object psobject -property @{
                    ScopeId=$global:ScopeId
                    StartRange=$global:StartRange
                    EndRange=$global:EndRange
                })
            }

            Mock -CommandName Add-DhcpServerv4ExclusionRange -ModuleName MSFT_xDhcpServerExclusionRange -MockWith { }

            # Absent removes the whole exclusion range, so this is not new to this issue.
            # So not currently testing Absent and Apply = $true
            foreach($params in @(@{Ensure='Present';Apply=$false},@{Ensure='Absent';Apply=$false},@{Ensure='Present';Apply=$true}))
            {
              <# TESTS
                 GO
                 HERE #>
            }#end foreach
        } #end in module scope
    } #end describe
}
finally
{
    Suite.AfterAll
}
