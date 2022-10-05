param (
    [string]$Path = "C:\codedojo\ants-aichallenge"
)
@"

/\/\
  \_\  _..._
  (" )(_..._)
   ^^  // \\

"@

if ((Test-Path $Path)) {
    Write-Information -MessageData "Ants aichallenge is already setup. To run setup again, please remove the folder '$Path' first." -InformationAction Continue
    return
}

Write-Information -MessageData "Running ants aichallenge setup" -InformationAction Continue
Write-Information -MessageData "Create new folder $Path" -InformationAction Continue
New-Item -Path $Path -ItemType Directory

Write-Information -MessageData "Cloning c# starter pack" -InformationAction Continue
& git clone "https://github.com/wintheriscomming/ants-aichallenge" "$Path\ants\"
Push-Location "$Path\ants\"
& git remote rm origin
Pop-Location

Write-Information -MessageData "Cloning c# starter pack" -InformationAction Continue
& git clone "https://github.com/wintheriscomming/ants-aichallenge-combat-client" "$Path\combat\"
Push-Location "$Path\combat\"
Pop-Location

Write-Information -MessageData "Download tools" -InformationAction Continue
Invoke-WebRequest -Uri http://ants.aichallenge.org/tools.zip -OutFile $Path\tools.zip

Write-Information -MessageData "Unpacking files" -InformationAction Continue
Expand-Archive $Path\tools.zip -DestinationPath $Path -Force

Write-Information -MessageData "Removing zip files" -InformationAction Continue
Remove-Item $Path\tools.zip

$p = & { python -V } 2>&1
if ($p -is [System.Management.Automation.ErrorRecord]) {
    Write-Information -MessageData $p.Exception.Message -InformationAction Continue
    Write-Information -MessageData "Downloading Python" -InformationAction Continue
    Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.10.7/python-3.10.7-amd64.exe -OutFile $Path\python-3.10.7-amd64.exe
    Write-Information -MessageData "Launch python installer" -InformationAction Continue
    Start-Process -FilePath “$Path\python-3.10.7-amd64.exe” -NoNewWindow -Wait
    Write-Information -MessageData "Remove python installer" -InformationAction Continue
    Remove-Item $Path\python-3.10.7-amd64.exe
}
else {
    Write-Information -MessageData $p -InformationAction Continue
    Write-Information -MessageData "Python installed" -InformationAction Continue
}

Write-Information -MessageData "Downloading.Net SDK 6.0.401-x64" -InformationAction Continue
Invoke-WebRequest -Uri https://download.visualstudio.microsoft.com/download/pr/cebf08ce-ecf1-4439-8a0a-d81b3a4cad12/674ba293b83bdc9b1e00ddfa3ab82f10/dotnet-sdk-6.0.401-win-x64.exe -OutFile $Path\dotnet-sdk-6.0.401-win-x64.exe
Write-Information -MessageData "Installing .Net SDK 6.0.401-x64" -InformationAction Continue
Start-Process -FilePath “$Path\dotnet-sdk-6.0.401-win-x64.exe” -NoNewWindow -Wait
Write-Information -MessageData "Remove .Net SDK 6.0.401-x64 installation file" -InformationAction Continue
Remove-Item $Path\dotnet-sdk-6.0.401-win-x64.exe
Set-Location -Path $Path

Write-Information -MessageData "Open application folder" -InformationAction Continue
& Start-Process .
& Start-Process "$Path\ants\ants.sln"
& dotnet build "$Path\ants\"
Start-Process "http://ants.aichallenge.org/ants_tutorial.php"
Write-Information -MessageData "Setup complete" -InformationAction Continue
Write-Information -MessageData "Happy coding!!" -InformationAction Continue

