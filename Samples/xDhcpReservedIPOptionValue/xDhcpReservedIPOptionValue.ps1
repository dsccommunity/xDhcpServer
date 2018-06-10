configuration Sample_xDhcpsServerScope_NewScope
{
    Import-DscResource -module xDHCpServer -ModuleVersion
    WindowsFeature DHCP
    {
       Name = 'DHCP'
       Ensure = 'Present'
    }

    xDhcpReservedIPOptionValue ReservedIPOptionValue_ID-008
    {
        ReservedIP = 192.168.0.1
        OptionId = 8
        Value = 1.1.1.1
        VendorClass = ''
        UserClass = ''
        AddressFamily = 'IPv4'
        Ensure = 'Present'
    }
}
