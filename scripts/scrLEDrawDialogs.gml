/// scrLEDrawDialogs()

if sprite_index > 0 then draw_self()

var center_view_x = view_xview[0]+room_width/4 ;
var center_view_y = view_yview[0]+room_height/2 ;

// show dialog
if global.waiting_for_name
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

if global.display_level_list
{
    draw_set_color(c_black)
    draw_rectangle(center_view_x - 1200, center_view_y - 1150, center_view_x + 1200, center_view_y + 1150, false)
    draw_set_color(c_gray)
    draw_rectangle(center_view_x - 1170, center_view_y - 920, center_view_x + 1170, center_view_y + 1120, false)

    var list_size = ds_list_size(global.level_list) ;
    var display_value = "" ;
    
    if list_size > 0
    {
        if keyboard_check_pressed(vk_down)
        {
            global.item_num++
            if global.item_num > list_size then global.item_num = list_size
        }
        if keyboard_check_pressed(vk_up)
        {
            global.item_num--
            if global.item_num < 0 then global.item_num = 0
        }
        
        draw_set_color(c_white)
        draw_set_halign(fa_left)
        draw_text(center_view_x-1170, center_view_y-1120, "Load Level")
        for (var i=0; i<10; i++)
        {
            if i==0 then draw_set_color(c_lime) else draw_set_color(c_yellow)
            display_value = ds_list_find_value(global.level_list, global.item_num+i)
            if not is_undefined(display_value)
            {
                draw_text(center_view_x-1140, center_view_y-1100+200*(i+1), display_value)
            }
        }
    }
}

if global.waiting_for_save_confirm
{
    draw_set_color(c_black)
    draw_rectangle(center_view_x - 1500, center_view_y, center_view_x + 1500, center_view_y + 200, false)
    draw_set_color(c_yellow)
    draw_set_halign(fa_center)
    draw_text(center_view_x, center_view_y, "File with this name exists.  Overwrite?")
    if keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord('Y'))
    {
        ini_open("Level.ini")
        ini_write_string("Level List", "0", ds_list_write(global.level_list))
        // update level
        ini_write_string(global.level_name, "0", ds_queue_write(global.level_queue))
        ini_close()
        
        show_debug_message("Saving level")
        
        ds_queue_destroy(global.level_queue)
        global.waiting_for_save_confirm = false
        global.dialog_open = false
        
        // show notification that save happened
        global.notification_string = "Saving..."
        global.notification_timer = room_speed * 3
    }
    if keyboard_check_pressed(ord('N'))
    {
        ds_queue_destroy(level_queue)
        global.waiting_for_save_confirm = false
        global.dialog_open = false
        // show notification that save canceled
        global.notification_string = "Save canceled"
        global.notification_timer = room_speed * 3
    }
}

// show notifications
if global.notification_timer >= 0
{
    var notification_width = string_width(global.notification_string)+60
    draw_set_color(c_black)
    draw_rectangle(center_view_x - notification_width/2, center_view_y+1200, center_view_x + notification_width/2, center_view_y + 1400, false)
    draw_set_color(c_silver)
    draw_set_halign(fa_center)
    draw_text(center_view_x, center_view_y+1200, global.notification_string)
}
