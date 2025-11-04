# Download official Google Play badge into images/gplay.png
# Run in PowerShell (Windows):
#   powershell -ExecutionPolicy Bypass -File scripts\download-badge.ps1

$badgeUrl = 'https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png'
$destDir = Join-Path -Path $PSScriptRoot -ChildPath '..\images'
$destFile = Join-Path -Path $destDir -ChildPath 'gplay.png'

if (-not (Test-Path -Path $destDir)) {
    New-Item -ItemType Directory -Path $destDir -Force | Out-Null
}

Write-Host "Downloading Play Store badge from $badgeUrl to $destFile ..."
try {
    Invoke-WebRequest -Uri $badgeUrl -OutFile $destFile -UseBasicParsing -ErrorAction Stop
    Write-Host "Download completed. Saved to $destFile"
} catch {
    Write-Error "Failed to download badge: $_"
}
