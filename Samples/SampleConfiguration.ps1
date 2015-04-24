configuration Sample_xDhcpsServerScope_NewScope 
 { 
     Import-DscResource -module xDHCpServer 
     xDhcpServerScope Scope 
     { 
         Ensure = 'Present' 
         IPEndRange = '192.168.1.254' 
         IPStartRange = '192.168.1.1' 
         Name = 'PowerShellScope' 
         SubnetMask = '255.255.255.0' 
         LeaseDuration = '00:08:00' 
         State = 'Active' 
         AddressFamily = 'IPv4' 
     } 
     xDhcpServerReservation PullServerIP 
     { 
         Ensure = 'Present' 
         ScopeID = '192.168.1.0' 
         ClientMACAddress = '00155D8A54A1' 
         IPAddress = '192.168.10.2' 
         Name = 'DSCPullServer' 
         AddressFamily = 'IPv4' 
     }  
     xDhcpServerOption Option 
     { 
         Ensure = 'Present' 
         ScopeID = '192.168.10.0' 
         DnsDomain = 'contoso.com' 
         DnsServerIPAddress = '192.168.10.22','192.168.10.1' 
         AddressFamily = 'IPv4' 
         Router = '192.168.10.1'
     } 
 } 