# Test for Intel NUC Software Studio
$packageName = "AppUp.IntelNUCSoftwareStudio_1.44.25758.0_x64__8j3eq9eme6ctt"
$package = Get-AppxPackage -AllUsers | Where-Object { $_.PackageFullName -eq $packageName }

if ($package) {
    Write-Output "Package found: $($package.PackageFullName)"
    exit 1
} else {
    Write-Output "Package not found."
}

 
# Test for Software Studio Drivers
$driverPath = "C:\Windows\System32\DriverStore\FileRepository\performancedriverextension.inf_amd64_4307518ac694be75"

if (Test-Path $driverPath) {
    Write-Output "Driver found at $driverPath"
    exit 1
} else {
    Write-Output "Driver not found."
}

# Test for Software Studio Drivers
$driverPath = "C:\WINDOWS\System32\DriverStore\FileRepository\performancedriverextension.inf_amd64_5fae4c0eb75d98f8"

if (Test-Path $driverPath) {
    Write-Output "Driver found at $driverPath"
    exit 1
} else {
    Write-Output "Driver not found."
}

# Remove Intel® Software Installer
$exePath = "C:\ProgramData\Package Cache\{a6cf16a4-9aef-469b-98af-71b15f60a233}\WirelessSetup.exe"
if (Test-Path $exePath) {
    Write-Host "Intel Software Installer found"
    exit 1
}

Exit 0