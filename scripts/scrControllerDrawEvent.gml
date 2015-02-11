switch room
{
    case roomMainMenu: scrDrawMainMenu(); break;
    case roomPlay: scrDrawPlay(); break;
    case roomLevelEditor: scrDrawLevelEditor(); break;
    case roomRace: scrDrawServerStatus(); break;
    case roomGame: scrDrawHUD(); break;
    case roomFriends: scrDrawFriends(); break;
    case roomSettings: scrDrawSettings(); break;
}
