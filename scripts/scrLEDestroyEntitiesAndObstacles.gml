/// scrLEDestroyEntitiesAndObstacles()
var inst_id = instance_position(x, y, objLEParentEntity)
if inst_id > 0
{
    with inst_id
    {
        instance_destroy()
    }
}
inst_id = instance_position(x, y, objLEParentObstacle)
if inst_id > 0
{
    with inst_id
    {
        instance_destroy()
    }
}
