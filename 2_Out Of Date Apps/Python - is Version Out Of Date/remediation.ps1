
# Function to uninstall MSIs, remove local files, and registry entries
Function Remove-Program ($msiCode) {
    Start-Process msiexec.exe -Wait -ArgumentList "/x $msiCode /qn"
    $localPath = $null
    if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$msiCode") {
		$localPath = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$msiCode").InstallSource
		Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$msiCode" -Force -Recurse
    }
    if (Test-Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$msiCode") {
		$localPath = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$msiCode").InstallSource
		Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$msiCode" -Force -Recurse
    }
    if ($localPath) {
		Remove-Item -Path $localPath -Force -Recurse -ErrorAction SilentlyContinue
    }
}

# Array of MSI codes for all Python components
# Store MSI codes in an array
$msiCodes = @(
    "{10FB2B6E-BDA1-479F-9844-FF3A9C8ED166}", # DisplayName: Python 3.7.5 Tcl/Tk Support (64-bit symbols)
    "{2E590D5A-4E40-4C9C-AFF8-7CB80F085752}", # DisplayName: Python 3.7.5 pip Bootstrap (64-bit)
    "{3AA7C0A6-97EC-41C9-B2F8-37BCA749D9C9}", # DisplayName: Python 3.7.5 Executables (64-bit symbols)
    "{42DC5149-4088-4217-8F86-487FA8B953FC}", # DisplayName: Python 3.7.5 Tcl/Tk Support (64-bit)
    "{45CB356A-C0DF-430E-B75F-7764DBA06DF9}", # DisplayName: Python 3.7.5 Standard Library (64-bit)
    "{5A54B213-36D8-40CB-9E55-D20864AEF3C8}", # DisplayName: Python 3.7.5 Development Libraries (64-bit)
    "{6DC6BC71-F1FB-412D-A16A-2FE8C463E89F}", # DisplayName: Python 3.7.5 Core Interpreter (64-bit)
    "{8159776E-5D9A-457B-BAA5-AD306A89D3C9}", # DisplayName: Python 3.7.5 Standard Library (64-bit symbols)
    "{8186EDC2-D02C-4561-BD11-55F3B9C363FF}", # DisplayName: Python 3.7.5 Core Interpreter (64-bit symbols)
    "{8864B390-4DFB-43AB-934B-F02C48577666}", # DisplayName: Python 3.7.5 Executables (64-bit)
    "{A5AC50DE-D446-4AF2-8D83-8BC548B57C31}", # DisplayName: Python 3.7.5 Test Suite (64-bit symbols)
    "{B33E7CE3-8BFE-4F55-8505-2F74D97392C4}", # DisplayName: Python 3.7.5 Documentation (64-bit)
	"{08D7A4E8-F704-409B-A676-457432DA3248}", # DisplayName: Python 3.10.7 Standard Library (64-bit)
	"{099B73AD-9E34-4ADF-B982-7E3A75610CA6}", # DisplayName: Python 3.10.7 Test Suite (64-bit)
	"{30C9588C-5E1D-479E-988A-DA38CADFA384}", # DisplayName: Python 3.10.7 pip Bootstrap (64-bit)
	"{51EC70CA-6E66-499A-B7F7-94912F3EA381}", # DisplayName: Python 3.10.7 Documentation (64-bit)
	"{7BB23EC2-FD76-4BDB-813C-3EEFBB7FD3D9}", # DisplayName: Python 3.10.7 Tcl/Tk Support (64-bit)
	"{C9D65557-5B19-4B9B-860E-4E5477F9B10A}", # DisplayName: Python 3.10.7 Development Libraries (64-bit)
	"{CE8E4C24-9C7B-447B-B974-CD8236BE09B9}", # DisplayName: Python 3.10.7 Executables (64-bit)
	"{D4C83865-A602-4834-8390-B094CAF22F71}", # DisplayName: Python 3.10.7 Core Interpreter (64-bit)
	"{E1A1200C-5CC4-404B-BF93-E33C463963CD}", # DisplayName: Python 3.10.7 Utility Scripts (64-bit)
    "{9D731829-C401-4DFE-8906-79EBFAD18AF7}", # DisplayName: Python 3.10.8 Standard Library (64-bit)
    "{B7DEC02E-E147-40A2-86C9-1F910DC43D1C}", # DisplayName: Python 3.10.8 Development Libraries (64-bit)
    "{BBF729BB-B0D3-4180-A4A7-3A713F0BE254}", # DisplayName: Python 3.10.8 Utility Scripts (64-bit)
    "{025F829D-844C-4E80-8C2C-ECBD6FB455BC}", # DisplayName: Python 3.10.8 Test Suite (64-bit)
    "{02E2EFF4-C685-4151-9A40-E50DE7A8A5D7}", # DisplayName: Python 3.10.8 Documentation (64-bit)
    "{12EB4B8C-1F27-4A73-9B33-4545D52637D6}", # DisplayName: Python 3.10.8 pip Bootstrap (64-bit)
    "{2F64CAF0-C8D6-4E7C-B263-D837C5888EC9}", # DisplayName: Python 3.10.8 Add to Path (64-bit)
    "{361761A0-847E-4A8B-B375-1F77E475321E}", # DisplayName: Python 3.10.8 Executables (64-bit)
    "{5ADA7829-A477-4BE0-8112-7C0C720F7093}", # DisplayName: Python 3.10.8 Tcl/Tk Support (64-bit)
    "{6463E43B-54B1-4407-818D-DD90D11CDD06}", # DisplayName: Python 3.10.8 Core Interpreter (64-bit)
    "{0D289858-69D1-4CB6-946E-659F028DDC27}", # DisplayName: Python 3.11.3 Standard Library (64-bit)
    "{25DC2A6F-FDC2-40D0-AA9D-3BF392BDF500}", # DisplayName: Python 3.11.3 Documentation (64-bit)
    "{55BEEF7A-9288-497D-B5CE-960D2F3C70A3}", # DisplayName: Python 3.11.3 pip Bootstrap (64-bit)
    "{5BF6CA5B-E057-413A-B87A-CCD47600E465}", # DisplayName: Python 3.11.3 Utility Scripts (64-bit)
    "{611F1238-29A9-495F-B1F4-CFFCC98D9421}", # DisplayName: Python 3.11.3 Core Interpreter (64-bit)
    "{A2BCB6C1-272D-437F-A5BC-92431FC521B4}", # DisplayName: Python 3.11.3 Executables (64-bit)
    "{BA9ABB78-751C-4488-80A9-60E44290C060}", # DisplayName: Python 3.11.3 Test Suite (64-bit)
    "{C321A7FC-E479-4E2A-AA09-2698EFEA4CA3}", # DisplayName: Python 3.11.3 Tcl/Tk Support (64-bit)
    "{D307D056-AF62-4F53-810E-052AAAF0EFB2}", # DisplayName: Python 3.11.3 Development Libraries (64-bit)
    "{1D653E80-09B2-40AB-9530-7DF12E632F8A}", # DisplayName: Python 3.11.9 pip Bootstrap (64-bit)
    "{29CEC70F-9D96-472B-B6A1-AE7578376985}", # DisplayName: Python 3.11.9 Utility Scripts (64-bit)
    "{425B36E9-4EA6-47B4-88C3-E798BA903188}", # DisplayName: Python 3.11.9 Documentation (64-bit)
    "{57AC2A86-EC99-4E9C-9FF9-15DAA88D1FAE}", # DisplayName: Python 3.11.9 Tcl/Tk Support (64-bit)
    "{9AFDC691-40E5-4B15-835F-9A524AC4672C}", # DisplayName: Python 3.11.9 Standard Library (64-bit)
    "{A9F91BE3-1B3B-4CB4-A169-19E13DD70BEA}", # DisplayName: Python 3.11.9 Test Suite (64-bit)
    "{B074012B-9B85-4049-BA01-A58A8C4C2236}", # DisplayName: Python 3.11.9 Core Interpreter (64-bit)
    "{CEE03ABD-D5F9-4104-BFA5-520711B8D71F}", # DisplayName: Python 3.11.9 Development Libraries (64-bit)
	"{4F815F87-CE9F-45CF-AEDE-EDF03728F8E6}", # DisplayName: Python 3.12.4 Core Interpreter (64-bit)
	"{62DD7DAF-6279-46FA-A06B-C4A541244045}", # DisplayName: Python 3.12.4 Standard Library (64-bit)
	"{71BC2876-3319-44FC-B5C5-1C0B86FC2733}", # DisplayName: Python 3.12.4 Tcl/Tk Support (64-bit)
	"{754A267E-52AE-4A9F-AFF4-F67EDC4B3610}", # DisplayName: Python 3.12.4 Executables (64-bit)
	"{7BFF8368-33A0-4DB3-9442-F5C881FE1B4D}", # DisplayName: Python 3.12.4 Development Libraries (64-bit)
	"{AC669800-A797-444D-A450-A5109BBC74DE}", # DisplayName: Python 3.12.4 Test Suite (64-bit)
	"{AC7F58DC-CF45-4B28-9EAE-AE152C588907}", # DisplayName: Python 3.12.4 Documentation (64-bit)
	"{EFA83559-2E1E-4671-85F7-B28AA1DD08D7}", # DisplayName: Python 3.12.4 pip Bootstrap (64-bit)
	"{3C4935A5-B72E-4DA4-809E-0287A0BC046F}"  # DisplayName: Python 3.12.4 Launcher (64-bit)
)

# Loop through all MSI codes and call Remove-Program
foreach ($code in $msiCodes) {
    Write-Host "Uninstalling MSI: $code"
    Remove-Program $code
}

exit 0