configuration Sample_xDhcpsServerScope_NewScope
{
    Import-DscResource -module xDHCpServer
    WindowsFeature DHCP
    {
       Name = 'DHCP'
       Ensure = 'Present'
    }

    xDhcpServerOptionValue ServerOptionValue_ID-008
    {
        OptionId = 8
        Value = 1.1.1.1
        VendorClass = ''
        UserClass = ''
        AddressFamily = 'IPv4'
        Ensure = 'Present'
    }
}