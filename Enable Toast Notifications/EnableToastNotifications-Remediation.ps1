#MEM Proactive remediation Remediation Script
#Enables Toast Notifications
#Created by Derek Easter
#Last Updated: 6/10/2022

# This is used to re-enable toast notifications if the user disabled them generally in Windows
$ToastEnabledKeyPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications"
Set-ItemProperty -Path $ToastEnabledKeyPath -Name ToastEnabled -Value 1 -Force
Get-Service -Name WpnUserService** | Restart-Service -Force
Exit 0