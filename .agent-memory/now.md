# Active State

- Task: Add Python Dependencies, MCP Servers, App Dev Tools & Open Source Directories
- Status: VERIFIED & COMPLETED
- Added Capabilities:
  - Scoop OpenSource Package Manager integration (`Install-WinUtilScoop`) with extras and versions buckets.
  - Python Development Environment suite (`Install-WinUtilPythonEnv`) with UV, Pipx, and PyPI sources.
  - Model Context Protocol (MCP) Server Toolchain (`Install-WinUtilMCPServerSuite`) for standard AI agent servers.
  - Open Source Directory Sync (`Invoke-WinUtilOpenSourceSync`) across WinGet, Scoop, and Chocolatey.
  - 23 New Application Catalog entries in Development category:
    - Python: Poetry, Pipx, Pyenv-Win, Miniconda3, Anaconda3, Ruff
    - MCP & AI: Ollama, LM Studio, Jan AI, Bun, Deno, MCP Servers Toolchain
    - Open Source Dev Tools: Scoop, UniGetUI, Podman Desktop, Windsurf IDE, Insomnia, PyCharm Community, IntelliJ IDEA Community, Lapce, Android Studio, Zig, Windows Terminal
  - First-Time Setup Preset: "Dev / AI Workstation" preset with automated installation of Python, UV, Git, Bun, Ollama, VS Code, Scoop, and UniGetUI.
- Validation:
  - PowerShell AST syntax: 0 errors across 22,000+ lines.
  - WPF Window XAML: 0 errors (valid System.Windows.Window, 205,487 bytes).
  - Test Suite: 7/7 tests passing (100%).
