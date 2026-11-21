# Windows Utility Pro (WinUtil Pro)

[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%20%7C%207%2B-blue.svg)](https://microsoft.com/PowerShell)
[![Platform](https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011-0078D6.svg)](https://microsoft.com/windows)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Verification](https://img.shields.io/badge/Tests-100%25%20Passing-brightgreen.svg)](#automated-testing--verification)

**WinUtil Pro** is an all-in-one standalone Windows utility and workstation deployment tool. It combines complete Windows debloating, performance optimization, essential software installation, and dedicated **First-Time Office Workstation Provisioning** with automated configuration persistence and hardware identity discovery.

---

## Key Features

### 1. First-Time Setup & Office Workstation Identity
- **Local User Account Automation**: Creates and configures local workstation user accounts (`JMD`, custom users) with password management, setting passwords to never expire.
- **Computer Name Renaming**: One-click host renaming with automated hostname configuration.
- **Network Sharing & Profile**: Automatically switches active network profiles to **Private** and opens firewall rules for File & Printer Sharing and Network Discovery (enabling `FDResPub`, `SSDPSRV`, `upnphost`, and `LanmanServer`).
- **Remote Desktop (RDP)**: Enables Remote Desktop access (`fDenyTSConnections = 0`) and configures matching Windows Defender Firewall rules.
- **Power Optimization**: Configures `powercfg` timeouts to ensure workstations never sleep or turn monitors off during critical automated tasks.

### 2. Auto-Configuration Persistence & Machine Discovery
- **Export Config**: Exports configuration state automatically to `C:\WinUtil_PC_Setup_Config.json` and a per-workstation file `SetupConfig_<PCName>_<IP>_<Serial>.json`.
- **Import Config & Auto-Detection**: Auto-detects existing configurations on launch, restoring all selected tweaks, apps, and office settings instantly.
- **Manual Save / Load**: Direct footer action buttons (`Save Config Now` and `Load Saved Config`) for rapid multi-machine deployment via USB or network shares.

### 3. Comprehensive Windows Optimization & Debloat
- **Telemetry & Tracking**: Disables telemetry, Bing web search in Start, Recall, Activity History, Location tracking, Lock Screen ads, and Cortana.
- **Performance Tweaks**: Ultimate Performance power scheme, End Task on Taskbar right-click, Game Bar disable, Fast Startup management, and NTFS Last Access optimization.
- **UI Customization**: Enables Dark Mode, classic context menus, visible file extensions, and hidden files visibility.
- **Pre-installed Bloatware Removal**: Removes consumer bloatware, pre-bundled trial software, and background telemetry services.

### 4. Software Package Management
- Silent unattended installation of curated desktop packages via Winget/Chocolatey:
  - Web Browsers: Google Chrome, Brave, Mozilla Firefox
  - Productivity & Utilities: 7-Zip, Notepad++, PowerToys, Everything Search, ShareX, VLC Media Player
  - Runtimes & Gaming: Visual C++ All-in-One Redistributables, DirectX End-User Runtimes, Steam, Discord

### 5. Windows 11 Custom ISO Builder
- Automated ISO customization: bypass hardware requirements (TPM, CPU, SecureBoot, RAM), bypass Microsoft Account (OOBE\BYPASSNRO), bypass BitLocker auto-encryption, inject drivers, and remove bloatware directly from official Windows installation media.

---

## Quick Start

### Option A: Launch via Batch File (Recommended)
Simply double-click `run.bat` or run:
```cmd
run.bat
```
This automatically requests Administrator elevation and starts the utility with `ExecutionPolicy Bypass`.

### Option B: Run via PowerShell Directly
Open PowerShell as Administrator:
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
.\winutil.ps1
```

---

## Automated Testing & Verification

WinUtil Pro includes a comprehensive automated test suite (`test_suite.ps1`):

```powershell
.\test_suite.ps1
```

### Verified Checks:
- **PowerShell AST Syntax Check**: 0 syntax errors across 21,000+ lines of PowerShell code.
- **WPF XAML Schema Validation**: Validated with .NET `XamlReader`, confirming root `System.Windows.Window` and all UI elements load cleanly.
- **UTF-8 BOM Encoding**: Validated with byte-level header check for compatibility across both Windows PowerShell 5.1 and modern PowerShell 7+.
- **PSScriptAnalyzer Security Rules**: Verified 0 violations for `PSAvoidUsingConvertToSecureStringWithPlainText`, `PSAvoidUsingEmptyCatchBlock`, and secure parameter scope.
- **Core Function Architecture**: Confirms presence and signatures of all core runtime and setup functions.

---

## File Structure

```text
winutil-main/
├── .agent-memory/        # Project architecture and verification memory
├── .gitignore            # Git exclusions for configs and logs
├── AGENTS.md             # Multi-agent engineering guide & specifications
├── README.md             # Project documentation and usage guide
├── run.bat               # Double-click Administrator launcher
├── test_suite.ps1        # Automated verification test suite
└── winutil.ps1           # Main WinUtil Pro script (standalone GUI & CLI engine)
```

---

## Credits & License

- Based on the open-source Windows Utility project by Chris Titus Tech and community contributors.
- Custom enterprise office setup, workstation identity provisioning, and configuration persistence by Balaji Finance Machine Lab.
- Distributed under the MIT License.
