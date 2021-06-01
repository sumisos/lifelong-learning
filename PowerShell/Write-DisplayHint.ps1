#=================================================
# @func Write-DisplayHint
# @param {String} $Content logger content
# @param {String} $Level logger level
# @desc Print logger
#=================================================
function Write-DisplayHint {
    [CmdletBinding()] param (
        [Parameter(Mandatory = $false)] [String]$Content,
        [Parameter(Mandatory = $false)] [String]$Level = "INFO"
    )
    $Current = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    # $Content = $Content.Replace("`n", "`n".PadRight(27, ' '))
    $Level = $Level.ToUpper()
    switch ($Level) {
        # 7.0+ 版本才支持三元运算符
        { "NOTICE|SUCCESS|INFO".Contains($Level) } { $Label = "INFO" }
        { "WARN".Contains($Level) } { $Label = "WARN" }
        { "ERROR".Contains($Level) } { $Label = "ERROR" }
        { "FATAL".Contains($Level) } { $Label = "FATAL" }
        default { $Label = "DEBUG" }
    }
    $Logger = "{0} {1} {2}" -F $Current, "[$($Label)]".PadLeft(7, ' '), $Content
    switch ($Level) {
        { "NOTICE".Contains($Level) } { Write-Host $Logger -ForegroundColor Cyan }
        { "SUCCESS".Contains($Level) } { Write-Host $Logger -ForegroundColor Green }
        { "INFO".Contains($Level) } { Write-Host $Logger -ForegroundColor White }
        { "WARN".Contains($Level) } { Write-Host $Logger -ForegroundColor Yellow }
        { "ERROR".Contains($Level) } { Write-Host $Logger -ForegroundColor DarkRed }
        { "FATAL".Contains($Level) } { Write-Host $Logger -ForegroundColor White -BackgroundColor Red; exit }
        { "DIVIDER".Contains($Level) } { Write-Host "".PadLeft(64, '=') -ForegroundColor Gray }
        default { Write-Host $Logger -ForegroundColor DarkGray }
    }
}

function Test-Unit {
    Write-DisplayHint "This is a Divider." DIVIDER
    Write-DisplayHint "This is a Debug message." debug
    Write-DisplayHint "This is a Notice message." Notice
    Write-DisplayHint "This is a Info message."
    Write-DisplayHint "This is a Success message." "success"
    Write-DisplayHint -LEVEL WARN "This is a Warning message."
    Write-DisplayHint -level "error" "This is a Error message."
    Write-DisplayHint -Level Divider
    'Press Any Key To Continue ...'; [Console]::Readkey() | Out-Null
    Write-DisplayHint -lEvEl FaTaL "This is a Fatal message. Process will exit."
}

Test-Unit
