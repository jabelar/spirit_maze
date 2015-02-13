/// scrDrawLevelEditor()

// draw menu bar
draw_set_color(c_black)
draw_set_valign(fa_top)draw_rectangle(0, 0, room_width, 256, false)

// draw grid
draw_set_color(c_black)
for(var i=1; i<(room_width div 256); i++)
{
    draw_line_width(i*256, 0, i*256, room_height, 6)
}
for(var i=1; i<(room_height div 256); i++)
{
    draw_line_width(0, i*256, room_width, i*256, 6)
}

draw_set_font(font1)
draw_set_color(c_yellow)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
var layer = view_xview[view_current]/view_wview[view_current]+1
draw_text(view_xview[view_current]+view_wview[view_current]/2, 10, objLECursor.level_name+", LAYER "+string(layer))

