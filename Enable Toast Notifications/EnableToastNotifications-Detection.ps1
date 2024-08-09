#MEM Proactive remediation Detection Script
#Checks if Notifications are enabled for the current user
#Created by Derek Easter
#Last Updated: 6/10/2022

# This is testing if toast notifications generally are disabled within Windows
$ToastEnabledKey = (Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications" -Name ToastEnabled).ToastEnabled
if ($ToastEnabledKey -eq "1") {
    Write-Output "Toast notifications are enabled. Reported at: $(Get-Date)"
    Exit 0
}
elseif ($ToastEnabledKey -eq "0") {
    Write-Output "Toast notifications are disabled. Reported at: $(Get-Date)"
    Exit 1
}