#region HEADER

$script:projectPath = "$PSScriptRoot\..\.." | Convert-Path
$script:projectName = (Get-ChildItem -Path "$script:projectPath\*\*.psd1" | Where-Object -FilterScript {
        ($_.Directory.Name -match 'source|src' -or $_.Directory.Name -eq $_.BaseName) -and
        $(try
            {
                Test-ModuleManifest -Path $_.FullName -ErrorAction Stop
            }
            catch
            {
                $false
            })
    }).BaseName

$script:parentModule = Get-Module -Name $script:projectName -ListAvailable | Select-Object -First 1
$script:subModulesFolder = Join-Path -Path $script:parentModule.ModuleBase -ChildPath 'Modules'
Remove-Module -Name $script:parentModule -Force -ErrorAction 'SilentlyContinue'

$script:subModuleName = (Split-Path -Path $PSCommandPath -Leaf) -replace '\.Tests.ps1'
$script:subModuleFile = Join-Path -Path $script:subModulesFolder -ChildPath "$($script:subModuleName)"

Import-Module $script:subModuleFile -Force -ErrorAction 'Stop'
#endregion HEADER


InModuleScope $script:subModuleName {
    $testParams = @{
        ScopeId       = '192.168.1.0'
        IPStartRange  = '192.168.1.10'
        IPEndRange    = '192.168.1.99'
        SubnetMask    = '255.255.255.0'
        AddressFamily = 'IPv4'
        Verbose       = $true
    }

    Describe 'DhcpServerDsc.Common\Assert-ScopeParameter' {
        It 'Should not throw when parameters are correct' {
            { Assert-ScopeParameter @testParams } | Should -Not -Throw
        }

        It 'Should return nothing when parameters are correct' {
            Assert-ScopeParameter @testParams | Should -BeNullOrEmpty
        }

        It 'Should throw an exception with ErrorId <ErrorId> and information about incorrect <Parameter> (<Value>)' {
            param
            (
                [Parameter()]
                [System.String]
                $Parameter,

                [Parameter()]
                [System.String]
                $Value,

                [Parameter()]
                [System.String]
                $ErrorPattern,

                [Parameter()]
                [System.String]
                $ErrorId
            )

            $brokenTestParams = $testParams.Clone()
            $brokenTestParams[$Parameter] = $Value

            { Assert-ScopeParameter @brokenTestParams } | Should -Throw -ExpectedMessage $ErrorPattern -ErrorId $ErrorId
        } -TestCases @(
            @{
                Parameter    = 'ScopeId'
                Value        = '192.168.1.42'
                ErrorPattern = 'Value of byte 4 in IPEndRange (99) is not valid. Binary AND with byte 4 in SubnetMask (0) should be equal to byte 4 in ScopeId (42).'
                ErrorId      = 'ScopeIdOrMaskIncorrect'
            }
            @{
                Parameter    = 'IPStartRange'
                Value        = '192.168.0.1'
                ErrorPattern = 'Value of byte 3 in IPStartRange (0) is not valid.'
                ErrorId      = 'ScopeIdOrMaskIncorrect'
            }
            @{
                Parameter    = 'IPEndRange'
                Value        = '192.167.1.100'
                ErrorPattern = 'Value of byte 2 in IPEndRange (167) is not valid.'
                ErrorId      = 'ScopeIdOrMaskIncorrect'
            }
            @{
                Parameter    = 'IPEndRange'
                Value        = '192.168.1.2'
                ErrorPattern = 'not valid. Start should be lower than end.'
                ErrorId      = 'RangeNotCorrect'
            }
        )
    }
}
