/// scrLEDestroyObstaclesAndBackground()
var inst_id = instance_position(x, y, objLEParentObstacle) 
if inst_id > 0
{
        ds_stack_push(undo_stack, -1, inst_id)
        instance_deactivate_object(inst_id)
}
inst_id = instance_position(x, y, objLEParentBackground) 
if inst_id > 0
{
        ds_stack_push(undo_stack, -1, inst_id)
        instance_deactivate_object(inst_id)
}

