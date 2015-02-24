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
    if global.waiting_for_name
    {
        if keyboard_check_pressed(vk_enter)
        {
            global.level_name = string_upper(keyboard_string)
            global.waiting_for_name = false
            global.dialog_open = false
        }
    }
    if global.display_level_list
    {
        if keyboard_check_pressed(vk_enter)
        {
            global.level_name = ds_list_find_value(global.level_list, global.item_num)
            global.display_level_list = false
            scrLELoadLevel()
            global.dialog_open = false
        }
        if keyboard_check_pressed(vk_delete)
        {
            ds_list_delete(global.level_list, global.item_num)
            ini_open("Level.ini")
            ini_write_string("Level List", "0", ds_list_write(global.level_list))
            ini_close()
        }
    }
}
