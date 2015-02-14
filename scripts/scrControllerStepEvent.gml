// show_debug_message("Starting step event")

switch room
{
    case roomMainMenu: scrStepRoomMainMenu(); break;
    case roomPlay: scrStepRoomPlay(); scrCheckBroadcastAlarm(); break;
    case roomLevelEditor: scrStepRoomLevelEditor(); break;
    case roomFriends: scrStepRoomFriends(); break;
    case roomSettings: scrStepRoomSettings(); break;
    case roomRace: scrStepRoomRace(); scrCheckBroadcastAlarm(); break;
    case roomGame: scrStepGame(); scrCheckBroadcastAlarm(); break;
}

if keyboard_check_pressed(vk_escape)
{
    if global.dialog_open 
    {
        global.dialog_open = false
        objLECursor.waiting_for_name = false
        objLECursor.display_level_list = false
        objLECursor.waiting_for_save_confirm = false
        objLECursor.waiting_for_load_confirm = false
    }
    else
    {
        game_end()
    }
}
