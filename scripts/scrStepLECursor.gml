/// scrStepLECursor()

x = (mouse_x div 256) * 256
y = (mouse_y div 256) * 256
if mouse_check_button_pressed(mb_left) and sprite_index == sprPlayer
{
    scrLEDestroyEntitiesAndObstacles()
    // can only have one player object per level
    with objLEPlayer
    {
        ds_stack_push(other.undo_stack, -1, object_index, x, y)
        instance_destroy()
    }
    ds_stack_push(undo_stack, 1, objLEPlayer, x, y)
    instance_create(x, y, objLEPlayer)
}
if mouse_check_button(mb_left)
{
    var inst_id = instance_position(x, y, objLEParentMenu) ;
    if inst_id > 0 // pick up sprite from menu
    {
        sprite_index = inst_id.sprite_index
    }
    else
    {
        switch sprite_index
        {
            case sprPlayer: 
            {
                break;
            }
            case sprBlockStone0:
            {
                scrLEDestroyObstaclesAndBackground()
                scrLEDestroyEntitiesAndObstacles()
                ds_stack_push(undo_stack, 1, objLEBlockStone0, x, y)
                instance_create(x, y, objLEBlockStone0)
                break;
            }
            case sprBlockStone1:
            {
                scrLEDestroyObstaclesAndBackground()
                ds_stack_push(undo_stack, 1, objLEBlockStone1, x, y)
                instance_create(x, y, objLEBlockStone1)
                break;
            }
            case sprWindow0:
            {
                scrLEDestroyObstaclesAndBackground()
                ds_stack_push(undo_stack, 1, objLEWindow0, x, y)
                instance_create(x, y, objLEWindow0)
                break;
            }
            case sprEnemy0:
            {
                scrLEDestroyEntitiesAndObstacles() 
                ds_stack_push(undo_stack, 1, objLEEnemy0, x, y)
                instance_create(x, y, objLEEnemy0)
                break;
            }
        }
    }
}
if mouse_check_button_pressed(mb_right)
{
    var inst_id = instance_position(x, y, objLEParentEntity)
    if inst_id > 0
    {
        with inst_id
        {
            ds_stack_push(other.undo_stack, -1, object_index, x, y)
            instance_destroy()
        }
    }
    else
    {
        inst_id = instance_position(x, y, objLEParentObstacle)
        if inst_id > 0
        {
            with inst_id
            {
                ds_stack_push(other.undo_stack, -1, object_index, x, y)
                instance_destroy()
            }
        }
        else
        {
            inst_id = instance_position(x, y, objLEParentBackground)
            if inst_id > 0
            {
                with inst_id
                {
                    ds_stack_push(other.undo_stack, -1, object_index, x, y)
                    instance_destroy()
                }
            }
        }
    }
}
