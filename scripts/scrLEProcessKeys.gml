/// scrLEProcessKeys

if keyboard_check_pressed(ord('R')) then scrLESwitchLayer()
if keyboard_check_pressed(ord('S')) then scrLESaveLevel() 
if keyboard_check_pressed(ord('L')) then scrLELevelList() 
if keyboard_check_pressed(ord('C')) then scrLEClear()
if keyboard_check_pressed(ord('Z')) then scrLEUndo()
if keyboard_check_pressed(ord('Y')) then scrLERedo()
if keyboard_check_pressed(ord('N')) then scrLESetLevelName()