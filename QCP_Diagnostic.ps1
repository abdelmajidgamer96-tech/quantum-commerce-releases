$Host.UI.RawUI.WindowTitle = "Quantum Commerce Pro - Diagnostic"
$p=0;$w=0;$f=0
function C($s,$m){
    $c=if($s-eq"OK"){"Green"}elseif($s-eq"WARN"){"Yellow"}else{"Red"}
    $i=if($s-eq"OK"){"[OK]  "}elseif($s-eq"WARN"){"[WARN]"}else{"[FAIL]"}
    Write-Host "  $i $m" -ForegroundColor $c
    if($s-eq"OK"){$script:p++}elseif($s-eq"WARN"){$script:w++}else{$script:f++}
}
Write-Host ""
Write-Host "  ==================================================================" -ForegroundColor Cyan
Write-Host "    QUANTUM COMMERCE PRO - DIAGNOSTIC TOOL v2.0" -ForegroundColor Cyan
Write-Host "  ==================================================================" -ForegroundColor Cyan
Write-Host ""
# 1. Windows Build
Write-Host "[1/7] Windows Version..." -ForegroundColor White
try{$b=(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").CurrentBuild
    Write-Host "      Build: $b"
    if([int]$b -ge 19041){C "OK" "Windows 10/11 compatible (Build $b)"}
    else{C "FAIL" "Too old! Requires Build 19041+ (Win10 v2004+). Got: $b"}}
catch{C "WARN" "Cannot check Windows version"}
# 2. 64-bit
Write-Host ""
Write-Host "[2/7] Architecture..." -ForegroundColor White
if([Environment]::Is64BitOperatingSystem){C "OK" "64-bit system - compatible"}
else{C "FAIL" "32-bit system! App requires 64-bit Windows"}
# 3. RAM
Write-Host ""
Write-Host "[3/7] RAM..." -ForegroundColor White
try{$r=[math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory/1GB,1)
    Write-Host "      RAM: $r GB"
    if($r -ge 4){C "OK" "Sufficient RAM ($r GB)"}
    elseif($r -ge 2){C "WARN" "Low RAM ($r GB) - app may be slow"}
    else{C "FAIL" "Insufficient RAM ($r GB) - need 2 GB minimum"}}
catch{C "WARN" "Cannot check RAM"}
# 4. Port 3000
Write-Host ""
Write-Host "[4/7] Port 3000..." -ForegroundColor White
try{$c=Get-NetTCPConnection -LocalPort 3000 -State Listen -ErrorAction SilentlyContinue
    if($c){$pn=(Get-Process -Id $c.OwningProcess -EA SilentlyContinue).Name
           C "WARN" "Port 3000 in use by: $pn - app will try port 3001"}
    else{C "OK" "Port 3000 is free"}}
catch{C "OK" "Port 3000 appears available"}
# 5. AppData write
Write-Host ""
Write-Host "[5/7] AppData write permission (critical for database)..." -ForegroundColor White
try{$d=Join-Path $env:APPDATA "QCP_TEST_$(Get-Random)"
    New-Item -Type Directory $d -Force | Out-Null
    [IO.File]::WriteAllText("$d\t.db","x")
    Remove-Item $d -Recurse -Force
    C "OK" "AppData\Roaming is writable - database will work"}
catch{C "FAIL" "Cannot write to AppData: $($_.Exception.Message)"}
# 6. Disk space
Write-Host ""
Write-Host "[6/7] Disk space (C:)..." -ForegroundColor White
try{$free=[math]::Round((Get-PSDrive C).Free/1GB,1)
    Write-Host "      Free: $free GB"
    if($free -ge 2){C "OK" "Sufficient disk space ($free GB free)"}
    elseif($free -ge 1){C "WARN" "Low disk space ($free GB free)"}
    else{C "FAIL" "Insufficient disk space - need 1 GB free"}}
catch{C "WARN" "Cannot check disk space"}
# 7. VC++ Runtime
Write-Host ""
Write-Host "[7/7] Visual C++ Runtime (required by SQLite)..." -ForegroundColor White
$vc=$false
foreach($p in @("HKLM:\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\x64",
                 "HKLM:\SOFTWARE\WOW6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\x64")){
    if(Test-Path $p){$vc=$true;break}}
if(-not $vc){
    $found=Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" -EA SilentlyContinue |
           Where-Object{$_.DisplayName -like "*Visual C++*201*" -or $_.DisplayName -like "*Visual C++*202*"}
    if($found){$vc=$true}}
if($vc){C "OK" "Visual C++ Runtime found - SQLite will load correctly"}
else{C "WARN" "VC++ Runtime not found. If app fails: https://aka.ms/vs/17/release/vc_redist.x64.exe"}
# Summary
Write-Host ""
Write-Host "  ==================================================================" -ForegroundColor Cyan
Write-Host "    RESULTS: Passed=$p  Warnings=$w  Failed=$f" -ForegroundColor Cyan
Write-Host "  ==================================================================" -ForegroundColor Cyan
if($f -eq 0 -and $w -le 1){Write-Host "  STATUS: FULLY COMPATIBLE - Ready to install!" -ForegroundColor Green}
elseif($f -eq 0){Write-Host "  STATUS: COMPATIBLE (check warnings above)" -ForegroundColor Yellow}
else{Write-Host "  STATUS: ISSUES FOUND - Fix FAIL items before installing." -ForegroundColor Red}
Write-Host ""
Read-Host "  Press Enter to close"
