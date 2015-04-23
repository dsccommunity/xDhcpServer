<# 
.summary
    Test suite for MSFT_xDhcpServerOption.psm1
#>
[CmdletBinding()]
param()

Import-Module $PSScriptRoot\..\DSCResources\MSFT_xDhcpServerOption\MSFT_xDhcpServerOption.psm1

$ErrorActionPreference = 'stop'
Set-StrictMode -Version latest

function Suite.BeforeAll {
    # Remove any leftovers from previous test runs
    Suite.AfterAll 

}

function Suite.AfterAll {
    Remove-Module MSFT_xDhcpServerOption
}

function Suite.BeforeEach {
}

try
{
    Describe 'Validate-ResourceProperties' {
        BeforeEach {
            Suite.BeforeEach
        }

        AfterEach {
        }
            Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                return @{'DNS Servers'='bar'}
            }

            It 'Call Get-DhcpServerv4OptionValue' {
                MSFT_xDhcpServerOption\Validate-ResourceProperties
                Assert-MockCalled Get-DhcpServerv4OptionValue -Times 1
            }
    }


}
finally
{
    Suite.AfterAll
}

