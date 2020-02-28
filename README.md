# xDhcpServer

This module contains DSC resources for configuring and managing a Microsoft
DHCP Server.

[![Build Status](https://dev.azure.com/dsccommunity/xDhcpServer/_apis/build/status/dsccommunity.xDhcpServer?branchName=master)](https://dev.azure.com/dsccommunity/xDhcpServer/_build/latest?definitionId={definitionId}&branchName=master)
![Azure DevOps coverage (branch)](https://img.shields.io/azure-devops/coverage/dsccommunity/xDhcpServer/{definitionId}/master)
[![Azure DevOps tests](https://img.shields.io/azure-devops/tests/dsccommunity/xDhcpServer/{definitionId}/master)](https://dsccommunity.visualstudio.com/xDhcpServer/_test/analytics?definitionId={definitionId}&contextType=build)
[![PowerShell Gallery (with prereleases)](https://img.shields.io/powershellgallery/vpre/xDhcpServer?label=xDhcpServer%20Preview)](https://www.powershellgallery.com/packages/xDhcpServer/)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/v/xDhcpServer?label=xDhcpServer)](https://www.powershellgallery.com/packages/xDhcpServer/)

## Code of Conduct

This project has adopted this [Code of Conduct](CODE_OF_CONDUCT.md).

## Releases

For each merge to the branch `master` a preview release will be
deployed to [PowerShell Gallery](https://www.powershellgallery.com/).
Periodically a release version tag will be pushed which will deploy a
full release to [PowerShell Gallery](https://www.powershellgallery.com/).

## Contributing

Please check out common DSC Community [contributing guidelines](https://dsccommunity.org/guidelines/contributing).

## Resources

- **xDhcpServerClass** manages DHCP Classes (Vendor or User).
- **xDhcpServerScope** sets a scope for consecutive range of possible IP addresses that the DHCP server can lease to clients on a subnet.
- **xDhcpServerReservation** sets lease assignments used to ensure that a specified client on a subnet can always use the same IP address.
- **xDhcpServerOptions** (DEPRECATED) currently supports setting DNS domain and DNS Server IP Address options at a DHCP server scope level.
- **xDhcpServerAuthorization** authorizes a DHCP in Active Directory.
  - *This resource must run on an Active Directory domain controller.*
- **xDhcpServerOptionDefinition** manages DHCP option definitions.
- **DhcpServerOptionValue** manages an option value on server level.
- **DhcpScopeOptionValue** manages an option value on scope level.
- **DhcpReservedIPOptionValue** manages an option value on reserved IP level.
- **DhcpPolicyOptionValue** manages an option value on Policy level.

### xDhcpServerScope

- **ScopeId**: ScopeId of the DHCP scope
- **IPStartRange**: Starting address to set for this scope
- **IPEndRange**: Ending address to set for this scope
- **Name**: Name of this DHCP Scope
- **SubnetMask**: Subnet mask for the scope specified in IP address format
- **LeaseDuration**: Time interval for which an IP address should be leased
  - This should be specified in the following format: `Days.Hours:Minutes:Seconds`
  - For example, '`02.00:00:00`' is 2 days and '`08:00:00`' is 8 hours.
- **State**: Whether scope should be active or inactive.
- **Ensure**: Whether DHCP scope should be present or removed
- **ScopeID**: Scope Identifier. This is a read-only property for this resource.

### xDhcpServerReservation

- **ScopeID**: ScopeId for which reservations are set
- **IPAddress**: IP address of the reservation for which the properties are modified
- **ClientMACAddress**: Client MAC Address to set on the reservation
- **Name**: Reservation name
- **AddressFamily**: Address family type. Note: at this time, only IPv4 is supported.
- **Ensure**: Whether option should be set or removed

### xDhcpServerOption (DEPRECATED)

- **ScopeID**: ScopeID for which options are set
- **DnsServerIPAddress**: IP address of DNS Servers
- **DnsDomain**: Domain name of DNS Server
- **AddressFamily**: Address family type
- **Router**: The default gateway for clients
- **Ensure**: Whether option should be set or removed

### xDhcpServerAuthorization

- **Ensure**: Whether the DHCP server should be authorized.
- **DnsName**: FQDN of the server to authorize. If not specified, it defaults to the local hostname of the enacting node.
- **IPAddress**: IP v4 address of the server to authorized. If not specified, it default to the first IPv4 address of the enacting node.

### xDhcpServerClass

- **Name**: DHCP Class Name.
- **Type**: Class type, should be Vendor or User.
- **AsciiData**: Class Data in a ascii formated string.
- **AddressFamily**: Currently should be "IPv4".
- **Description**: Class Description.
- **Ensure**: Whether class should be set or removed.

### xDhcpServerOptionDefinition

- **OptionID**: Option ID, should be a number between 1 and 255.
- **VendorClass**: Vendor class. Use an empty string for standard option class.
- **Name**: Option name.
- **Type**: Option data type. { Byte | Word | Dword | DwordDword | IPv4Address | String | BinaryData | EncapsulatedData }
- **Multivalued**: Whether option is multivalued or not.
- **Description**: Option description.
- **AddressFamily**: Sets the address family for the option definition. Currently only IPv4 is supported. { IPv4 }
- **Ensure**: Whether option should be set or removed. { *Present* | Absent }

### DhcpScopeOptionValue

- **ScopeId**: Scope ID where to set the option value.
- **OptionId**: Option ID, specify an integer between 1 and 255.
- **Value**: Option data value. Could be an array of string for a multivalued option.
- **VendorClass**: Vendor class. Use an empty string for default vendor class.
- **UserClass**: User class. Use an empty string for default user class.
- **AddressFamily**:  Sets the address family for the option definition. Currently only IPv4 is supported. { IPv4 }
- **Ensure**: Whether option should be set or removed. { *Present* | Absent }

### DhcpServerOptionValue

- **OptionId**: Option ID, specify an integer between 1 and 255.
- **Value**: Option data value. Could be an array of string for a multivalued option.
- **VendorClass**: Vendor class. Use an empty string for default vendor class.
- **UserClass**: User class. Use an empty string for default user class.
- **AddressFamily**:  Sets the address family for the option definition. Currently only IPv4 is supported. { IPv4 }
- **Ensure**: Whether option should be set or removed. { *Present* | Absent }

### DhcpReservedIPOptionValue

- **ReservedIP**: Reserved IP to set the option value.
- **OptionId**: Option ID, specify an integer between 1 and 255.
- **Value**: Option data value. Could be an array of string for a multivalued option.
- **VendorClass**: Vendor class. Use an empty string for default vendor class.
- **UserClass**: User class. Use an empty string for default user class.
- **AddressFamily**:  Sets the address family for the option definition. Currently only IPv4 is supported. { IPv4 }
- **Ensure**: Whether option should be set or removed. { *Present* | Absent }

### DhcpPolicyOptionValue

- **PolicyName**: Dhcp Policy Name.
- **OptionId**: Option ID, specify an integer between 1 and 255.
- **Value**: Option data value. Could be an array of string for a multivalued option.
- **ScopeId**: Scope ID to get policy values from. Do not use it to get an option from server level.
- **VendorClass**: Vendor class. Use an empty string for default vendor class.
- **AddressFamily**:  Sets the address family for the option definition. Currently only IPv4 is supported. { IPv4 }
- **Ensure**: Whether option should be set or removed. { *Present* | Absent }
