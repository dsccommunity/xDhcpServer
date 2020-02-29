@{
    # Script module or binary module file associated with this manifest.
    RootModule        = 'DhcpServerDsc.Common.psm1'

    # Version number of this module.
    ModuleVersion     = '1.0.0'

    # ID used to uniquely identify this module
    GUID              = 'a4eab91d-fba0-479d-9954-7aa1d3677ae5'

    # Author of this module
    Author            = 'DSC Community'

    # Company or vendor of this module
    CompanyName       = 'DSC Community'

    # Copyright statement for this module
    Copyright         = 'Copyright the DSC Community contributors. All rights reserved.'

    # Description of the functionality provided by this module
    Description       = 'Common functions used by the DSC resources in xDhcpServer.'

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @(
        'New-TerminatingError'
        'Get-ValidIPAddress'
        'Assert-Module'
        'Assert-ScopeParameter'
        'Write-PropertyMessage'
        'Get-ValidTimeSpan'
    )

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport   = @()

    # Variables to export from this module
    VariablesToExport = @()

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport   = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData       = @{
        PSData = @{
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}

