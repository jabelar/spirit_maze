/// scrKeypressC()

var layer = view_xview[view_current]/view_wview[view_current]
var tiles_w = view_wview[view_current] div 256
var tiles_h = view_hview[view_current] div 256
var inst_id = -1

if layer == 0
{
    // clear current layer
    for (var i=0; i<tiles_w; i++)
    {
        // start at 1 so don't copy the menu (although that wouldn't hurt)
        for (var j=1; j<tiles_h; j++)
        {
            inst_id = instance_position(i*256, j*256, objLEParent)
            if inst_id > 0
            {
                ds_stack_push(undo_stack, -1, inst_id)
                instance_deactivate_object(inst_id)
            }
        }
    }
}
