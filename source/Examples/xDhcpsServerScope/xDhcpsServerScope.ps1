<#
    .SYNOPSiS
       This example creates a new DHCP Server scope, or if the scope already exist
       it changes an existing scope.
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

    xDhcpServerScope 'Scope'
    {
        ScopeId       = '192.168.1.0'
        Ensure        = 'Present'
        IPEndRange    = '192.168.1.254'
        IPStartRange  = '192.168.1.1'
        Name          = 'PowerShellScope'
        SubnetMask    = '255.255.255.0'
        LeaseDuration = ((New-TimeSpan -Hours 8 ).ToString())
        State         = 'Active'
        AddressFamily = 'IPv4'
    }
}
