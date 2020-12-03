Param(
    [Parameter(Mandatory=$true, Position=1)]
    [string] $Target = "?",    
    [parameter(Mandatory=$false, Position=2)]
    [string] $Version = "1.0.0"
)

. "$PSScriptRoot\init.ps1" $Version

try {
    Invoke-Build $Target $RootFolder\pipeline.tasks.ps1 -Result Result
}
finally {
    # Show task summary information after the build
    $Result.Tasks | Format-Table Elapsed, Name, Error -AutoSize
}