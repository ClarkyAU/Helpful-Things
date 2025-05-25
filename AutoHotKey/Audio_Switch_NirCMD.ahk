; This script requires Nircmd, which can be found easily online
; Download and run nircmd as admin to install nircmd to windows dir (e.g., C:\Windows\nircmd.exe)
; Be sure to set your devices correctly, you can rename them if you have conflicting names
; Default Hotkey is Alt+Ctrl+S
; No Pop-up is present on switching of audio
#Persistent
#SingleInstance force

Device1_Name := "HS80 Headset"    ; Your headset's exact name
Device2_Name := "AE-5 Speakers"   ; Your speakers' exact name
NirCmdFullPath := "C:\Windows\nircmd.exe" ; Full path to nircmd.exe

global toggleState := false

; Check if nircmd.exe exists at the specified path
If !FileExist(NirCmdFullPath)
{
    MsgBox, 48, Error, Nircmd.exe not found at %NirCmdFullPath%.`nPlease ensure it is installed there.`nScript will now exit.
    ExitApp
}
Return

^!S:: ; << Define hotkey here
    global toggleState
    toggleState := !toggleState
    targetDevice := toggleState ? Device2_Name : Device1_Name

    ; Run nircmd using the full path, hiding the command window
    Run %NirCmdFullPath% setdefaultsounddevice "%targetDevice%" 1,, Hide
    Run %NirCmdFullPath% setdefaultsounddevice "%targetDevice%" 2,, Hide
Return