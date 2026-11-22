$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot

$launchers = [ordered]@{
    '1' = @{ Name = 'Default'; Script = 'run.ps1' }
    '2' = @{ Name = 'Anime'; Script = 'run_anime.ps1' }
    '3' = @{ Name = 'ChangedDress'; Script = 'run_ChangedDress.ps1' }
    '4' = @{ Name = 'Manga'; Script = 'run_Manga.ps1' }
    '5' = @{ Name = 'Realistic'; Script = 'run_realistic.ps1' }
    '6' = @{ Name = 'Face Swap'; Script = 'run_face_swap.ps1' }
    '7' = @{ Name = 'Start Fooocus'; Script = 'start_fooocus.ps1' }
    '8' = @{ Name = 'Clothing Change (adult)'; Script = 'run_clothing_change.ps1' }
    '9' = @{ Name = 'Body Shape / Hair Change (adult)'; Script = 'run_body_change.ps1' }
}

while ($true) {
    Clear-Host
    Write-Host '=========================='
    Write-Host '      Fooocus Launcher'
    Write-Host '=========================='
    Write-Host ''
    foreach ($key in $launchers.Keys) {
        Write-Host "$key. $($launchers[$key].Name)"
    }
    Write-Host 'Q. Quit'
    Write-Host ''

    $selection = (Read-Host 'Select a preset to start').Trim()
    if ($selection -match '^[Qq]$') {
        break
    }

    if ($launchers.Contains($selection)) {
        & (Join-Path $PSScriptRoot $launchers[$selection].Script)
    }
    else {
        Write-Host 'Invalid selection.' -ForegroundColor Yellow
        Read-Host 'Press Enter to continue'
    }
}
