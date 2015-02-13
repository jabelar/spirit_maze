/// scrLEUndo()

show_debug_message("scrLEUndo with stack size = "+string(ds_stack_size(undo_stack)))

if not ds_stack_empty(undo_stack)
{
    show_debug_message("Undo stack has actions")
    
    var inst_id = ds_stack_pop(undo_stack)
    var action_type = ds_stack_pop(undo_stack)
    switch action_type
    {
        case -1: // deleted so re-create
        {
            show_debug_message("Recreating object with id = "+string(inst_id))
            instance_activate_object(inst_id)
            break;
        }
        case 1: // added so delete
        {
            show_debug_message("Deleting object with id = "+string(inst_id))
            instance_deactivate_object(inst_id)
            break;
        }
    }
}
else
{
    show_debug_message("Nothing in stack to undo")
}
