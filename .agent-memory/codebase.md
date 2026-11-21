# Workspace Brain - winutil-main

## Active Architecture & Modules
- Primary Script: winutil.ps1
- Navigation:
  - WPFTab7BT ('Setup') maps to WPFTab7 ('First Time Setup').
- New Capabilities Added:
  - Step 4: Office Workstation Identity, Network Sharing & Power Configuration:
    - WPFSetupCreateUser & WPFSetupUserName (default 'JMD'), WPFSetupUserPassword (default '2020').
    - WPFSetupRenamePC & WPFSetupComputerName (rename host).
    - WPFSetupNetworkPrivate (all active network profiles switched to Private).
    - WPFSetupNetworkSharing (advfirewall rules for File/Printer Sharing + Network Discovery, autostarts FDResPub, SSDPSRV, upnphost, LanmanServer).
    - WPFSetupEnableRDP (fDenyTSConnections = 0 + Remote Desktop firewall group).
    - WPFSetupPowerNeverSleep (powercfg standby-timeout-ac/dc 0).
    - WPFSetupPowerNeverScreenOff (powercfg monitor-timeout-ac/dc 0).
  - Configuration Persistence & Auto-Detection:
    - Get-WinUtilSetupConfigData
    - Export-WinUtilSetupConfig saves to C:\WinUtil_PC_Setup_Config.json AND SetupConfig_<PCName>_<IP>_<Serial>.json in app folder.
    - Import-WinUtilSetupConfig auto-detects existing configs on launch and restores all options and text inputs.
    - Footer buttons: WPFSetupSaveConfig ('Save Config Now') and WPFSetupLoadConfig ('Load Saved Config').
