# Detect if registry value exists
# Created 9/25/23 for upload into MEM
# Last edit/upload 9/25/23

New-Item -Path "HKLM:\SOFTWARE\Microsoft\Teams" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Teams" -Name IsWVDEnvironment -PropertyType DWORD -Value 1 -Force

Exit 0