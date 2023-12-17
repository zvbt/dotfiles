@echo off

komorebic start -c "C:\Users\zvbt\.config\komorebi.json"

timeout /t 1 /nobreak > nul

start "" "komorebi.ahk"
exit
