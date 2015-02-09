/// scrStepLECursor()

x = (mouse_x div 256) * 256
y = (mouse_y div 256) * 256
if mouse_check_button_pressed(mb_left)
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
                scrLEDestroyEntitiesAndObstacles()
                // can only have one player object per level
                with objLEPlayer
                {
                    instance_destroy()
                }
                instance_create(x, y, objLEPlayer)
                break;
            }
            case sprBlockStone0:
            {
                scrLEDestroyObstaclesAndBackground()
                scrLEDestroyEntitiesAndObstacles()
                instance_create(x, y, objLEBlockStone0)
                break;
            }
            case sprBlockStone1:
            {
                scrLEDestroyObstaclesAndBackground()
                instance_create(x, y, objLEBlockStone1)
                break;
            }
            case sprWindow0:
            {
                scrLEDestroyObstaclesAndBackground()
                instance_create(x, y, objLEWindow0)
                break;
            }
            case sprEnemy0:
            {
                scrLEDestroyEntitiesAndObstacles() 
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
                    instance_destroy()
                }
            }
        }
    }
}
