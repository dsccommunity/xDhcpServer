$Properties = @{
    ScopeId       = New-xDscResourceProperty -Name ScopeId -Type String -Attribute Read `
                                             -Description 'ScopeId for which exclusion range properties are set'
    AddressFamily = New-xDscResourceProperty -Name AddressFamily -Type String -Attribute Write `
                                             -ValidateSet 'IPv4' -Description 'Address family type'
    StartRange  = New-xDscResourceProperty -Name StartRange -Type String -Attribute Key `
                                           -Description 'Starting address to set for this exclusion range'
    EndRange    = New-xDscResourceProperty -Name EndRange -Type String -Attribute Key `
                                           -Description 'Ending address to set for this exclusion range'
    Ensure        = New-xDscResourceProperty -Name Ensure -Type String -Attribute Write `
                                             -ValidateSet 'Present','Absent' `
                                             -Description 'Whether exclusion range should be set or removed'
}

New-xDscResource -Name MSFT_xDhcpServerExclusionRange -Property $Properties.Values -ModuleName xDhcpServer -FriendlyName xDhcpServerExclusionRange
