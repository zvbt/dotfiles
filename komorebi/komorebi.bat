@echo off

komorebic start --config "C:\Users\cyadine\.config\komorebi\komorebi.json"

timeout /t 1 /nobreak > nul

start "" "komorebi.ahk"
exit
