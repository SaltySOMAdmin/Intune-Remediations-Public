$appname = "python"
$minVersion = 51185766
$installedPythonVersions = Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" | Get-ItemProperty | Where-Object { $_.DisplayName -match $appname } | Select-Object -Property Version

foreach ($version in $installedPythonVersions) {
    $ver = [int]$version.Version  # Convert the Version property to an integer
    if ($ver -lt $minVersion) {
		Write-Output "Old python installed"
        exit 1
    }
}

Write-Output "Python up to date or not installed"
exit 0
