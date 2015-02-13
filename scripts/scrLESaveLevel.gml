/// scrSaveLevel()

var level_queue = ds_queue_create()
var level_list = ds_list_create()

with objLEParent
{
    ds_queue_enqueue(level_queue, object_index, x, y)
}

ini_open("Level.ini")
ds_list_read(level_list, ini_read_string("Level List", "0", ""))
ds_list_add(level_list, level_name)
ini_write_string("Level List", "0", ds_list_write(level_list))
ini_write_string(level_name, "0", ds_queue_write(level_queue))
ini_close()

show_debug_message("Saving level")

ds_queue_destroy(level_queue)
