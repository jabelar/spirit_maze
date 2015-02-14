/// scrLECursorDrawEvent()

if sprite_index > 0 then draw_self()

var center_view_x = view_xview[0]+room_width/4 ;
var center_view_y = view_yview[0]+room_height/2 ;

// show dialog
if waiting_for_name
{    
    draw_set_color(c_black)
    draw_rectangle(center_view_x - 1200, center_view_y - 250, center_view_x + 1200, center_view_y + 250, false)
    draw_set_color(c_gray)
    draw_rectangle(center_view_x - 1170, center_view_y, center_view_x + 1170, center_view_y + 220, false)
    draw_set_color(c_white)
    draw_text(center_view_x, center_view_y-200, "ENTER LEVEL NAME")
    draw_set_color(c_yellow)
    if string_length(keyboard_string) > 20
    {
        keyboard_string = string_copy(keyboard_string, 0, 20)
    }
    keyboard_string = string_upper(keyboard_string)
    draw_text(center_view_x, center_view_y, (keyboard_string))
}

if display_level_list
{
    draw_set_color(c_black)
    draw_rectangle(center_view_x - 1200, center_view_y - 1150, center_view_x + 1200, center_view_y + 1150, false)
    draw_set_color(c_gray)
    draw_rectangle(center_view_x - 1170, center_view_y - 920, center_view_x + 1170, center_view_y + 1120, false)

    var list_size = ds_list_size(level_list)
    if list_size > 0
    {
        draw_set_color(c_white)
        draw_set_halign(fa_left)
        draw_text(center_view_x-1170, center_view_y-1120, "Load Level")
        for (var i=0; i<list_size; i++)
        {
            draw_set_color(c_yellow)
            draw_text(center_view_x-1140, center_view_y-1100+200*(i+1), ds_list_find_value(level_list, i))
        }
    }
}
