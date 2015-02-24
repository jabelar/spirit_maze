/// scrInitializeDialogs()

global.dialog_open = false

global.level_name = "NEW LEVEL"
global.waiting_for_name = false
global.name_input_id = -1

global.waiting_for_save_confirm = false
global.waiting_for_load_confirm = false

global.level_list = ds_list_create()
global.level_queue = ds_queue_create()
global.display_level_list = false
global.item_num = 0

global.notification_string = ""
global.notification_timer = -1
