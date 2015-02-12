/// scrLEUndo()

show_debug_message("scrLEUndo with stack size = "+string(ds_stack_size(undo_stack)))

if not ds_stack_empty(undo_stack)
{
    show_debug_message("Undo stack has actions")
    
    var action_type = ds_stack_pop(undo_stack)
    var object_type = ds_stack_pop(undo_stack)
    var inst_x = ds_stack_pop(undo_stack)
    var inst_y = ds_stack_pop(undo_stack)
    switch action_type
    {
        case -1: // deleted so re-create
        {
            break;
        }
        case 1: // added so delete
        {
            var inst_id = instance_position(inst_x, inst_y, object_type)
            with inst_id
            {
                instance_destroy()
            }
            break;
        }
    }
}
else
{
    show_debug_message("Nothing in stack to undo")
}
