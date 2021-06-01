$Script:ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$Script:Root = "Unknown"

function Read-RootPath {
    if (-not [String]::IsNullOrEmpty($Script:ScriptPath)) {
        $Script:Root = $Script:ScriptPath | Split-Path
    }
}

function Test-Unit {
    Read-RootPath
    Write-Host $Script:ScriptPath
    Write-Host $Script:Root
}

Test-Unit
