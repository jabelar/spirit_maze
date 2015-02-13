/// scrLECursorDrawEvent()

if sprite_index > 0 then draw_self()

// show dialog
if waiting_for_name
{
    var center_view_x = view_xview[0]+room_width/4 ;
    var center_view_y = view_yview[0]+room_height/2 ;
    
    draw_set_color(c_black)
    draw_rectangle(center_view_x - 1000, center_view_y - 200, center_view_x + 1000, center_view_y + 200, false)
    draw_set_color(c_white)
    draw_text(center_view_x, center_view_y-200, "ENTER LEVEL NAME")
    draw_set_color(c_yellow)
    draw_text(center_view_x, center_view_y, string_upper(keyboard_string))
}
