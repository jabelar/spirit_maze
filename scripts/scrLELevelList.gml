/// scrLELevelList()

ini_open("Level.ini")
ds_list_read(level_list, ini_read_string("Level List", "0", ""))
ini_close()

show_debug_message("Level list has size = "+string(ds_list_size(level_list)))

display_level_list = true
