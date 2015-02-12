/// scrCheckBroadcastAlarm()

// check if it is time to send out a server broadcast
global.broadcast_alarm--
if global.broadcast_alarm < 0
{
    scrSendServerBroadcast()
    global.broadcast_alarm = room_speed * 3
}