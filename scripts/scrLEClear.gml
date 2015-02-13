/// scrLEClear()

with objLEParent
{
    ds_stack_push(other.undo_stack, -1, id)
    instance_deactivate_object(id)
}
