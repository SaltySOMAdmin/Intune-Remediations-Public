# Remove Intel NUC Software Studio
$packageName = "AppUp.IntelNUCSoftwareStudio_1.44.25758.0_x64__8j3eq9eme6ctt"
$package = Get-AppxPackage -AllUsers | Where-Object { $_.PackageFullName -eq $packageName }
if ($package) {
	write-output "Uninstalling NUC Software Studio"
	remove-appxpackage -allusers AppUp.IntelNUCSoftwareStudio_1.44.25758.0_x64__8j3eq9eme6ctt
}

# Remove Software Studio Drivers
$driverPath = "C:\Windows\System32\DriverStore\FileRepository\performancedriverextension.inf_amd64_4307518ac694be75"
if (Test-Path $driverPath) {
	write-output "Removing Software Studio Driver"
	pnputil /delete-driver c:\Windows\System32\DriverStore\FileRepository\performancedriverextension.inf_amd64_4307518ac694be75 /uninstall
}

# Remove Software Studio Drivers
$driverPath = "C:\WINDOWS\System32\DriverStore\FileRepository\performancedriverextension.inf_amd64_5fae4c0eb75d98f8"
if (Test-Path $driverPath) {
	write-output "Removing Software Studio Driver"
	pnputil /delete-driver C:\WINDOWS\System32\DriverStore\FileRepository\performancedriverextension.inf_amd64_5fae4c0eb75d98f8 /uninstall
}

# Check if the service exists
$serviceName = "NucSoftwareStudioService"
$service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

if ($service) {
    Write-Host "Service '$serviceName' found. Disabling"

    # Disable the service
    Set-Service -Name $serviceName -StartupType Disabled

    # Stop the service if it's running
    if ($service.Status -eq 'Running') {
        Stop-Service -Name $serviceName -Force
    }

    # Unregister (delete) the service using sc.exe
    sc.exe delete $serviceName

    Write-Host "Service '$serviceName' has been disabled."
}

# Block Driver From Windows Update
Install-PackageProvider -Name NuGet -Force
Install-Module PSWindowsUpdate -Confirm:$False -Force
Set-ExecutionPolicy Bypass -Scope Process -Force
Import-Module PSWindowsUpdate
Hide-WindowsUpdate -Title "Intel Corporation - Extension - 1.0.0.38" -AcceptAll
Set-ExecutionPolicy restricted -Scope Process -Force

exit 0
