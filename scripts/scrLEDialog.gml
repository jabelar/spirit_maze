/// scrLEDialog()

var message_id = ds_map_find_value(async_load, "id");
if message_id == global.name_input_id
{
    show_debug_message("scrLEDialog received level editor name change")
    
    if ds_map_find_value(async_load, "status")
    {
       if ds_map_find_value(async_load, "result") != ""
       {
          global.level_name = string_upper(ds_map_find_value(async_load, "result"))
       }
    }
    global.waiting_for_name = false
}
