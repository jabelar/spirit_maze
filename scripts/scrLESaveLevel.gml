/// scrSaveLevel()

level_queue = ds_queue_create()

// add all active instances to the queue
with objLEParent
{
    ds_queue_enqueue(other.level_queue, object_index, x, y)
}

ini_open("Level.ini")
// update level list if needed
ds_list_read(level_list, ini_read_string("Level List", "0", ""))
if ds_list_find_index(level_list, level_name) < 0 // not already in list
{
    ds_list_add(level_list, level_name)
    ini_write_string("Level List", "0", ds_list_write(level_list))
    // update level
    ini_write_string(level_name, "0", ds_queue_write(level_queue))
    ini_close()
    
    show_debug_message("Saving level")
    ds_queue_destroy(level_queue)
    // show notification that save happened
    notification_string = "Saving..."
    notification_timer = room_speed * 3
}
else
{
    global.dialog_open = true
    waiting_for_save_confirm = true
    ini_close()
}

