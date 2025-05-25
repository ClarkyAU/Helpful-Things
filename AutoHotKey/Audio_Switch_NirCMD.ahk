; This script requires Nircmd, which can be found easily online
; Download and run nircmd as admin to install nircmd to windows dir
; Be sure to set your devices correctly, you can rename them if you have conflicting names
; Default Hotkey is Alt+Ctrl+S
; No Pop-up is present on switching of audio
; To have this run on startup, copy a shortcut to shell:startup
#Persistent
#SingleInstance force

Device1_Name := "HS80 Headset"    ; Your headset's exact name
Device2_Name := "AE-5 Speakers"   ; Your speakers' exact name
NirCmdFullPath := "C:\Windows\nircmd.exe" ; Full path to nircmd.exe

global toggleState := false

; Check if nircmd.exe exists at the specified path
If !FileExist(NirCmdFullPath)
{
    MsgBox, 48, Config Issue,It appears we can't find nircmd executable.`nCheck config and try again exit.
    ExitApp
}
Return

^!S:: ; << Define hotkey here
    global toggleState
    toggleState := !toggleState
    targetDevice := toggleState ? Device2_Name : Device1_Name

    Run %NirCmdFullPath% setdefaultsounddevice "%targetDevice%" 1,, Hide
    Run %NirCmdFullPath% setdefaultsounddevice "%targetDevice%" 2,, Hide
Return