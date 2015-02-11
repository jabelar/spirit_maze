/// scrKeypressC()

switch room
{
    case roomLevelEditor:
    {
        if view_xview[0] == 0
        {
            view_xview[0] = 11520
        }
        else
        {
            view_xview[0] = 0
        }
        break;
    }
    default:
    {
        // do nothing
        break;
    }
}
