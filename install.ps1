$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$source = Join-Path $repoRoot "jinjin"
$target = Join-Path $env:USERPROFILE ".codex\pets\jinjin"

if (-not (Test-Path -LiteralPath $source)) {
    throw "Cannot find source pet folder: $source"
}

New-Item -ItemType Directory -Force -Path $target | Out-Null
Copy-Item -LiteralPath (Join-Path $source "pet.json") -Destination (Join-Path $target "pet.json") -Force
Copy-Item -LiteralPath (Join-Path $source "spritesheet.webp") -Destination (Join-Path $target "spritesheet.webp") -Force

Write-Host "Installed 金金 to $target"
Write-Host "Restart Codex or reload the pet picker to use it."
