/// scrDrawLevelEditor()

draw_set_font(font0)
draw_set_color(c_black)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
// draw grid
for(var i=1; i<(room_width div 256); i++)
{
    draw_line_width(i*256, 0, i*256, room_height, 3)
}
for(var i=1; i<(room_height div 256); i++)
{
    draw_line_width(0, i*256, room_width, i*256, 3)
}
