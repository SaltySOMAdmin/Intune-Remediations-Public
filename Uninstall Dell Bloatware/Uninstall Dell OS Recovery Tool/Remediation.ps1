$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell SupportAssist OS Recovery Plugin for Dell Update"}
$MyApp.Uninstall()

$supportassist = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall| Get-ItemProperty | Where-Object {$_.DisplayName -ceq "Dell SupportAssist Remediation" } | Select-Object -ExpandProperty UninstallString
if ($supportassist -ne $null)
{
    $arguments = "/qn REBOOT=REALLYSUPRESS"
    echo "Uninstalling Dell SupportAssist"
    (Start-Process $supportassist -wait -NoNewWindow -PassThru -ArgumentList $arguments).ExitCode
}

$supportassist = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall| Get-ItemProperty | Where-Object {$_.DisplayName -ceq "Dell SupportAssist" } | Select-Object -ExpandProperty UninstallString
if ($supportassist -ne $null)
{
    $arguments = "/qn REBOOT=REALLYSUPRESS"
    echo "Uninstalling Dell SupportAssist"
    (Start-Process $supportassist -wait -NoNewWindow -PassThru -ArgumentList $arguments).ExitCode
}

Exit 0