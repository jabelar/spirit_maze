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


if global.notification_timer >= 0 then global.notification_timer--

if keyboard_check_pressed(vk_escape)
{
    // exit any dialog if open
    if global.dialog_open 
    {
        global.dialog_open = false
        global.waiting_for_name = false
        global.display_level_list = false
        global.waiting_for_save_confirm = false
        global.waiting_for_load_confirm = false
    }
    else // exit game
    {
        game_end()
    }
}
