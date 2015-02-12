/// scrStepRoomRace

// check if all players have joined and start game
if global.wait_for_full_lobby
{
    if scrGetNumPlayers() >= global.max_num_players
    {
                if room != room0 then room_goto(room0)
    }
}
else
{
    if scrGetNumPlayers() >= global.min_num_players
    {
                if room != room0 then room_goto(room0)
    }
}

