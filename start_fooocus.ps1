param(
    [string]$Preset,
    [int]$Port = 8194,
    [switch]$LowVram
)

$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot

$python = Join-Path $PSScriptRoot 'python_embeded\python.exe'
$entryPoint = Join-Path $PSScriptRoot 'Fooocus\entry_with_update.py'

$pythonArgs = @('-s', $entryPoint, '--port', $Port)
if (-not [string]::IsNullOrWhiteSpace($Preset)) {
    $pythonArgs += @('--preset', $Preset)
}
if ($LowVram) {
    $pythonArgs += '--always-low-vram'
}

& $python @pythonArgs

$exitCode = $LASTEXITCODE
if ($exitCode -ne 0) {
    Write-Host "Fooocus exited with code $exitCode." -ForegroundColor Red
}
Read-Host 'Press Enter to return'
