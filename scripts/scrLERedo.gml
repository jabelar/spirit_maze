/// scrLERedo()

show_debug_message("scrLERedo with stack size = "+string(ds_stack_size(redo_stack)))

if not ds_stack_empty(redo_stack)
{
    show_debug_message("Redo stack has actions")
    
    var inst_id = ds_stack_pop(redo_stack)
    var action_type = ds_stack_pop(redo_stack)
    
    ds_stack_push(undo_stack, action_type, inst_id)
    
    switch action_type
    {
        case 1: // re-create
        {
            show_debug_message("Recreating object with id = "+string(inst_id))
            instance_activate_object(inst_id)
            // switch view to where the undo action occured
            if inst_id.x > room_width/2
            {
                view_xview[0] = room_width/2
            }
            else
            {
                view_xview[0] = 0
            }
            break;
        }
        case -1: // delete
        {
            show_debug_message("Deleting object with id = "+string(inst_id))
            instance_deactivate_object(inst_id)
            // switch view to where the undo action occured
            if inst_id.x > room_width/2
            {
                view_xview[0] = room_width/2
            }
            else
            {
                view_xview[0] = 0
            }
            break;
        }
    }
}
else
{
    show_debug_message("Nothing in stack to undo")
}
