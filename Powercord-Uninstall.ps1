clear
$host.ui.RawUI.WindowTitle = “Powercord Uninstaller by KayoticCarnige”
if (-not( Test-Path -Path 'C:\powercord' -PathType Container )) { 
    $host.ui.RawUI.WindowTitle = "No Powercord Install found on root”
    Write-Host "There is no Powercord install at your root directory [C:\]” -ForegroundColor Red
    pause
    exit
}
Write-Host "Are you sure you want to uninstall Powercord?" -ForegroundColor DarkGreen
Write-Host "All of your themes, plugins, and settings will be deleted" -ForegroundColor Red
Read-Host -Prompt "Press any key to continue or CTRL+C to quit" 
Write-Host "Uninstalling Powercord..." -ForegroundColor Red
set-location -path C:\powercord
npm run unplug
set-location -path C:\
Remove-Item 'powercord' -Force -Recurse
$host.ui.RawUI.WindowTitle = "Successfully Uninstalled Powercord!”
Write-Host "Powercord has been successfully uninstalled!" -ForegroundColor Green
pause