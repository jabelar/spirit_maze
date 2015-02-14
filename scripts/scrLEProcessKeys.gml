/// scrLEProcessKeys

if not global.dialog_open
{
    if keyboard_check_pressed(ord('R')) then scrLESwitchLayer()
    if keyboard_check_pressed(ord('S')) then scrLESaveLevel() 
    if keyboard_check_pressed(ord('L')) then scrLELevelList() 
    if keyboard_check_pressed(ord('C')) then scrLEClear()
    if keyboard_check_pressed(ord('Z')) then scrLEUndo()
    if keyboard_check_pressed(ord('Y')) then scrLERedo()
    if keyboard_check_pressed(ord('N')) then scrLESetLevelName()
}
else // dialog is open
{
    if waiting_for_name
    {
        if keyboard_check_pressed(vk_enter)
        {
            level_name = string_upper(keyboard_string)
            waiting_for_name = false
            global.dialog_open = false
        }
    }
    if display_level_list
    {
        if keyboard_check_pressed(vk_enter)
        {
            level_name = ds_list_find_value(level_list, item_num)
            display_level_list = false
            scrLELoadLevel()
            global.dialog_open = false
        }
    }
}
