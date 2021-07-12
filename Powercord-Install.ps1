
clear
$host.ui.RawUI.WindowTitle = “Powercord Installer by KayoticCarnige”
Write-Host 'Powercord Windows Installer' -ForegroundColor DarkGreen

$host.ui.RawUI.WindowTitle = "Installing Requirements...”
if (Get-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\DiscordCanary' -ErrorAction SilentlyContinue) {

    Write-Host 'Discord Canary is installed: Skipping...' -ForegroundColor Yellow


} Else {

    Write-Host 'Discord Canary is NOT installed: Installing...' -ForegroundColor Blue
        Wait-Event -SourceIdentifier 001 -Timeout 2
        $url = "https://discord.com/api/download/canary?platform=win"
        $output = "DiscordCanarySetup.exe"
        $start_time = Get-Date

        mkdir C:\pstemp -ErrorAction SilentlyContinue
        set-location -path C:\pstemp
        Invoke-WebRequest -Uri $url -OutFile $output
        Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
        Invoke-Item "C:\pstemp\DiscordCanarySetup.exe"
        Write-Warning "Press any key when Discord Canary installed"
        $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        Stop-Process -Name DiscordCanary -Force


}








$software = "Node.js";
$installed = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -eq $software }) -ne $null

if ($installed) {

            Write-Host 'Node JS is installed: Skipping...' -ForegroundColor Yellow




            } Else {

            Write-Host 'Node-JS is NOT installed: Installing...' -ForegroundColor Blue
            Wait-Event -SourceIdentifier 001 -Timeout 2
            $url = "https://nodejs.org/dist/v14.15.4/node-v14.15.4-x64.msi"
            $output = "Node-jsSetup.msi"
            $start_time = Get-Date

            mkdir C:\pstemp -ErrorAction SilentlyContinue
            set-location -path C:\pstemp
            Invoke-WebRequest -Uri $url -OutFile $output
            Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
            .\Node-jsSetup.msi
            Write-Warning "Press any key when Node.js installed"
            $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

            
}




$software = "Git version 2.30.1";
$installed = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -eq $software }) -ne $null

if ($installed) {

            Write-Host 'Git Version 2.30.1 is installed: Skipping...' -ForegroundColor Yellow




            } Else {

            Write-Host 'Git Version 2.30.1 is NOT installed: Installing...' -ForegroundColor Blue
            Wait-Event -SourceIdentifier 001 -Timeout 2
            $url = "https://github.com/git-for-windows/git/releases/download/v2.30.1.windows.1/Git-2.30.1-64-bit.exe"
            $output = "Git.exe"
            $start_time = Get-Date

            mkdir C:\pstemp -ErrorAction SilentlyContinue
            set-location -path C:\pstemp
            Invoke-WebRequest -Uri $url -OutFile $output
            Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
            .\Git.exe
            Write-Warning "Press any key when Node.js installed"
            $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

            
}




$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
$host.ui.RawUI.WindowTitle = "Installing Powercord...”
set-location -path C:\
if ( Test-Path -Path 'C:\powercord' -PathType Container ) { 
$host.ui.RawUI.WindowTitle = "Failed to install Powercord”
Write-Host "Failed to install Powercord, maybe check if Powercord is already installed” -ForegroundColor Red
Write-Host "If not, there may be a file named 'powercord' already present in your root directory” -ForegroundColor Red
pause
explorer.exe c:\
exit
}
Write-Host "Installing Powercord..." -ForegroundColor DarkGreen
git clone https://github.com/powercord-org/powercord
set-location -path C:\powercord
npm i
npm run plug
$host.ui.RawUI.WindowTitle = "Successfully Installed Powercord!”
Write-Host "Powercord has been successfully installed!" -ForegroundColor Green
pause