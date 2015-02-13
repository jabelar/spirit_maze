/// scrLECursorCreate()

image_alpha = 0.5

undo_stack = ds_stack_create()
redo_stack = ds_stack_create()

level_name = "New Level"
waiting_for_name = false // used to process async dialog event
name_input_id = -1

level_list = ds_list_create()
display_level_list = false
