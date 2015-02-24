/// scrLELevelList()

global.dialog_open = true

ini_open("Level.ini")
ds_list_read(global.level_list, ini_read_string("Level List", "0", ""))
ini_close()

show_debug_message("Level list has size = "+string(ds_list_size(global.level_list)))

global.display_level_list = true
global.item_num = 0
