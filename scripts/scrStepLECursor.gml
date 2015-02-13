/// scrStepLECursor()

if waiting_for_name
{
    if keyboard_check_pressed(vk_enter)
    {
        level_name = string_upper(keyboard_string)
        waiting_for_name = false
    }
}
else
{
    scrLEProcessKeys()
    
    x = (mouse_x div 256) * 256
    y = (mouse_y div 256) * 256
    
    var inst_id = -1 ;
    
    if mouse_check_button_pressed(mb_left) and sprite_index == sprPlayer and y >= 256
    {
        scrLEDestroyEntitiesAndObstacles()
        // can only have one player object per level
        with objLEPlayer
        {
            ds_stack_push(other.undo_stack, -1, id)
            instance_deactivate_object(id)
        }
        inst_id = instance_create(x, y, objLEPlayer) ;
        ds_stack_push(undo_stack, 1, inst_id)
    }
    if mouse_check_button(mb_left)
    {
        inst_id = instance_position(x, y, objLEParentMenu) ;
        if inst_id > 0 // pick up sprite from menu
        {
            sprite_index = inst_id.sprite_index
        }
        else
        {
            if y >=256 // don't place in top menu bar
            {
                switch sprite_index
                {
                    case sprPlayer: 
                    {
                        break;
                    }
                    case sprBlockStone0:
                    {
                        inst_id = instance_position(x, y, objLEBlockStone0)
                        if inst_id < 0 // none already placed there
                        {
                            scrLEDestroyObstaclesAndBackground()
                            scrLEDestroyEntitiesAndObstacles()
                            inst_id = instance_create(x, y, objLEBlockStone0)
                            ds_stack_push(undo_stack, 1, inst_id)
                        }
                        break;
                    }
                    case sprBlockStone1:
                    {
                        inst_id = instance_position(x, y, objLEBlockStone1)
                        if inst_id < 0 // none already placed there
                        {
                            scrLEDestroyObstaclesAndBackground()
                            inst_id = instance_create(x, y, objLEBlockStone1)
                            ds_stack_push(undo_stack, 1, inst_id)
                        }
                        break;
                    }
                    case sprWindow0:
                    {
                        inst_id = instance_position(x, y, objLEWindow0)
                        if inst_id < 0 // none already placed there
                        {
                            scrLEDestroyObstaclesAndBackground()
                            inst_id = instance_create(x, y, objLEWindow0)
                            ds_stack_push(undo_stack, 1, inst_id)
                        }
                        break;
                    }
                    case sprEnemy0:
                    {
                        inst_id = instance_position(x, y, objLEEnemy0)
                        if inst_id < 0 // none already placed there
                        {
                            scrLEDestroyEntitiesAndObstacles() 
                            inst_id = instance_create(x, y, objLEEnemy0)
                            ds_stack_push(undo_stack, 1, inst_id)
                        }
                        break;
                    }
                }
            }
        }
    }
    if mouse_check_button_pressed(mb_right)
    {
        inst_id = instance_position(x, y, objLEParentEntity)
        if inst_id > 0
        {
            ds_stack_push(undo_stack, -1, inst_id)
            instance_deactivate_object(inst_id)
        }
        else
        {
            inst_id = instance_position(x, y, objLEParentObstacle)
            if inst_id > 0
            {
                ds_stack_push(undo_stack, -1, inst_id)
                instance_deactivate_object(inst_id)
            }
            else
            {
                inst_id = instance_position(x, y, objLEParentBackground)
                if inst_id > 0
                {
                    ds_stack_push(undo_stack, -1, inst_id)
                    instance_deactivate_object(inst_id)
                }
            }
        }
    }
}
