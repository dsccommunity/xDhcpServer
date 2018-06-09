configuration Sample_xDhcpsServerScope_NewScope
{
    Import-DscResource -module xDHCpServer
    WindowsFeature DHCP
    {
       Name = 'DHCP'
       Ensure = 'Present'
    }

    xDhcpPolicyOptionValue policyOptionValue_ID-008
    {
        OptionId = 8
        Value = 1.1.1.1
        ScopeId =   ''
        VendorClass = ''
        AddressFamily = 'IPv4'
        PolicyName = 'TestPolicy'
        Ensure = 'Present'
    }

    xDhcpPolicyOptionValue policyOptionValue_ID-008-scope
    {
        OptionId = 8
        Value = 1.1.1.1
        ScopeId = 'testScope'
        VendorClass = ''
        AddressFamily = 'IPv4'
        PolicyName = 'testPolicy'
        Ensure = 'Present'
    }
}
