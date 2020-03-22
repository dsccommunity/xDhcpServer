# Stubs

A stub function is function with just the skeleton of the original function
or cmdlet. Pester can use a stub function to have something to hook into
when a mock of a cmdlet or function is needed in a unit test. Stub functions
make it possible to run unit tests without having the actual module with
the cmdlet or function installed.

## How to

Install the module 'Indented.StubCommand' from PowerShell Gallery.

```powershell
Install-Module Indented.StubCommand -Scope CurrentUser
```

Install the necessary features to get the modules to create stubs from.

```powershell
Install-WindowsFeature -Name 'RSAT-DHCP'
```

Create the stub modules in output folder 'c:\projects\stub' (can be any
folder).

```powershell
$destinationFolder = 'c:\projects\stubs\'

$functionBody = {
    throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
}

New-StubModule -FromModule 'DhcpServer' -Path $destinationFolder -FunctionBody $functionBody
```
