/// scrLECursorCreate()

image_alpha = 0.5

undo_stack = ds_stack_create()
redo_stack = ds_stack_create()

level_name = "NEW LEVEL"
waiting_for_name = false
name_input_id = -1

waiting_for_save_confirm = false
waiting_for_load_confirm = false

level_list = ds_list_create()
display_level_list = false
item_num = 0

notification_string = ""
notification_timer = -1
