; This script requires Nircmd, which can be found easily online
; Download and run nircmd as admin to install nircmd to windows dir
; Besure to set your devices correctly, you can rename them if you have conflicting names
; Default Hotkey is Alt+Ctrl+S 
; No Pop-up is present on switching of audio
#Persistent
#SingleInstance force

Device1_Name := "HS80 Headset"    ; Your headset's exact name
Device2_Name := "AE-5 Speakers"  ; Your speakers' exact name
global toggleState := false

If !FileExist("nircmd.exe")
    ExitApp
Return 

^!S:: ; << Define hotkey here
    global toggleState
    toggleState := !toggleState
    targetDevice := toggleState ? Device2_Name : Device1_Name
    Run, nircmd.exe setdefaultsounddevice "%targetDevice%" 1,, Hide
    Run, nircmd.exe setdefaultsounddevice "%targetDevice%" 2,, Hide
Return