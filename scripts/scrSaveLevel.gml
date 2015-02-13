/// scrSaveLevel()

var level_queue = ds_queue_create()

with objLEParent
{
    ds_queue_enqueue(level_queue, object_index, x, y)
}

ini_open("Level.ini");
ini_write_string("Level", "0", ds_queue_write(level_queue))
ini_close();

show_debug_message("Saving level")

ds_queue_destroy(level_queue)
