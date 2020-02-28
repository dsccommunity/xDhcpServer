<#
    .SYNOPSiS
       This example will authorize the local DHCP server.
#>
configuration Example
{
    Import-DscResource -ModuleName 'PSDscResources' -ModuleVersion '2.12.0.0'
    Import-DscResource -moduleName 'xDhcpServer'

    WindowsFeature 'DHCP'
    {
        Name   = 'DHCP'
        Ensure = 'Present'
    }

    xDhcpServerAuthorization 'LocalServerActivation'
    {
        Ensure = 'Present'
    }
}
