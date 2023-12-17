@echo off

komorebic stop
taskkill /f /im AutoHotkey64.exe
taskkill /f /im whkd.exe
timeout /t 1 /nobreak > nul
exit
