# WinUtil Test Suite
# Tests syntax, XAML parsing, critical functions, open-source sources, and configuration handling

$ErrorActionPreference = "Stop"
$scriptPath = Join-Path $PSScriptRoot "winutil.ps1"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host " WinUtil Automated Verification Test Suite" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

$allPassed = $true

# Test 1: PowerShell AST Syntax Validation
Write-Host "`n[Test 1] PowerShell AST Syntax Check..." -NoNewline
$tokens = $null
$errors = $null
$ast = [System.Management.Automation.Language.Parser]::ParseFile($scriptPath, [ref]$tokens, [ref]$errors)
if ($errors.Count -eq 0) {
    Write-Host " PASS (0 syntax errors)" -ForegroundColor Green
} else {
    Write-Host " FAIL ($($errors.Count) errors)" -ForegroundColor Red
    $errors | ForEach-Object { Write-Host "  - Line $($_.Extent.StartLineNumber): $($_.Message)" -ForegroundColor Red }
    $allPassed = $false
}

# Test 2: WPF XAML Schema & Control Tree Validation
Write-Host "[Test 2] WPF XAML Schema & Control Tree..." -NoNewline
Add-Type -AssemblyName PresentationFramework
$scriptContent = Get-Content -LiteralPath $scriptPath -Raw
if ($scriptContent -match '(?ms)\$inputXML\s*=\s*@''\s*\r?\n(.*?)''@') {
    try {
        $xmlReader = [System.Xml.XmlReader]::Create([System.IO.StringReader]::new($matches[1]))
        $window = [System.Windows.Markup.XamlReader]::Load($xmlReader)
        if ($window -is [System.Windows.Window]) {
            Write-Host " PASS (Valid Window XAML, $($matches[1].Length) bytes)" -ForegroundColor Green
        } else {
            Write-Host " FAIL (Root element is not Window)" -ForegroundColor Red
            $allPassed = $false
        }
    } catch {
        Write-Host " FAIL ($($_.Exception.Message))" -ForegroundColor Red
        $allPassed = $false
    }
} else {
    Write-Host " FAIL (Could not find `$inputXML block)" -ForegroundColor Red
    $allPassed = $false
}

# Test 3: UTF-8 BOM Encoding Verification
Write-Host "[Test 3] UTF-8 BOM Encoding..." -NoNewline
$bytes = [System.IO.File]::ReadAllBytes($scriptPath)
if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
    Write-Host " PASS (UTF-8 BOM header verified)" -ForegroundColor Green
} else {
    Write-Host " FAIL (Missing UTF-8 BOM)" -ForegroundColor Red
    $allPassed = $false
}

# Test 4: Critical Function Declarations
Write-Host "[Test 4] Critical Function & Architecture Integrity..." -NoNewline
$expectedFunctions = @(
    "Start-WinUtilUserInterface",
    "Start-WinUtilJob",
    "Measure-WinUtilStep",
    "Get-WinUtilSetupConfigData",
    "Export-WinUtilSetupConfig",
    "Import-WinUtilSetupConfig",
    "Invoke-WinUtilTweaks",
    "Invoke-WPFTab"
)
$missingFunctions = @()
foreach ($fn in $expectedFunctions) {
    if ($scriptContent -notmatch "(?m)function\s+$fn\b") {
        $missingFunctions += $fn
    }
}
if ($missingFunctions.Count -eq 0) {
    Write-Host " PASS ($($expectedFunctions.Count)/$($expectedFunctions.Count) core functions present)" -ForegroundColor Green
} else {
    Write-Host " FAIL (Missing: $($missingFunctions -join ', '))" -ForegroundColor Red
    $allPassed = $false
}

# Test 5: Open-Source Sources & MCP Ecosystem Providers
Write-Host "[Test 5] Open-Source Sources & MCP Providers..." -NoNewline
$sourceFunctions = @(
    "Install-WinUtilScoop",
    "Install-WinUtilPythonEnv",
    "Install-WinUtilMCPServerSuite",
    "Install-WinUtilDevExtensions",
    "Invoke-WinUtilOpenSourceSync"
)
$missingSources = @()
foreach ($sfn in $sourceFunctions) {
    if ($scriptContent -notmatch "(?m)function\s+$sfn\b") {
        $missingSources += $sfn
    }
}
if ($missingSources.Count -eq 0) {
    Write-Host " PASS ($($sourceFunctions.Count)/$($sourceFunctions.Count) source handlers present)" -ForegroundColor Green
} else {
    Write-Host " FAIL (Missing: $($missingSources -join ', '))" -ForegroundColor Red
    $allPassed = $false
}

