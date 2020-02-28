<#
    .SYNOPSiS
       This example will authorize a remote DHCP server.
#>
configuration Example
{
    Import-DscResource -moduleName 'xDhcpServer'

    xDhcpServerAuthorization 'RemoteServerActivation'
    {
        Ensure    = 'Present'
        DnsName   = 'servertoauthorize.contoso.com'
        IPAddress = '192.168.0.1'
    }
}
