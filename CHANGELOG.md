# Change log for xDhcpServer

The format is based on and uses the types of changes according to [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- xDhcpServer
  - Added automatic release with a new CI pipeline ([issue #59](https://github.com/dsccommunity/xDhcpServer/issues/59).

### Removed

- Removed the deprecated resource xDhcpServerOption which has been replaced
  by other DSC resources ([issue #46](https://github.com/dsccommunity/xDhcpServer/issues/46).

### [2.0.0.0] - 2018-07-25

- BREAKING CHANGE: Switch to ScopeId as a key property for xDhcpServerScope
  ([issue #48](https://github.com/dsccommunity/xDhcpServer/issues/48).
  [Bartek Bielawski (@bielawb)](https://github.com/bielawb)

### [1.7.0.0] - 2018-06-13

- Changes to xDhcpServer
  - Updated year in LICENSE file.
  - Updated year in module manifest.
  - Added Codecov and status badges to README.md.
  - Update appveyor.yml to use the default template.
- Added xDhcpServerOptionDefinition
- Added DhcpScopeOptionValue
- Added DhcpServerOptionValue
- Added DhcpReservedIPOptionValue
- Added DhcpPolicyOptionValue

### [1.6.0.0] - 2017-08-23

- Added xDhcpServerClass

### [1.5.0.0] - 2016-08-10

- Converted AppVeyor.yml to pull Pester from PSGallery instead of Chocolatey
- Bug Fix fixes xDhcpServerOption\Get-TargetResource not returning Router property

### [1.4.0.0] - 2016-02-02

- Bug Fix fixes localization bug in xDhcpServerScope option enumeration

### [1.3.0.0] - 2016-02-02

- Added **xDhcpServerAuthorization** resource.
- Bug Fix LeaseDuration is no longer mandatory for xDhcpServerScope resource.
- Bug Fix DnsServerIPAddress is no longer mandatory for xDhcpServerOption resource.
- Bug Fix corrects verbose display output in xDhcpServerOption resource.

### [1.2.0.0] - 2015-05-01

- Fix "Cannot set default gateway on xDhcpServerOption".

### [1.1.0.0] - 2015-04-17

- Bug fix, enables creating more than 1 DHCP server scope.

### [1.0.0.0] - 2015-04-15

- Initial release with the following resources
  - **xDhcpServerScope**
  - **xDhcpServerReservation**
  - **xDhcpServerOptions**