# Test 6: Python, Android, PHP & MCP Development Package Catalog
Write-Host "[Test 6] Python, Android, PHP & MCP Development Catalog..." -NoNewline
if ($scriptContent -match '(?ms)\$sync\.configs\.applications\s*=\s*@''\s*\r?\n(.*?)''@\s*\|\s*ConvertFrom-Json') {
    try {
        $appsJson = $matches[1] | ConvertFrom-Json
        $requiredApps = @(
            "WPFInstallpoetry", "WPFInstallpipx", "WPFInstallpyenv", "WPFInstallminiconda",
            "WPFInstallanaconda", "WPFInstallruff", "WPFInstallollama", "WPFInstalllmstudio",
            "WPFInstalljan", "WPFInstallbun", "WPFInstalldeno", "WPFInstallpodman",
            "WPFInstallwindsurf", "WPFInstallinsomnia", "WPFInstallpycharmce", "WPFInstallintellijce",
            "WPFInstalllapce", "WPFInstallandroidstudio", "WPFInstallzig", "WPFInstallwindowsterminal",
            "WPFInstallunigetui", "WPFInstallmcpservers", "WPFInstallscoop",
            "WPFInstallplatformtools", "WPFInstallscrcpy", "WPFInstalldart", "WPFInstalljdk17",
            "WPFInstallgenymotion", "WPFInstallphp", "WPFInstallcomposer", "WPFInstalllaragon",
            "WPFInstallxampp", "WPFInstallddev", "WPFInstalljupyterlab", "WPFInstallbuildtools"
        )
        $missingApps = @()
        foreach ($app in $requiredApps) {
            if ($null -eq $appsJson.$app) {
                $missingApps += $app
            }
        }
        if ($missingApps.Count -eq 0) {
            Write-Host " PASS ($($requiredApps.Count)/$($requiredApps.Count) tools verified across Android, PHP, Python, and MCP)" -ForegroundColor Green
        } else {
            Write-Host " FAIL (Missing apps: $($missingApps -join ', '))" -ForegroundColor Red
            $allPassed = $false
        }
    } catch {
        Write-Host " FAIL (JSON parse error: $($_.Exception.Message))" -ForegroundColor Red
        $allPassed = $false
    }
} else {
    Write-Host " FAIL (Could not find `$sync.configs.applications block)" -ForegroundColor Red
    $allPassed = $false
}

# Test 7: PSScriptAnalyzer High-Priority Security & Cleanliness Rules
Write-Host "[Test 7] PSScriptAnalyzer Security Rules..." -NoNewline
if (Get-Command Invoke-ScriptAnalyzer -ErrorAction SilentlyContinue) {
    $rules = @("PSAvoidUsingConvertToSecureStringWithPlainText", "PSAvoidUsingEmptyCatchBlock")
    $findings = Invoke-ScriptAnalyzer -Path $scriptPath -IncludeRule $rules
    if ($findings.Count -eq 0) {
        Write-Host " PASS (0 findings across targeted rules)" -ForegroundColor Green
    } else {
        Write-Host " FAIL ($($findings.Count) findings)" -ForegroundColor Red
        $findings | ForEach-Object { Write-Host "  - Line $($_.Line): $($_.RuleName) - $($_.Message)" -ForegroundColor Red }
        $allPassed = $false
    }
} else {
    Write-Host " SKIP (PSScriptAnalyzer not installed)" -ForegroundColor Yellow
}

# Summary
Write-Host "`n==========================================" -ForegroundColor Cyan
if ($allPassed) {
    Write-Host " ALL TESTS PASSED SUCCESSFULLY! (100%)" -ForegroundColor Green
    Write-Host "==========================================" -ForegroundColor Cyan
    exit 0
} else {
    Write-Host " TESTS COMPLETED WITH FAILURES" -ForegroundColor Red
    Write-Host "==========================================" -ForegroundColor Cyan
    exit 1
}
