/// scrLoadLevel()

var level_queue = ds_queue_create()

ini_open("Level.ini")
var ini_string = ini_read_string(level_name, "0", "")
ini_close()

if ini_string == ""
{
    show_debug_message("Nothing to load")
}
else
{
    show_debug_message("Loading level")
    ds_queue_read(level_queue, ini_string)
    
    var queue_size = ds_queue_size(level_queue)
    var obj_id = -1
    var obj_x = 0
    var obj_y = 0
    
    scrLEClear()
    if queue_size > 0
    {
        show_debug_message("Level queue size = "+string(queue_size))
        
        for (var i=1; i < queue_size; i++)
        {
            obj_id = ds_queue_dequeue(level_queue)
            i++
            obj_x = ds_queue_dequeue(level_queue)
            i++
            obj_y = ds_queue_dequeue(level_queue)
            show_debug_message("Creating object "+string(obj_id)+" at x = "+string(obj_x)+" and y = "+string(obj_y))
            instance_create(obj_x, obj_y, obj_id)
        }       
    }
}  

// don't forget to clear undo stack and destroy load queue
ds_stack_clear(undo_stack)
ds_queue_destroy(level_queue)
