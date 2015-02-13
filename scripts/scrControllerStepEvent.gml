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

if keyboard_check_direct(vk_escape) then game_end()
