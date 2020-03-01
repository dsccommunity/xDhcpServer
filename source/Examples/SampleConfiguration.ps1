configuration Sample_xDhcpServerScope_NewScope
{
    Import-DscResource -ModuleName 'PSDscResources' -ModuleVersion '2.12.0.0'
    Import-DscResource -ModuleName xDhcpServer

    WindowsFeature 'DHCP'
    {
        Name   = 'DHCP'
        Ensure = 'Present'
    }

    xDhcpServerScope 'Scope'
    {
        Ensure        = 'Present'
        ScopeId       = '192.168.1.0'
        IPStartRange  = '192.168.1.1'
        IPEndRange    = '192.168.1.254'
        Name          = 'ContosoScope'
        SubnetMask    = '255.255.255.0'
        LeaseDuration = '00:08:00'
        State         = 'Active'
        AddressFamily = 'IPv4'

        DependsOn     = @('[WindowsFeature]DHCP')
    }

    xDhcpServerReservation 'PullServerIP'
    {
        Ensure           = 'Present'
        ScopeID          = '192.168.1.0'
        ClientMACAddress = '00155D8A54A1'
        IPAddress        = '192.168.1.2'
        Name             = 'DSCPullServer'
        AddressFamily    = 'IPv4'

        DependsOn        = @('[WindowsFeature]DHCP')
    }

    # Setting scope gateway
    DhcpScopeOptionValue 'ScopeOptionGateway'
    {
        OptionId      = 3
        ScopeID       = '192.168.1.0'
        Value         = '192.168.1.1'
        VendorClass   = ''
        UserClass     = ''
        AddressFamily = 'IPv4'

        DependsOn          = @('[WindowsFeature]DHCP')
    }

    # Setting scope DNS servers
    DhcpScopeOptionValue 'ScopeOptionDNS'
    {
        OptionId      = 6
        ScopeID       = '192.168.1.0'
        Value         = @('192.168.1.22', '192.168.1.1')
        VendorClass   = ''
        UserClass     = ''
        AddressFamily = 'IPv4'

        DependsOn          = @('[WindowsFeature]DHCP')
    }

    # Setting scope DNS domain name
    DhcpScopeOptionValue 'ScopeOptionDNSDomainName'
    {
        OptionId      = 15
        ScopeID       = '192.168.1.0'
        Value         = 'contoso.com'
        VendorClass   = ''
        UserClass     = ''
        AddressFamily = 'IPv4'

        DependsOn          = @('[WindowsFeature]DHCP')
    }

    xDhcpServerClass 'DHCPServerClass'
    {
        ensure        = 'Present'
        Name          = 'VendorClass'
        Type          = 'Vendor'
        AsciiData     = 'sampledata'
        AddressFamily = 'IPv4'

        Description   = 'Vendor Class Description'
    }

    xDhcpServerOptionDefinition 'DHCPServerOptionDefinition'
    {
        Ensure        = 'Present'
        Name          = 'Cisco AP c1700 Provisioning'
        OptionID      = '200'
        Type          = 'IPv4Address'
        AddressFamily = 'IPv4'
        VendorClass   = 'Cisco AP c1700'
        Description   = 'Sample description'
    }

    xDhcpServerOptionDefinition 'DHCPServerOptionDefinition'
    {
        Ensure        = 'Present'
        Name          = 'sample name'
        OptionID      = '200'
        Type          = 'IPv4Address'
        AddressFamily = 'IPv4'
        VendorClass   = ''  #default option class
        Description   = 'Sample description'
    }
}
