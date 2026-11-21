@echo off
title WinUtil Pro Launcher
cd /d "%~dp0"

:: Check for Administrator elevation
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting Administrator privileges...
    powershell -Command "Start-Process cmd.exe -ArgumentList '/c \"\"%~f0\"\"' -Verb RunAs"
    exit /b
)

echo Starting WinUtil Pro...
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0winutil.ps1"
if %errorlevel% neq 0 (
    echo.
    echo WinUtil finished with exit code %errorlevel%.
    pause
)
