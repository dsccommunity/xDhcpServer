# Name: DhcpServer
# Version: 2.0.0.0
# CreatedOn: 2020-02-29 10:39:05Z

function Reconcile-DhcpServerv4IPRecord {
    <#
    .SYNOPSIS
        Repair-DhcpServerv4IPRecord [-ScopeId] <ipaddress[]> [-ComputerName <string>] [-ReportOnly] [-Force] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4IPRecords')]
    param (
        [Parameter(ParameterSetName='Repair0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Repair0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${ScopeId},

        [Parameter(ParameterSetName='Repair0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${ReportOnly},

        [Parameter(ParameterSetName='Repair0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Force},

        [Parameter(ParameterSetName='Repair0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Repair0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Repair0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerInDC {
    <#
    .SYNOPSIS
        Add-DhcpServerInDC [[-DnsName] <string>] [[-IPAddress] <ipaddress>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerInDC')]
    param (
        [Parameter(ParameterSetName='Add0', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${DnsName},

        [Parameter(ParameterSetName='Add0', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${IPAddress},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerSecurityGroup {
    <#
    .SYNOPSIS
        Add-DhcpServerSecurityGroup [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    param (
        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv4Class {
    <#
    .SYNOPSIS
        Add-DhcpServerv4Class [-Name] <string> [-Type] <string> [-Data] <string> [-Description <string>] [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Class')]
    param (
        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Vendor','User')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Type},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Data},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv4ExclusionRange {
    <#
    .SYNOPSIS
        Add-DhcpServerv4ExclusionRange [-ScopeId] <ipaddress> [-StartRange] <ipaddress> [-EndRange] <ipaddress> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4ExclusionRange')]
    param (
        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${StartRange},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${EndRange},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv4Failover {
    <#
    .SYNOPSIS
        Add-DhcpServerv4Failover [-Name] <string> [-ScopeId] <ipaddress[]> [-PartnerServer] <string> [-ComputerName <string>] [-MaxClientLeadTime <timespan>] [-AutoStateTransition <bool>] [-StateSwitchInterval <timespan>] [-Force] [-SharedSecret <string>] [-PassThru] [-LoadBalancePercent <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Add-DhcpServerv4Failover [-Name] <string> [-ScopeId] <ipaddress[]> [-PartnerServer] <string> [-ComputerName <string>] [-MaxClientLeadTime <timespan>] [-AutoStateTransition <bool>] [-StateSwitchInterval <timespan>] [-Force] [-SharedSecret <string>] [-PassThru] [-ReservePercent <uint32>] [-ServerRole <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='LoadBalance', SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Failover')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Failover')]
    param (
        [Parameter(ParameterSetName='LoadBalance')]
        [Parameter(ParameterSetName='HotStandby')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='LoadBalance', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='HotStandby', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='LoadBalance', Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='HotStandby', Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${PartnerServer},

        [Parameter(ParameterSetName='LoadBalance', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='HotStandby', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${ScopeId},

        [Parameter(ParameterSetName='LoadBalance', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='HotStandby', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${MaxClientLeadTime},

        [Parameter(ParameterSetName='LoadBalance', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='HotStandby', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${AutoStateTransition},

        [Parameter(ParameterSetName='LoadBalance', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='HotStandby', ValueFromPipelineByPropertyName=$true)]
        [System.Nullable[timespan]]
        ${StateSwitchInterval},

        [Parameter(ParameterSetName='LoadBalance')]
        [Parameter(ParameterSetName='HotStandby')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Force},

        [Parameter(ParameterSetName='LoadBalance')]
        [Parameter(ParameterSetName='HotStandby')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${SharedSecret},

        [Parameter(ParameterSetName='LoadBalance')]
        [Parameter(ParameterSetName='HotStandby')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='HotStandby')]
        [ValidateRange(0, 100)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${ReservePercent},

        [Parameter(ParameterSetName='HotStandby')]
        [ValidateSet('Active','Standby')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ServerRole},

        [Parameter(ParameterSetName='LoadBalance')]
        [ValidateRange(0, 100)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${LoadBalancePercent},

        [Parameter(ParameterSetName='LoadBalance')]
        [Parameter(ParameterSetName='HotStandby')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='LoadBalance')]
        [Parameter(ParameterSetName='HotStandby')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='LoadBalance')]
        [Parameter(ParameterSetName='HotStandby')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv4FailoverScope {
    <#
    .SYNOPSIS
        Add-DhcpServerv4FailoverScope [-Name] <string> [-ScopeId] <ipaddress[]> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Failover')]
    param (
        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${ScopeId},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv4Filter {
    <#
    .SYNOPSIS
        Add-DhcpServerv4Filter [-List] <string> [-MacAddress] <string[]> [-ComputerName <string>] [-Description <string>] [-Force] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Filter')]
    param (
        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [Alias('ClientId')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${MacAddress},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Allow','Deny')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${List},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Force},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv4Lease {
    <#
    .SYNOPSIS
        Add-DhcpServerv4Lease [-ScopeId] <ipaddress> [-IPAddress] <ipaddress> [-ClientId] <string> [-AddressState <string>] [-HostName <string>] [-Description <string>] [-ComputerName <string>] [-PassThru] [-DnsRR <string>] [-DnsRegistration <string>] [-ClientType <string>] [-LeaseExpiryTime <datetime>] [-NapCapable <bool>] [-NapStatus <string>] [-ProbationEnds <datetime>] [-PolicyName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Lease')]
    param (
        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${IPAddress},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ClientId},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Active','Declined','Expired','ActiveReservation','InactiveReservation')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${AddressState},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [System.String]
        ${HostName},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('A','PTR','AandPTR','NoRegistration')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${DnsRR},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Complete','Pending','NotApplicable')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${DnsRegistration},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('UnSpecified','Dhcp','BootP','None','Both')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ClientType},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.Nullable[datetime]]
        ${LeaseExpiryTime},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${NapCapable},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('FullAccess','RestrictedAccess','DropPacket','InProbation','Exempt','DefaultQuarantineSetting','NoQuarantineInfo')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${NapStatus},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.Nullable[datetime]]
        ${ProbationEnds},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [System.String]
        ${PolicyName},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv4MulticastExclusionRange {
    <#
    .SYNOPSIS
        Add-DhcpServerv4MulticastExclusionRange [-Name] <string> [-StartRange] <ipaddress> [-EndRange] <ipaddress> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4MulticastExclusionRange')]
    param (
        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${StartRange},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${EndRange},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv4MulticastScope {
    <#
    .SYNOPSIS
        Add-DhcpServerv4MulticastScope [-Name] <string> [-StartRange] <ipaddress> [-EndRange] <ipaddress> [-ComputerName <string>] [-Description <string>] [-State <string>] [-LeaseDuration <timespan>] [-PassThru] [-Ttl <uint32>] [-ExpiryTime <datetime>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4MulticastScope')]
    param (
        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${StartRange},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${EndRange},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Active','InActive')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${State},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${LeaseDuration},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateRange(1, 255)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${Ttl},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [datetime]
        ${ExpiryTime},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv4OptionDefinition {
    <#
    .SYNOPSIS
        Add-DhcpServerv4OptionDefinition [-Name] <string> [-OptionId] <uint32> [-Type] <string> [-ComputerName <string>] [-Description <string>] [-MultiValued] [-VendorClass <string>] [-DefaultValue <string[]>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4OptionDefinition')]
    param (
        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${OptionId},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Byte','Word','DWord','DWordDWord','IPv4Address','String','BinaryData','EncapsulatedData')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Type},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${MultiValued},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${VendorClass},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [string[]]
        ${DefaultValue},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv4Policy {
    <#
    .SYNOPSIS
        Add-DhcpServerv4Policy [-Name] <string> [-Condition] <string> [-ComputerName <string>] [-Description <string>] [-ScopeId <ipaddress>] [-ProcessingOrder <uint16>] [-RelayAgent <string[]>] [-RemoteId <string[]>] [-SubscriberId <string[]>] [-PassThru] [-LeaseDuration <timespan>] [-Fqdn <string[]>] [-Enabled <bool>] [-VendorClass <string[]>] [-UserClass <string[]>] [-MacAddress <string[]>] [-CircuitId <string[]>] [-ClientId <string[]>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Policy')]
    param (
        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('And','Or')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Condition},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [AllowEmptyString()]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint16]
        ${ProcessingOrder},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${RelayAgent},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${RemoteId},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${SubscriberId},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${LeaseDuration},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${Fqdn},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${Enabled},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${VendorClass},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${UserClass},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${MacAddress},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${CircuitId},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${ClientId},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv4PolicyIPRange {
    <#
    .SYNOPSIS
        Add-DhcpServerv4PolicyIPRange [-Name] <string> [-ScopeId] <ipaddress> [-StartRange] <ipaddress> [-EndRange] <ipaddress> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4PolicyIPRange')]
    param (
        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${StartRange},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=4, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${EndRange},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv4Reservation {
    <#
    .SYNOPSIS
        Add-DhcpServerv4Reservation [-ScopeId] <ipaddress> [-IPAddress] <ipaddress> [-ClientId] <string> [-ComputerName <string>] [-Name <string>] [-Description <string>] [-Type <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Reservation')]
    param (
        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn','ReservationServer')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservationScopeID')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservedIP')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${IPAddress},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ClientId},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [Alias('HostName','ReservationName')]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservationDescription')]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservationType')]
        [ValidateSet('Dhcp','Bootp','Both')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Type},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv4Scope {
    <#
    .SYNOPSIS
        Add-DhcpServerv4Scope [-StartRange] <ipaddress> [-EndRange] <ipaddress> [-SubnetMask] <ipaddress> [-Name] <string> [-ComputerName <string>] [-Description <string>] [-State <string>] [-SuperscopeName <string>] [-MaxBootpClients <uint32>] [-ActivatePolicies <bool>] [-PassThru] [-NapEnable] [-NapProfile <string>] [-Delay <uint16>] [-LeaseDuration <timespan>] [-Type <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Scope')]
    param (
        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${StartRange},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${EndRange},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=4, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Active','InActive')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${State},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${SuperscopeName},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${MaxBootpClients},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.Nullable[bool]]
        ${ActivatePolicies},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${NapEnable},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${NapProfile},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint16]
        ${Delay},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${LeaseDuration},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${SubnetMask},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Dhcp','Bootp','Both')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Type},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv4Superscope {
    <#
    .SYNOPSIS
        Add-DhcpServerv4Superscope [-SuperscopeName] <string> [-ScopeId] <ipaddress[]> [-Force] [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Superscope')]
    param (
        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${SuperscopeName},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${ScopeId},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Force},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv6Class {
    <#
    .SYNOPSIS
        Add-DhcpServerv6Class [-Name] <string> [-Type] <string> [-Data] <string> [-ComputerName <string>] [-Description <string>] [-VendorId <uint32>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Class')]
    param (
        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${VendorId},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Data},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Vendor','User')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Type},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv6ExclusionRange {
    <#
    .SYNOPSIS
        Add-DhcpServerv6ExclusionRange [-Prefix] <ipaddress> [-StartRange] <ipaddress> [-EndRange] <ipaddress> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6ExclusionRange')]
    param (
        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${StartRange},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${EndRange},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${Prefix},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv6Lease {
    <#
    .SYNOPSIS
        Add-DhcpServerv6Lease [-IPAddress] <ipaddress> [-ClientDuid] <string> [-Iaid] <uint32> [-ComputerName <string>] [-HostName <string>] [-Description <string>] [-LeaseExpiryTime <datetime>] [-AddressType <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Lease')]
    param (
        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${IPAddress},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ClientDuid},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${Iaid},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [System.String]
        ${HostName},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.Nullable[datetime]]
        ${LeaseExpiryTime},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('IANA','IATA')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${AddressType},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv6OptionDefinition {
    <#
    .SYNOPSIS
        Add-DhcpServerv6OptionDefinition [-Name] <string> [-OptionId] <uint32> [-Type] <string> [-ComputerName <string>] [-MultiValued] [-Description <string>] [-VendorClass <string>] [-DefaultValue <string[]>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6OptionDefinition')]
    param (
        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${OptionId},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Byte','Word','DWord','DWordDWord','IPv4Address','String','BinaryData','EncapsulatedData','IPv6Address')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Type},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${MultiValued},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${VendorClass},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [string[]]
        ${DefaultValue},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv6Reservation {
    <#
    .SYNOPSIS
        Add-DhcpServerv6Reservation [-Prefix] <ipaddress> [-IPAddress] <ipaddress> [-ClientDuid] <string> [-Iaid] <uint32> [[-Name] <string>] [-ComputerName <string>] [-Description <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Reservation')]
    param (
        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn','ReservationServer')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservedIP')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${IPAddress},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
        [Alias('Duid')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ClientDuid},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=4, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${Iaid},

        [Parameter(ParameterSetName='Add0', Position=5, ValueFromPipelineByPropertyName=$true)]
        [Alias('HostName','ReservationName')]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservationDescription')]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservationScopeID')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${Prefix},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-DhcpServerv6Scope {
    <#
    .SYNOPSIS
        Add-DhcpServerv6Scope [-Prefix] <ipaddress> [-Name] <string> [-ValidLifeTime <timespan>] [-ComputerName <string>] [-Description <string>] [-State <string>] [-Preference <uint16>] [-PreferredLifetime <timespan>] [-T1 <timespan>] [-T2 <timespan>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Scope')]
    param (
        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${ValidLifeTime},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${Prefix},

        [Parameter(ParameterSetName='Add0', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Active','Inactive')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${State},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint16]
        ${Preference},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${PreferredLifetime},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${T1},

        [Parameter(ParameterSetName='Add0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${T2},

        [Parameter(ParameterSetName='Add0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Add0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Add0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Add0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Backup-DhcpServer {
    <#
    .SYNOPSIS
        Backup-DhcpServer [-Path] <string> [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    param (
        [Parameter(ParameterSetName='Backup0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Backup0', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Path},

        [Parameter(ParameterSetName='Backup0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Backup0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Backup0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Export-DhcpServer {
    <#
    .SYNOPSIS
        Export-DhcpServer [-File] <string> [-ScopeId <ipaddress[]>] [-Prefix <ipaddress[]>] [-Leases] [-Force] [-ComputerName <string>] [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [System.String]
        ${File},

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [ipaddress[]]
        ${ScopeId},

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [ipaddress[]]
        ${Prefix},

        [switch]
        ${Leases},

        [switch]
        ${Force},

        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession]
        ${CimSession}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerAuditLog {
    <#
    .SYNOPSIS
        Get-DhcpServerAuditLog [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerAuditLog')]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerDatabase {
    <#
    .SYNOPSIS
        Get-DhcpServerDatabase [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerDatabase')]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerDnsCredential {
    <#
    .SYNOPSIS
        Get-DhcpServerDnsCredential [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerDnsCredential')]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerInDC {
    <#
    .SYNOPSIS
        Get-DhcpServerInDC [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerInDC')]
    param (
        [Parameter(ParameterSetName='Get1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerSetting {
    <#
    .SYNOPSIS
        Get-DhcpServerSetting [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerSetting')]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4Binding {
    <#
    .SYNOPSIS
        Get-DhcpServerv4Binding [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Binding')]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4Class {
    <#
    .SYNOPSIS
        Get-DhcpServerv4Class [[-Name] <string[]>] [[-Type] <string>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Class')]
    param (
        [Parameter(ParameterSetName='Get1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Get1', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Vendor','User')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Type},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4DnsSetting {
    <#
    .SYNOPSIS
        Get-DhcpServerv4DnsSetting [[-ScopeId] <ipaddress>] [[-IPAddress] <ipaddress>] [-ComputerName <string>] [-PolicyName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4DnsSetting')]
    param (
        [Parameter(ParameterSetName='Get0', Position=2, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservedIP')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${IPAddress},

        [Parameter(ParameterSetName='Get0', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${PolicyName},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4ExclusionRange {
    <#
    .SYNOPSIS
        Get-DhcpServerv4ExclusionRange [[-ScopeId] <ipaddress[]>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4ExclusionRange')]
    param (
        [Parameter(ParameterSetName='Get1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${ScopeId},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4Failover {
    <#
    .SYNOPSIS
        Get-DhcpServerv4Failover [[-Name] <string[]>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]

Get-DhcpServerv4Failover -ScopeId <ipaddress[]> [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Name', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Failover')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Failover')]
    param (
        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='Name')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Name', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='ScopeId', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${ScopeId},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='Name')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='Name')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='Name')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4Filter {
    <#
    .SYNOPSIS
        Get-DhcpServerv4Filter [[-List] <string>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Filter')]
    param (
        [Parameter(ParameterSetName='Get1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Allow','Deny')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${List},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4FilterList {
    <#
    .SYNOPSIS
        Get-DhcpServerv4FilterList [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4FilterList')]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4FreeIPAddress {
    <#
    .SYNOPSIS
        Get-DhcpServerv4FreeIPAddress [-ScopeId] <ipaddress> [[-NumAddress] <uint32>] [-ComputerName <string>] [-StartAddress <ipaddress>] [-EndAddress <ipaddress>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([System.String[]])]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='Get0', Position=2)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${NumAddress},

        [Parameter(ParameterSetName='Get0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${StartAddress},

        [Parameter(ParameterSetName='Get0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${EndAddress},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4Lease {
    <#
    .SYNOPSIS
        Get-DhcpServerv4Lease [-ScopeId] <ipaddress> [-ComputerName <string>] [-AllLeases] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]

Get-DhcpServerv4Lease -IPAddress <ipaddress[]> [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]

Get-DhcpServerv4Lease [-ScopeId] <ipaddress> [-ClientId] <string[]> [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]

Get-DhcpServerv4Lease [[-ScopeId] <ipaddress>] -BadLeases [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='ScopeId', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Lease')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Lease')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Lease')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Lease')]
    param (
        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [Parameter(ParameterSetName='BadLeases')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='BadLeases', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${BadLeases},

        [Parameter(ParameterSetName='ScopeId', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='ClientId', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='BadLeases', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='ClientId', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${ClientId},

        [Parameter(ParameterSetName='IPAddress', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${IPAddress},

        [Parameter(ParameterSetName='ScopeId')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${AllLeases},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [Parameter(ParameterSetName='BadLeases')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [Parameter(ParameterSetName='BadLeases')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [Parameter(ParameterSetName='BadLeases')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4MulticastExclusionRange {
    <#
    .SYNOPSIS
        Get-DhcpServerv4MulticastExclusionRange [[-Name] <string[]>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4MulticastExclusionRange')]
    param (
        [Parameter(ParameterSetName='Get1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4MulticastLease {
    <#
    .SYNOPSIS
        Get-DhcpServerv4MulticastLease [-Name] <string[]> [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4MulticastLease')]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4MulticastScope {
    <#
    .SYNOPSIS
        Get-DhcpServerv4MulticastScope [[-Name] <string[]>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4MulticastScope')]
    param (
        [Parameter(ParameterSetName='Get1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4MulticastScopeStatistics {
    <#
    .SYNOPSIS
        Get-DhcpServerv4MulticastScopeStatistics [[-Name] <string[]>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4MulticastScopeStatistics')]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4OptionDefinition {
    <#
    .SYNOPSIS
        Get-DhcpServerv4OptionDefinition [[-OptionId] <uint32[]>] [[-VendorClass] <string>] [-ComputerName <string>] [-All] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4OptionDefinition')]
    param (
        [Parameter(ParameterSetName='Get1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32[]]
        ${OptionId},

        [Parameter(ParameterSetName='Get1', Position=2, ValueFromPipelineByPropertyName=$true)]
        [Alias('Name')]
        [System.String]
        ${VendorClass},

        [Parameter(ParameterSetName='Get1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${All},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4OptionValue {
    <#
    .SYNOPSIS
        Get-DhcpServerv4OptionValue [[-OptionId] <uint32[]>] [[-ScopeId] <ipaddress>] [-VendorClass <string>] [-ComputerName <string>] [-ReservedIP <ipaddress>] [-UserClass <string>] [-All] [-Brief] [-PolicyName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4OptionValue')]
    param (
        [Parameter(ParameterSetName='Get0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${VendorClass},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='Get0', ValueFromPipelineByPropertyName=$true)]
        [Alias('IPAddress')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ReservedIP},

        [Parameter(ParameterSetName='Get0', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32[]]
        ${OptionId},

        [Parameter(ParameterSetName='Get0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${UserClass},

        [Parameter(ParameterSetName='Get0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${All},

        [Parameter(ParameterSetName='Get0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Brief},

        [Parameter(ParameterSetName='Get0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${PolicyName},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4Policy {
    <#
    .SYNOPSIS
        Get-DhcpServerv4Policy [[-Name] <string[]>] [[-ScopeId] <ipaddress>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Policy')]
    param (
        [Parameter(ParameterSetName='Get1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Get1', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4PolicyIPRange {
    <#
    .SYNOPSIS
        Get-DhcpServerv4PolicyIPRange [-ScopeId] <ipaddress> [[-Name] <string[]>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4PolicyIPRange')]
    param (
        [Parameter(ParameterSetName='Get1', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Get1', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4Reservation {
    <#
    .SYNOPSIS
        Get-DhcpServerv4Reservation [-ScopeId] <ipaddress> [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]

Get-DhcpServerv4Reservation -IPAddress <ipaddress[]> [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]

Get-DhcpServerv4Reservation [-ScopeId] <ipaddress> [-ClientId] <string[]> [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='ScopeId', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Reservation')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Reservation')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Reservation')]
    param (
        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [Alias('Cn','ReservationServer')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='ClientId', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${ClientId},

        [Parameter(ParameterSetName='ScopeId', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='ClientId', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservationScopeID')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='IPAddress', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservedIP')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${IPAddress},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4Scope {
    <#
    .SYNOPSIS
        Get-DhcpServerv4Scope [[-ScopeId] <ipaddress[]>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Scope')]
    param (
        [Parameter(ParameterSetName='Get1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${ScopeId},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4ScopeStatistics {
    <#
    .SYNOPSIS
        Get-DhcpServerv4ScopeStatistics [[-ScopeId] <ipaddress[]>] [-ComputerName <string>] [-Failover] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4ScopeStatistics')]
    param (
        [Parameter(ParameterSetName='Get0', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${ScopeId},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Failover},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4Statistics {
    <#
    .SYNOPSIS
        Get-DhcpServerv4Statistics [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Statistics')]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4Superscope {
    <#
    .SYNOPSIS
        Get-DhcpServerv4Superscope [[-SuperscopeName] <string[]>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Superscope')]
    param (
        [Parameter(ParameterSetName='Get1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${SuperscopeName},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv4SuperscopeStatistics {
    <#
    .SYNOPSIS
        Get-DhcpServerv4SuperscopeStatistics [[-Name] <string[]>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4SuperscopeStatistics')]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv6Binding {
    <#
    .SYNOPSIS
        Get-DhcpServerv6Binding [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Binding')]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv6Class {
    <#
    .SYNOPSIS
        Get-DhcpServerv6Class [[-Name] <string[]>] [[-Type] <string>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Class')]
    param (
        [Parameter(ParameterSetName='Get1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Get1', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Vendor','User')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Type},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv6DnsSetting {
    <#
    .SYNOPSIS
        Get-DhcpServerv6DnsSetting [[-Prefix] <ipaddress>] [[-IPAddress] <ipaddress>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6DnsSetting')]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${Prefix},

        [Parameter(ParameterSetName='Get0', Position=2, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservedIP')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${IPAddress},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv6ExclusionRange {
    <#
    .SYNOPSIS
        Get-DhcpServerv6ExclusionRange [[-Prefix] <ipaddress[]>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6ExclusionRange')]
    param (
        [Parameter(ParameterSetName='Get1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${Prefix},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv6FreeIPAddress {
    <#
    .SYNOPSIS
        Get-DhcpServerv6FreeIPAddress [-Prefix] <ipaddress> [[-NumAddress] <uint32>] [-ComputerName <string>] [-StartAddress <ipaddress>] [-EndAddress <ipaddress>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([System.String[]])]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${Prefix},

        [Parameter(ParameterSetName='Get0', Position=2)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${NumAddress},

        [Parameter(ParameterSetName='Get0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${StartAddress},

        [Parameter(ParameterSetName='Get0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${EndAddress},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv6Lease {
    <#
    .SYNOPSIS
        Get-DhcpServerv6Lease [-Prefix] <ipaddress> [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]

Get-DhcpServerv6Lease -IPAddress <ipaddress[]> [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Prefix', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Lease')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Lease')]
    param (
        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='IPAddress', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${IPAddress},

        [Parameter(ParameterSetName='Prefix', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${Prefix},

        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv6OptionDefinition {
    <#
    .SYNOPSIS
        Get-DhcpServerv6OptionDefinition [[-OptionId] <uint32[]>] [[-VendorClass] <string>] [-ComputerName <string>] [-All] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6OptionDefinition')]
    param (
        [Parameter(ParameterSetName='Get1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32[]]
        ${OptionId},

        [Parameter(ParameterSetName='Get1', Position=2, ValueFromPipelineByPropertyName=$true)]
        [Alias('Name')]
        [System.String]
        ${VendorClass},

        [Parameter(ParameterSetName='Get1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${All},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv6OptionValue {
    <#
    .SYNOPSIS
        Get-DhcpServerv6OptionValue [[-OptionId] <uint32[]>] [[-Prefix] <ipaddress>] [-ComputerName <string>] [-VendorClass <string>] [-ReservedIP <ipaddress>] [-UserClass <string>] [-All] [-Brief] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6OptionValue')]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${VendorClass},

        [Parameter(ParameterSetName='Get0', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${Prefix},

        [Parameter(ParameterSetName='Get0', ValueFromPipelineByPropertyName=$true)]
        [Alias('IPAddress')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ReservedIP},

        [Parameter(ParameterSetName='Get0', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${UserClass},

        [Parameter(ParameterSetName='Get0', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32[]]
        ${OptionId},

        [Parameter(ParameterSetName='Get0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${All},

        [Parameter(ParameterSetName='Get0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Brief},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv6Reservation {
    <#
    .SYNOPSIS
        Get-DhcpServerv6Reservation [-Prefix] <ipaddress> [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]

Get-DhcpServerv6Reservation -IPAddress <ipaddress[]> [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Prefix', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Reservation')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Reservation')]
    param (
        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [Alias('Cn','ReservationServer')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='IPAddress', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservedIP')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${IPAddress},

        [Parameter(ParameterSetName='Prefix', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservationScopeID')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${Prefix},

        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv6Scope {
    <#
    .SYNOPSIS
        Get-DhcpServerv6Scope [[-Prefix] <ipaddress[]>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Scope')]
    param (
        [Parameter(ParameterSetName='Get1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${Prefix},

        [Parameter(ParameterSetName='Get1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv6ScopeStatistics {
    <#
    .SYNOPSIS
        Get-DhcpServerv6ScopeStatistics [[-Prefix] <ipaddress[]>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6ScopeStatistics')]
    param (
        [Parameter(ParameterSetName='Get0', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${Prefix},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv6StatelessStatistics {
    <#
    .SYNOPSIS
        Get-DhcpServerv6StatelessStatistics [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6StatelessStatistics')]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv6StatelessStore {
    <#
    .SYNOPSIS
        Get-DhcpServerv6StatelessStore [[-Prefix] <ipaddress[]>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6StatelessStore')]
    param (
        [Parameter(ParameterSetName='Get0', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${Prefix},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerv6Statistics {
    <#
    .SYNOPSIS
        Get-DhcpServerv6Statistics [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Statistics')]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-DhcpServerVersion {
    <#
    .SYNOPSIS
        Get-DhcpServerVersion [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerVersion')]
    param (
        [Parameter(ParameterSetName='Get0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Get0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Get0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Get0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Import-DhcpServer {
    <#
    .SYNOPSIS
        Import-DhcpServer [-File] <string> [-BackupPath] <string> [-ScopeId <ipaddress[]>] [-Prefix <ipaddress[]>] [-ScopeOverwrite] [-Leases] [-ServerConfigOnly] [-Force] [-ComputerName <string>] [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [System.String]
        ${File},

        [Parameter(Mandatory=$true, Position=1)]
        [System.String]
        ${BackupPath},

        [ipaddress[]]
        ${ScopeId},

        [ipaddress[]]
        ${Prefix},

        [switch]
        ${ScopeOverwrite},

        [switch]
        ${Leases},

        [switch]
        ${ServerConfigOnly},

        [switch]
        ${Force},

        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession]
        ${CimSession}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Invoke-DhcpServerv4FailoverReplication {
    <#
    .SYNOPSIS
        Invoke-DhcpServerv4FailoverReplication [[-Name] <string[]>] [-ComputerName <string>] [-Force] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Invoke-DhcpServerv4FailoverReplication -ScopeId <ipaddress[]> [-ComputerName <string>] [-Force] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([System.String[]])]
    [OutputType([System.String[]])]
    param (
        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='Name')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Force},

        [Parameter(ParameterSetName='Name', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='ScopeId', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${ScopeId},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='Name')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='Name')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='Name')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerDnsCredential {
    <#
    .SYNOPSIS
        Remove-DhcpServerDnsCredential [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerDnsCredential')]
    param (
        [Parameter(ParameterSetName='Remove1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Remove1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerInDC {
    <#
    .SYNOPSIS
        Remove-DhcpServerInDC [[-DnsName] <string>] [[-IPAddress] <ipaddress>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerInDC')]
    param (
        [Parameter(ParameterSetName='Remove2', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${DnsName},

        [Parameter(ParameterSetName='Remove2', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${IPAddress},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv4Class {
    <#
    .SYNOPSIS
        Remove-DhcpServerv4Class [-Name] <string[]> [-Type] <string> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Class')]
    param (
        [Parameter(ParameterSetName='Remove2')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove2', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Remove2', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Vendor','User')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Type},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv4ExclusionRange {
    <#
    .SYNOPSIS
        Remove-DhcpServerv4ExclusionRange [-ScopeId] <ipaddress> [[-StartRange] <ipaddress>] [[-EndRange] <ipaddress>] [-ComputerName <string>] [-Passthru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4ExclusionRange')]
    param (
        [Parameter(ParameterSetName='Remove2')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove2', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='Remove2', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${StartRange},

        [Parameter(ParameterSetName='Remove2', Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${EndRange},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv4Failover {
    <#
    .SYNOPSIS
        Remove-DhcpServerv4Failover [-Name] <string[]> [-Force] [-PassThru] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Failover')]
    param (
        [Parameter(ParameterSetName='Remove0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Remove0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Force},

        [Parameter(ParameterSetName='Remove0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Remove0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv4FailoverScope {
    <#
    .SYNOPSIS
        Remove-DhcpServerv4FailoverScope [-Name] <string> [-ScopeId] <ipaddress[]> [-ComputerName <string>] [-Force] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Failover')]
    param (
        [Parameter(ParameterSetName='Remove1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove1', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Remove1', Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${ScopeId},

        [Parameter(ParameterSetName='Remove1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Force},

        [Parameter(ParameterSetName='Remove1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Remove1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv4Filter {
    <#
    .SYNOPSIS
        Remove-DhcpServerv4Filter [-MacAddress] <string[]> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Filter')]
    param (
        [Parameter(ParameterSetName='Remove2')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Remove2', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Alias('ClientId')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${MacAddress},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv4Lease {
    <#
    .SYNOPSIS
        Remove-DhcpServerv4Lease -IPAddress <ipaddress[]> [-PassThru] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-DhcpServerv4Lease [-ScopeId] <ipaddress> [-PassThru] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-DhcpServerv4Lease [-ScopeId] <ipaddress> [-ClientId] <string[]> [-PassThru] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-DhcpServerv4Lease [[-ScopeId] <ipaddress>] -BadLeases [-PassThru] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='IPAddress', SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Lease')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Lease')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Lease')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Lease')]
    param (
        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [Parameter(ParameterSetName='BadLeases')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [Parameter(ParameterSetName='BadLeases')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='BadLeases', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${BadLeases},

        [Parameter(ParameterSetName='ScopeId', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='ClientId', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='BadLeases', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='ClientId', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${ClientId},

        [Parameter(ParameterSetName='IPAddress', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${IPAddress},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [Parameter(ParameterSetName='BadLeases')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [Parameter(ParameterSetName='BadLeases')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [Parameter(ParameterSetName='BadLeases')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv4MulticastExclusionRange {
    <#
    .SYNOPSIS
        Remove-DhcpServerv4MulticastExclusionRange [-Name] <string> [[-StartRange] <ipaddress>] [[-EndRange] <ipaddress>] [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4MulticastExclusionRange')]
    param (
        [Parameter(ParameterSetName='Remove2')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove2', Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${EndRange},

        [Parameter(ParameterSetName='Remove2', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Remove2', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${StartRange},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv4MulticastLease {
    <#
    .SYNOPSIS
        Remove-DhcpServerv4MulticastLease [-Name] <string> [[-IPAddress] <ipaddress[]>] [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4MulticastLease')]
    param (
        [Parameter(ParameterSetName='Remove1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Remove1', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Remove1', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${IPAddress},

        [Parameter(ParameterSetName='Remove1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv4MulticastScope {
    <#
    .SYNOPSIS
        Remove-DhcpServerv4MulticastScope -Name <string[]> [-ComputerName <string>] [-Force] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4MulticastScope')]
    param (
        [Parameter(ParameterSetName='Remove2')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove2', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Force},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv4OptionDefinition {
    <#
    .SYNOPSIS
        Remove-DhcpServerv4OptionDefinition [-OptionId] <uint32[]> [[-VendorClass] <string>] [-ComputerName <string>] [-Passthru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4OptionDefinition')]
    param (
        [Parameter(ParameterSetName='Remove2')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove2', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32[]]
        ${OptionId},

        [Parameter(ParameterSetName='Remove2', Position=2, ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${VendorClass},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv4OptionValue {
    <#
    .SYNOPSIS
        Remove-DhcpServerv4OptionValue [-OptionId] <uint32[]> [[-ScopeId] <ipaddress>] [-VendorClass <string>] [-ComputerName <string>] [-UserClass <string>] [-ReservedIP <ipaddress>] [-PassThru] [-PolicyName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4OptionValue')]
    param (
        [Parameter(ParameterSetName='Remove1', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${VendorClass},

        [Parameter(ParameterSetName='Remove1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove1', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32[]]
        ${OptionId},

        [Parameter(ParameterSetName='Remove1', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${UserClass},

        [Parameter(ParameterSetName='Remove1', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='Remove1', ValueFromPipelineByPropertyName=$true)]
        [Alias('IPAddress')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ReservedIP},

        [Parameter(ParameterSetName='Remove1')]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Remove1', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${PolicyName},

        [Parameter(ParameterSetName='Remove1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv4Policy {
    <#
    .SYNOPSIS
        Remove-DhcpServerv4Policy [-Name] <string[]> [[-ScopeId] <ipaddress>] [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Policy')]
    param (
        [Parameter(ParameterSetName='Remove2')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Remove2', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Remove2', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv4PolicyIPRange {
    <#
    .SYNOPSIS
        Remove-DhcpServerv4PolicyIPRange [-Name] <string> [-ScopeId] <ipaddress> [[-StartRange] <ipaddress>] [[-EndRange] <ipaddress>] [-PassThru] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4PolicyIPRange')]
    param (
        [Parameter(ParameterSetName='Remove2', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Remove2', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='Remove2', Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${StartRange},

        [Parameter(ParameterSetName='Remove2', Position=4, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${EndRange},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv4Reservation {
    <#
    .SYNOPSIS
        Remove-DhcpServerv4Reservation -IPAddress <ipaddress[]> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-DhcpServerv4Reservation [-ScopeId] <ipaddress> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-DhcpServerv4Reservation [-ScopeId] <ipaddress> [-ClientId] <string[]> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='IPAddress', SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Reservation')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Reservation')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Reservation')]
    param (
        [Parameter(ParameterSetName='ScopeId', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='ClientId', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservationScopeID')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='ClientId', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${ClientId},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [Alias('Cn','ReservationServer')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='IPAddress', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservedIP')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${IPAddress},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='ScopeId')]
        [Parameter(ParameterSetName='IPAddress')]
        [Parameter(ParameterSetName='ClientId')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv4Scope {
    <#
    .SYNOPSIS
        Remove-DhcpServerv4Scope [-ScopeId] <ipaddress[]> [-Force] [-Passthru] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Scope')]
    param (
        [Parameter(ParameterSetName='Remove2', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${ScopeId},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Force},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv4Superscope {
    <#
    .SYNOPSIS
        Remove-DhcpServerv4Superscope [-SuperscopeName] <string> [[-ScopeId] <string[]>] [-ComputerName <string>] [-Passthru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Superscope')]
    param (
        [Parameter(ParameterSetName='Remove2')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove2', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${SuperscopeName},

        [Parameter(ParameterSetName='Remove2', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${ScopeId},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv6Class {
    <#
    .SYNOPSIS
        Remove-DhcpServerv6Class [-Name] <string[]> [-Type] <string> [-PassThru] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Class')]
    param (
        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Remove2', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Vendor','User')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Type},

        [Parameter(ParameterSetName='Remove2', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv6ExclusionRange {
    <#
    .SYNOPSIS
        Remove-DhcpServerv6ExclusionRange [-Prefix] <ipaddress> [[-StartRange] <ipaddress>] [[-EndRange] <ipaddress>] [-ComputerName <string>] [-Passthru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6ExclusionRange')]
    param (
        [Parameter(ParameterSetName='Remove2')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove2', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${Prefix},

        [Parameter(ParameterSetName='Remove2', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${StartRange},

        [Parameter(ParameterSetName='Remove2', Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${EndRange},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv6Lease {
    <#
    .SYNOPSIS
        Remove-DhcpServerv6Lease -IPAddress <ipaddress[]> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-DhcpServerv6Lease [-Prefix] <ipaddress> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='IPAddress', SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Lease')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Lease')]
    param (
        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='IPAddress', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${IPAddress},

        [Parameter(ParameterSetName='Prefix', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${Prefix},

        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv6OptionDefinition {
    <#
    .SYNOPSIS
        Remove-DhcpServerv6OptionDefinition [-OptionId] <uint32[]> [[-VendorClass] <string>] [-ComputerName <string>] [-Passthru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6OptionDefinition')]
    param (
        [Parameter(ParameterSetName='Remove2')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove2', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32[]]
        ${OptionId},

        [Parameter(ParameterSetName='Remove2', Position=2, ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${VendorClass},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv6OptionValue {
    <#
    .SYNOPSIS
        Remove-DhcpServerv6OptionValue [-OptionId] <uint32[]> [[-Prefix] <ipaddress>] [-ComputerName <string>] [-ReservedIP <ipaddress>] [-PassThru] [-VendorClass <string>] [-UserClass <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6OptionValue')]
    param (
        [Parameter(ParameterSetName='Remove1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove1', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${Prefix},

        [Parameter(ParameterSetName='Remove1', ValueFromPipelineByPropertyName=$true)]
        [Alias('IPAddress')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ReservedIP},

        [Parameter(ParameterSetName='Remove1', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32[]]
        ${OptionId},

        [Parameter(ParameterSetName='Remove1')]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Remove1', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${VendorClass},

        [Parameter(ParameterSetName='Remove1', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${UserClass},

        [Parameter(ParameterSetName='Remove1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv6Reservation {
    <#
    .SYNOPSIS
        Remove-DhcpServerv6Reservation -IPAddress <ipaddress[]> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-DhcpServerv6Reservation [-Prefix] <ipaddress> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='IPAddress', SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Reservation')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Reservation')]
    param (
        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [Alias('Cn','ReservationServer')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='IPAddress', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservedIP')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${IPAddress},

        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Prefix', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservationScopeID')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${Prefix},

        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Prefix')]
        [Parameter(ParameterSetName='IPAddress')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-DhcpServerv6Scope {
    <#
    .SYNOPSIS
        Remove-DhcpServerv6Scope [-Prefix] <ipaddress[]> [-Force] [-Passthru] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Scope')]
    param (
        [Parameter(ParameterSetName='Remove2', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${Prefix},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Force},

        [Parameter(ParameterSetName='Remove2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Remove2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Remove2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Remove2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Rename-DhcpServerv4Superscope {
    <#
    .SYNOPSIS
        Rename-DhcpServerv4Superscope [-Name] <string> [-NewName] <string> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Superscope')]
    param (
        [Parameter(ParameterSetName='Rename3')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Rename3', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Rename3', Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${NewName},

        [Parameter(ParameterSetName='Rename3')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Rename3')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Rename3')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Rename3')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Repair-DhcpServerv4IPRecord {
    <#
    .SYNOPSIS
        Repair-DhcpServerv4IPRecord [-ScopeId] <ipaddress[]> [-ComputerName <string>] [-ReportOnly] [-Force] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4IPRecords')]
    param (
        [Parameter(ParameterSetName='Repair0')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Repair0', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress[]]
        ${ScopeId},

        [Parameter(ParameterSetName='Repair0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${ReportOnly},

        [Parameter(ParameterSetName='Repair0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Force},

        [Parameter(ParameterSetName='Repair0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Repair0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Repair0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Restore-DhcpServer {
    <#
    .SYNOPSIS
        Restore-DhcpServer [-Path] <string> [-ComputerName <string>] [-Force] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    param (
        [Parameter(ParameterSetName='Restore1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Restore1', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Path},

        [Parameter(ParameterSetName='Restore1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Force},

        [Parameter(ParameterSetName='Restore1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Restore1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Restore1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerAuditLog {
    <#
    .SYNOPSIS
        Set-DhcpServerAuditLog [[-Enable] <bool>] [[-Path] <string>] [-MaxMBFileSize <uint32>] [-DiskCheckInterval <uint32>] [-MinMBDiskSpace <uint32>] [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerAuditLog')]
    param (
        [Parameter(ParameterSetName='Set1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${Enable},

        [Parameter(ParameterSetName='Set1', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Path},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${MaxMBFileSize},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${DiskCheckInterval},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${MinMBDiskSpace},

        [Parameter(ParameterSetName='Set1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerDatabase {
    <#
    .SYNOPSIS
        Set-DhcpServerDatabase [[-FileName] <string>] [[-BackupPath] <string>] [-BackupInterval <uint32>] [-CleanupInterval <uint32>] [-RestoreFromBackup <bool>] [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerDatabase')]
    param (
        [Parameter(ParameterSetName='Set1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${FileName},

        [Parameter(ParameterSetName='Set1', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${BackupPath},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${BackupInterval},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${CleanupInterval},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${RestoreFromBackup},

        [Parameter(ParameterSetName='Set1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerDnsCredential {
    <#
    .SYNOPSIS
        Set-DhcpServerDnsCredential [-Credential] <pscredential> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerDnsCredential')]
    param (
        [Parameter(ParameterSetName='Set2')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set2', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [pscredential]
        [System.Management.Automation.CredentialAttribute()]
        ${Credential},

        [Parameter(ParameterSetName='Set2')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerSetting {
    <#
    .SYNOPSIS
        Set-DhcpServerSetting [-ConflictDetectionAttempts <uint32>] [-NpsUnreachableAction <string>] [-NapEnabled <bool>] [-ComputerName <string>] [-ActivatePolicies <bool>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerSetting')]
    param (
        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${ConflictDetectionAttempts},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Full','Restricted','NoAccess')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${NpsUnreachableAction},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${NapEnabled},

        [Parameter(ParameterSetName='Set1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [System.Nullable[bool]]
        ${ActivatePolicies},

        [Parameter(ParameterSetName='Set1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv4Binding {
    <#
    .SYNOPSIS
        Set-DhcpServerv4Binding [-InterfaceAlias] <string[]> [-BindingState] <bool> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Binding')]
    param (
        [Parameter(ParameterSetName='Set1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set1', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${InterfaceAlias},

        [Parameter(ParameterSetName='Set1', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${BindingState},

        [Parameter(ParameterSetName='Set1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv4Class {
    <#
    .SYNOPSIS
        Set-DhcpServerv4Class [-Name] <string> [-Type] <string> [[-Data] <string>] [-Description <string>] [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Class')]
    param (
        [Parameter(ParameterSetName='Set3', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Set3', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Vendor','User')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Type},

        [Parameter(ParameterSetName='Set3', Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Data},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Set3')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set3')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set3')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set3')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set3')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv4DnsSetting {
    <#
    .SYNOPSIS
        Set-DhcpServerv4DnsSetting [[-ScopeId] <ipaddress>] [[-IPAddress] <ipaddress>] [-ComputerName <string>] [-NameProtection <bool>] [-UpdateDnsRRForOlderClients <bool>] [-DeleteDnsRROnLeaseExpiry <bool>] [-DynamicUpdates <string>] [-PassThru] [-PolicyName <string>] [-DisableDnsPtrRRUpdate <bool>] [-DnsSuffix <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4DnsSetting')]
    param (
        [Parameter(ParameterSetName='Set1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${NameProtection},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${UpdateDnsRRForOlderClients},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${DeleteDnsRROnLeaseExpiry},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Always','Never','OnClientRequest')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${DynamicUpdates},

        [Parameter(ParameterSetName='Set1', Position=2, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservedIP')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${IPAddress},

        [Parameter(ParameterSetName='Set1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='Set1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${PolicyName},

        [Parameter(ParameterSetName='Set1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${DisableDnsPtrRRUpdate},

        [Parameter(ParameterSetName='Set1')]
        [AllowNull()]
        [AllowEmptyString()]
        [System.String]
        ${DnsSuffix},

        [Parameter(ParameterSetName='Set1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv4Failover {
    <#
    .SYNOPSIS
        Set-DhcpServerv4Failover [-Name] <string> [-ComputerName <string>] [-AutoStateTransition <bool>] [-MaxClientLeadTime <timespan>] [-SharedSecret <string>] [-StateSwitchInterval <timespan>] [-PartnerDown] [-Force] [-LoadBalancePercent <uint32>] [-ReservePercent <uint32>] [-PassThru] [-Mode <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Failover')]
    param (
        [Parameter(ParameterSetName='Set1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set1', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${AutoStateTransition},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${MaxClientLeadTime},

        [Parameter(ParameterSetName='Set1')]
        [AllowNull()]
        [AllowEmptyString()]
        [System.String]
        ${SharedSecret},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [System.Nullable[timespan]]
        ${StateSwitchInterval},

        [Parameter(ParameterSetName='Set1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PartnerDown},

        [Parameter(ParameterSetName='Set1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Force},

        [Parameter(ParameterSetName='Set1')]
        [ValidateRange(0, 100)]
        [AllowNull()]
        [uint32]
        ${LoadBalancePercent},

        [Parameter(ParameterSetName='Set1')]
        [ValidateRange(0, 100)]
        [AllowNull()]
        [uint32]
        ${ReservePercent},

        [Parameter(ParameterSetName='Set1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('LoadBalance','HotStandby')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Mode},

        [Parameter(ParameterSetName='Set1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv4FilterList {
    <#
    .SYNOPSIS
        Set-DhcpServerv4FilterList [[-Allow] <bool>] [[-Deny] <bool>] [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4FilterList')]
    param (
        [Parameter(ParameterSetName='Set1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${Allow},

        [Parameter(ParameterSetName='Set1', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${Deny},

        [Parameter(ParameterSetName='Set1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv4MulticastScope {
    <#
    .SYNOPSIS
        Set-DhcpServerv4MulticastScope [-Name] <string> [-ComputerName <string>] [-Description <string>] [-EndRange <ipaddress>] [-LeaseDuration <timespan>] [-PassThru] [-StartRange <ipaddress>] [-State <string>] [-Ttl <uint32>] [-NewName <string>] [-ExpiryTime <datetime>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4MulticastScope')]
    param (
        [Parameter(ParameterSetName='Set3')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${EndRange},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${LeaseDuration},

        [Parameter(ParameterSetName='Set3', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Set3')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${StartRange},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${State},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateRange(1, 255)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${Ttl},

        [Parameter(ParameterSetName='Set3')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${NewName},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [datetime]
        ${ExpiryTime},

        [Parameter(ParameterSetName='Set3')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set3')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set3')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv4OptionDefinition {
    <#
    .SYNOPSIS
        Set-DhcpServerv4OptionDefinition [-OptionId] <uint32> [-ComputerName <string>] [-Name <string>] [-Description <string>] [-VendorClass <string>] [-DefaultValue <string[]>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4OptionDefinition')]
    param (
        [Parameter(ParameterSetName='Set3')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set3', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${OptionId},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${VendorClass},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [string[]]
        ${DefaultValue},

        [Parameter(ParameterSetName='Set3')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set3')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set3')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set3')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv4OptionValue {
    <#
    .SYNOPSIS
        Set-DhcpServerv4OptionValue [-OptionId] <uint32> [-Value] <string[]> [[-ScopeId] <ipaddress>] [-PolicyName <string>] [-PassThru] [-Force] [-ReservedIP <ipaddress>] [-UserClass <string>] [-ComputerName <string>] [-VendorClass <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Set-DhcpServerv4OptionValue [[-ScopeId] <ipaddress>] [-PolicyName <string>] [-PassThru] [-Force] [-DnsDomain <string>] [-DnsServer <ipaddress[]>] [-ReservedIP <ipaddress>] [-Router <ipaddress[]>] [-UserClass <string>] [-WinsServer <ipaddress[]>] [-Wpad <string>] [-ComputerName <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='OptionIds', SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4OptionValue')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4OptionValue')]
    param (
        [Parameter(ParameterSetName='OptionIds', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='CommonOptions', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${PolicyName},

        [Parameter(ParameterSetName='OptionIds')]
        [Parameter(ParameterSetName='CommonOptions')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='OptionIds')]
        [Parameter(ParameterSetName='CommonOptions')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Force},

        [Parameter(ParameterSetName='CommonOptions', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [AllowEmptyString()]
        [System.String]
        ${DnsDomain},

        [Parameter(ParameterSetName='CommonOptions', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [AllowEmptyString()]
        [ipaddress[]]
        ${DnsServer},

        [Parameter(ParameterSetName='OptionIds', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='CommonOptions', ValueFromPipelineByPropertyName=$true)]
        [Alias('IPAddress')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ReservedIP},

        [Parameter(ParameterSetName='CommonOptions', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [AllowEmptyString()]
        [ipaddress[]]
        ${Router},

        [Parameter(ParameterSetName='OptionIds', Position=3, ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='CommonOptions', Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='OptionIds', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='CommonOptions', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${UserClass},

        [Parameter(ParameterSetName='CommonOptions', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [AllowEmptyString()]
        [ipaddress[]]
        ${WinsServer},

        [Parameter(ParameterSetName='CommonOptions', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [AllowEmptyString()]
        [System.String]
        ${Wpad},

        [Parameter(ParameterSetName='OptionIds')]
        [Parameter(ParameterSetName='CommonOptions')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='OptionIds', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${VendorClass},

        [Parameter(ParameterSetName='OptionIds', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [AllowEmptyString()]
        [string[]]
        ${Value},

        [Parameter(ParameterSetName='OptionIds', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${OptionId},

        [Parameter(ParameterSetName='OptionIds')]
        [Parameter(ParameterSetName='CommonOptions')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='OptionIds')]
        [Parameter(ParameterSetName='CommonOptions')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='OptionIds')]
        [Parameter(ParameterSetName='CommonOptions')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv4Policy {
    <#
    .SYNOPSIS
        Set-DhcpServerv4Policy [-Name] <string> [[-ScopeId] <ipaddress>] [-ComputerName <string>] [-Description <string>] [-Enabled <bool>] [-MacAddress <string[]>] [-Fqdn <string[]>] [-UserClass <string[]>] [-SubscriberId <string[]>] [-NewName <string>] [-ClientId <string[]>] [-PassThru] [-LeaseDuration <timespan>] [-ProcessingOrder <uint16>] [-RelayAgent <string[]>] [-RemoteId <string[]>] [-CircuitId <string[]>] [-Condition <string>] [-VendorClass <string[]>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Policy')]
    param (
        [Parameter(ParameterSetName='Set3')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [AllowNull()]
        [AllowEmptyString()]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Set3', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Set3', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${Enabled},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${MacAddress},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${Fqdn},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${UserClass},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${SubscriberId},

        [Parameter(ParameterSetName='Set3')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${NewName},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${ClientId},

        [Parameter(ParameterSetName='Set3')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${LeaseDuration},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint16]
        ${ProcessingOrder},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${RelayAgent},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${RemoteId},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${CircuitId},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('And','Or')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Condition},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [string[]]
        ${VendorClass},

        [Parameter(ParameterSetName='Set3')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set3')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set3')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv4Reservation {
    <#
    .SYNOPSIS
        Set-DhcpServerv4Reservation [-IPAddress] <ipaddress> [-ComputerName <string>] [-ClientId <string>] [-Name <string>] [-Description <string>] [-Type <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Reservation')]
    param (
        [Parameter(ParameterSetName='Set1')]
        [Alias('Cn','ReservationServer')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set1', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservedIP')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${IPAddress},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ClientId},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [Alias('HostName','ReservationName')]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservationDescription')]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservationType')]
        [ValidateSet('Dhcp','Bootp','Both')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Type},

        [Parameter(ParameterSetName='Set1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv4Scope {
    <#
    .SYNOPSIS
        Set-DhcpServerv4Scope [-ScopeId] <ipaddress> [-ActivatePolicies <bool>] [-PassThru] [-Type <string>] [-Description <string>] [-LeaseDuration <timespan>] [-Name <string>] [-NapEnable <bool>] [-NapProfile <string>] [-Delay <uint16>] [-State <string>] [-SuperscopeName <string>] [-ComputerName <string>] [-MaxBootpClients <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Set-DhcpServerv4Scope [-ScopeId] <ipaddress> -StartRange <ipaddress> -EndRange <ipaddress> [-ActivatePolicies <bool>] [-PassThru] [-Type <string>] [-Description <string>] [-LeaseDuration <timespan>] [-Name <string>] [-NapEnable <bool>] [-NapProfile <string>] [-Delay <uint16>] [-State <string>] [-SuperscopeName <string>] [-ComputerName <string>] [-MaxBootpClients <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='WithoutRange', SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Scope')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv4Scope')]
    param (
        [Parameter(ParameterSetName='WithRange', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='WithoutRange', ValueFromPipelineByPropertyName=$true)]
        [System.Nullable[bool]]
        ${ActivatePolicies},

        [Parameter(ParameterSetName='WithRange')]
        [Parameter(ParameterSetName='WithoutRange')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='WithRange', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='WithoutRange', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Dhcp','Bootp','Both')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Type},

        [Parameter(ParameterSetName='WithRange', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='WithoutRange', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ScopeId},

        [Parameter(ParameterSetName='WithRange', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='WithoutRange', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='WithRange', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='WithoutRange', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${LeaseDuration},

        [Parameter(ParameterSetName='WithRange', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='WithoutRange', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='WithRange', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='WithoutRange', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${NapEnable},

        [Parameter(ParameterSetName='WithRange', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='WithoutRange', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${NapProfile},

        [Parameter(ParameterSetName='WithRange', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='WithoutRange', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint16]
        ${Delay},

        [Parameter(ParameterSetName='WithRange', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='WithoutRange', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Active','InActive')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${State},

        [Parameter(ParameterSetName='WithRange', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='WithoutRange', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${SuperscopeName},

        [Parameter(ParameterSetName='WithRange')]
        [Parameter(ParameterSetName='WithoutRange')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='WithRange', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='WithoutRange', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${MaxBootpClients},

        [Parameter(ParameterSetName='WithRange', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${StartRange},

        [Parameter(ParameterSetName='WithRange', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${EndRange},

        [Parameter(ParameterSetName='WithRange')]
        [Parameter(ParameterSetName='WithoutRange')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='WithRange')]
        [Parameter(ParameterSetName='WithoutRange')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='WithRange')]
        [Parameter(ParameterSetName='WithoutRange')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv6Binding {
    <#
    .SYNOPSIS
        Set-DhcpServerv6Binding [-InterfaceAlias] <string[]> [-BindingState] <bool> [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Binding')]
    param (
        [Parameter(ParameterSetName='Set1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set1', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${BindingState},

        [Parameter(ParameterSetName='Set1', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${InterfaceAlias},

        [Parameter(ParameterSetName='Set1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv6Class {
    <#
    .SYNOPSIS
        Set-DhcpServerv6Class [-Name] <string> [-Type] <string> [[-Data] <string>] [-ComputerName <string>] [-Description <string>] [-VendorId <uint32>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Class')]
    param (
        [Parameter(ParameterSetName='Set3')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${VendorId},

        [Parameter(ParameterSetName='Set3', Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Data},

        [Parameter(ParameterSetName='Set3', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Vendor','User')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Type},

        [Parameter(ParameterSetName='Set3', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Set3')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set3')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set3')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set3')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv6DnsSetting {
    <#
    .SYNOPSIS
        Set-DhcpServerv6DnsSetting [[-Prefix] <ipaddress>] [[-IPAddress] <ipaddress>] [-ComputerName <string>] [-NameProtection <bool>] [-DeleteDnsRROnLeaseExpiry <bool>] [-DynamicUpdates <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6DnsSetting')]
    param (
        [Parameter(ParameterSetName='Set1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${NameProtection},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${DeleteDnsRROnLeaseExpiry},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Always','Never','OnClientRequest')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${DynamicUpdates},

        [Parameter(ParameterSetName='Set1', Position=2, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservedIP')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${IPAddress},

        [Parameter(ParameterSetName='Set1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${Prefix},

        [Parameter(ParameterSetName='Set1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv6OptionDefinition {
    <#
    .SYNOPSIS
        Set-DhcpServerv6OptionDefinition [-OptionId] <uint32> [-ComputerName <string>] [-Name <string>] [-Description <string>] [-VendorClass <string>] [-DefaultValue <string[]>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6OptionDefinition')]
    param (
        [Parameter(ParameterSetName='Set3')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set3', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${OptionId},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${VendorClass},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [string[]]
        ${DefaultValue},

        [Parameter(ParameterSetName='Set3')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set3')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set3')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set3')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv6OptionValue {
    <#
    .SYNOPSIS
        Set-DhcpServerv6OptionValue [-OptionId] <uint32> [-Value] <string[]> [[-Prefix] <ipaddress>] [-PassThru] [-Force] [-UserClass <string>] [-ComputerName <string>] [-ReservedIP <ipaddress>] [-VendorClass <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Set-DhcpServerv6OptionValue [[-Prefix] <ipaddress>] [-PassThru] [-Force] [-UserClass <string>] [-DnsServer <ipaddress[]>] [-DomainSearchList <string[]>] [-InfoRefreshTime <uint32>] [-ComputerName <string>] [-ReservedIP <ipaddress>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='OptionIds', SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6OptionValue')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6OptionValue')]
    param (
        [Parameter(ParameterSetName='OptionIds')]
        [Parameter(ParameterSetName='CommonOptions')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='OptionIds')]
        [Parameter(ParameterSetName='CommonOptions')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${Force},

        [Parameter(ParameterSetName='OptionIds', Position=3, ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='CommonOptions', Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${Prefix},

        [Parameter(ParameterSetName='OptionIds', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='CommonOptions', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${UserClass},

        [Parameter(ParameterSetName='CommonOptions', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [AllowEmptyString()]
        [ipaddress[]]
        ${DnsServer},

        [Parameter(ParameterSetName='CommonOptions', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [AllowEmptyString()]
        [string[]]
        ${DomainSearchList},

        [Parameter(ParameterSetName='CommonOptions', ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [AllowEmptyString()]
        [uint32]
        ${InfoRefreshTime},

        [Parameter(ParameterSetName='OptionIds')]
        [Parameter(ParameterSetName='CommonOptions')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='OptionIds', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='CommonOptions', ValueFromPipelineByPropertyName=$true)]
        [Alias('IPAddress')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${ReservedIP},

        [Parameter(ParameterSetName='OptionIds', Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
        [AllowNull()]
        [AllowEmptyString()]
        [string[]]
        ${Value},

        [Parameter(ParameterSetName='OptionIds', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${OptionId},

        [Parameter(ParameterSetName='OptionIds', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${VendorClass},

        [Parameter(ParameterSetName='OptionIds')]
        [Parameter(ParameterSetName='CommonOptions')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='OptionIds')]
        [Parameter(ParameterSetName='CommonOptions')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='OptionIds')]
        [Parameter(ParameterSetName='CommonOptions')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv6Reservation {
    <#
    .SYNOPSIS
        Set-DhcpServerv6Reservation [-IPAddress] <ipaddress> [-ComputerName <string>] [-ClientDuid <string>] [-Iaid <uint32>] [-Name <string>] [-Description <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Reservation')]
    param (
        [Parameter(ParameterSetName='Set1')]
        [Alias('Cn','ReservationServer')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set1', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservedIP')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${IPAddress},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [Alias('Duid')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ClientDuid},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint32]
        ${Iaid},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [Alias('HostName','ReservationName')]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [Alias('ReservationDescription')]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Set1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv6Scope {
    <#
    .SYNOPSIS
        Set-DhcpServerv6Scope [-Prefix] <ipaddress> [-Name <string>] [-Description <string>] [-State <string>] [-Preference <uint16>] [-PreferredLifeTime <timespan>] [-ValidLifeTime <timespan>] [-T1 <timespan>] [-T2 <timespan>] [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6Scope')]
    param (
        [Parameter(ParameterSetName='Set3', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${Prefix},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Active','Inactive')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${State},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [uint16]
        ${Preference},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${PreferredLifeTime},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${ValidLifeTime},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${T1},

        [Parameter(ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${T2},

        [Parameter(ParameterSetName='Set3')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set3')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set3')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set3')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set3')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-DhcpServerv6StatelessStore {
    <#
    .SYNOPSIS
        Set-DhcpServerv6StatelessStore [[-Prefix] <ipaddress>] [[-Enabled] <bool>] [[-PurgeInterval] <timespan>] [-ComputerName <string>] [-PassThru] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#DhcpServerv6StatelessStore')]
    param (
        [Parameter(ParameterSetName='Set1', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [ipaddress]
        ${Prefix},

        [Parameter(ParameterSetName='Set1', Position=2, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [bool]
        ${Enabled},

        [Parameter(ParameterSetName='Set1', Position=3, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [timespan]
        ${PurgeInterval},

        [Parameter(ParameterSetName='Set1')]
        [Alias('Cn')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.String]
        ${ComputerName},

        [Parameter(ParameterSetName='Set1')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='Set1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Set1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Set1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}
