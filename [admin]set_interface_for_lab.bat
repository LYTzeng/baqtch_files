@echo off
netsh interface ip reset
chcp 65001
netsh int ip set address "乙太網路" static 172.30.0.238 255.255.255.0 172.30.0.254
netsh wlan connect ssid=ZeroneWLAN name=ZeroneWLAN
ping -n 1 172.30.0.254 | find "TTL=" >nul
if errorlevel 1 (
    exit
) else (
    route DELETE 0.0.0.0 MASK 0.0.0.0
    route ADD 0.0.0.0 MASK 0.0.0.0 172.30.0.254 METRIC 1 IF "乙太網路"
    route ADD 10.10.0.0 MASK 255.255.0.0 10.10.1.254 METRIC 10 IF "Wi-Fi"
)
exit
