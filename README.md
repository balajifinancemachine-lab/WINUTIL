# Windows Utility Pro (WinUtil Pro)

[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%20%7C%207%2B-blue.svg)](https://microsoft.com/PowerShell)
[![Platform](https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011-0078D6.svg)](https://microsoft.com/windows)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Verification](https://img.shields.io/badge/Tests-100%25%20Passing-brightgreen.svg)](#automated-testing--verification)

**WinUtil Pro** is an all-in-one standalone Windows utility and workstation deployment tool. It combines complete Windows debloating, performance optimization, essential software installation, and dedicated **First-Time Office & Developer Workstation Provisioning** with automated configuration persistence and multi-source open-source repository integration.

---

## Key Features

### 1. Multi-Source Open-Source App Directories & Package Repositories
- **Scoop Open-Source Package Directory**: Automated bootstrapping of Scoop with essential developer buckets enabled (`extras`, `versions`, `nerd-fonts`).
- **UniGetUI (Universal Package Manager Hub)**: Graphical user interface managing WinGet, Scoop, Chocolatey, Pip, NPM, .NET Tool, and PowerShell Gallery in one place.
- **Repository Synchronization (`Invoke-WinUtilOpenSourceSync`)**: One-command synchronization across WinGet community repository, Chocolatey feed, and Scoop buckets.
- **Official WinGet & Chocolatey Integration**: Seamless unattended installations with automatic privilege escalation.

### 2. Python Dependencies & Environment Management
- **Astral UV (`astral-sh.uv`)**: Ultra-fast Python package resolver and installer written in Rust (10-100x faster than pip).
- **Poetry (`Poetry.Poetry`)**: Deterministic dependency resolution, virtualenv management, and packaging for modern Python projects.
- **Pipx (`pypa.pipx`)**: Install and run CLI applications directly from PyPI in isolated virtual environments.
- **Pyenv-Win (`pyenv-win`)**: Multiple Python version management for Windows workstations.
- **Miniconda3 & Anaconda3**: Lightweight and enterprise data science/machine learning environment distributions.
- **Ruff (`astral-sh.ruff`)**: Blazing fast Python linter and code formatter.

### 3. Model Context Protocol (MCP) Servers & Local AI Toolchain
- **MCP Server Suite (`Install-WinUtilMCPServerSuite`)**: Instant runtime and dependencies for standard Model Context Protocol servers (`filesystem`, `memory`, `sqlite`, `fetch`, `github`, `postgres`, `everything`).
- **Ollama (`Ollama.Ollama`)**: Local open-source LLM runtime serving local models and MCP inference endpoints.
- **LM Studio (`ElementLabs.LMStudio`)**: Offline local LLM discovery and OpenAI-compatible MCP server host.
- **Jan AI (`Jan.Jan`)**: 100% local, private, and open-source AI assistant.
- **Bun (`Oven-sh.Bun`) & Deno (`DenoLand.Deno`)**: High-performance modern JavaScript/TypeScript runtimes optimized for rapid MCP server execution.
- **NodeJS LTS**: Standard NPM execution environment for MCP toolchains.

### 4. Modern App Development Tools & IDEs
- **Editors & IDEs**: Visual Studio Code, VSCodium, Windsurf Agentic AI IDE, PyCharm Community, IntelliJ IDEA Community, Lapce Rust native editor, Android Studio.
- **Containers & Virtualization**: Podman Desktop (open-source daemonless Docker alternative), Docker Desktop.
- **API & SCM Tooling**: Insomnia REST/GraphQL Client, Git SCM, GitHub CLI, Windows Terminal, Zig Toolchain.

### 5. First-Time Setup & Office/Dev Workstation Provisioning
- **Curated Presets**: One-click device presets including **Desktop PC**, **Laptop**, **Gaming Rig**, **Office / Work**, and the newly added **Dev / AI Workstation** preset.
- **Local User Account Automation**: Creates and configures local workstation user accounts (`JMD`, custom users) with password management, setting passwords to never expire.
- **Computer Name Renaming**: One-click host renaming with automated hostname configuration.
- **Network Sharing & Profile**: Automatically switches active network profiles to **Private** and opens firewall rules for File & Printer Sharing and Network Discovery (enabling `FDResPub`, `SSDPSRV`, `upnphost`, and `LanmanServer`).
- **Remote Desktop (RDP)**: Enables Remote Desktop access (`fDenyTSConnections = 0`) and configures matching Windows Defender Firewall rules.
- **Power Optimization**: Configures `powercfg` timeouts to ensure workstations never sleep or turn monitors off during critical automated tasks.
- **Auto-Configuration Persistence**: Automatically saves and restores workstation state via `C:\WinUtil_PC_Setup_Config.json` and local machine serial profiles.

### 6. Windows Optimization & Debloat
- Disables telemetry, Bing web search in Start, Recall, Activity History, Location tracking, Lock Screen ads, and Cortana.
- Ultimate Performance power scheme, End Task on Taskbar right-click, Game Bar disable, Fast Startup management, and NTFS Last Access optimization.
- Enables Dark Mode, classic context menus, visible file extensions, and hidden files visibility.

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
pwsh.exe -ExecutionPolicy Bypass -File .\test_suite.ps1
```

### Verified Checks:
- **PowerShell AST Syntax Check**: 0 syntax errors across 22,000+ lines of PowerShell code.
- **WPF XAML Schema Validation**: Validated with .NET `XamlReader`, confirming root `System.Windows.Window` and all UI elements load cleanly.
- **UTF-8 BOM Encoding**: Validated with byte-level header check for compatibility across both Windows PowerShell 5.1 and modern PowerShell 7+.
- **Core Function Architecture**: Confirms presence and signatures of all core runtime and setup functions.
- **Open-Source Sources & MCP Providers**: Verifies `Install-WinUtilScoop`, `Install-WinUtilPythonEnv`, `Install-WinUtilMCPServerSuite`, and `Invoke-WinUtilOpenSourceSync`.
- **Python & MCP Development Catalog**: Verifies 23 newly added development, AI, and package management tools.
- **PSScriptAnalyzer Security Rules**: Verified 0 violations for `PSAvoidUsingConvertToSecureStringWithPlainText`, `PSAvoidUsingEmptyCatchBlock`, and secure parameter scope.

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
- Custom enterprise office setup, workstation identity provisioning, MCP server ecosystem, and Python dev tooling by Balaji Finance Machine Lab.
- Distributed under the MIT License.
