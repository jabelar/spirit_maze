/// scrStepRoomMainMenu()

if mouse_check_button(mb_left)
{
    room_goto(roomLevelEditor)
}

if keyboard_check_pressed(ord('P'))
{
    room_goto(roomPlay)
}
