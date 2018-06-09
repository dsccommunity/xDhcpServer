configuration Sample_xDhcpsServerScope_NewScope
{
    Import-DscResource -module xDHCpServer
    WindowsFeature DHCP
    {
       Name = 'DHCP'
       Ensure = 'Present'
    }

    #set scope gateway
    xDhcpScopeOptionValue scopeOptionGateway
    {
        OptionId = 3
        Value = 1.1.1.1
        ScopeId =   '1.1.1.0'
        VendorClass = ''
        UserClass   = ''
        AddressFamily = 'IPv4'
    }

    #set scope DNS servers
    xDhcpScopeOptionValue scopeOptionDNS
    {
        OptionId = 6
        Value = 1.1.1.1,2.2.2.2
        ScopeId =   '1.1.1.0'
        VendorClass = ''
        UserClass   = ''
        AddressFamily = 'IPv4'
    }

    #set scope DNS domain name
    xDhcpScopeOptionValue scopeOptionDNSDomainName
    {
        OptionId = 15
        Value = 'Contoso.com'
        ScopeId =   '1.1.1.0'
        VendorClass = ''
        UserClass   = ''
        AddressFamily = 'IPv4'
    }
}