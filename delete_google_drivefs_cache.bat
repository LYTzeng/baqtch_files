@echo off
taskkill /IM "GoogleDriveFS.exe"  /F
set CACHE="C:\Users\oscar.tseng\AppData\Local\Google\DriveFS\dDEwNDgyMDAwM0BudHV0Lm9yZy50dw\content_cache"
cd /d %CACHE%
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q . 2>NUL || echo "skip file")
start "" "C:\Program Files\Google\Drive File Stream\32.0.11.0\GoogleDriveFS.exe" /popup
exit