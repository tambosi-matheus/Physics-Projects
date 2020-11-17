void keyPressed() 
{
  setMove(keyCode, true);
}
 
void keyReleased() 
{
  setMove(keyCode, false);
}

boolean setMove(final int k, final boolean b) 
  {
      switch (k) {
      case +'W':
      case UP:
        return isUp = b;
   
      case +'S':
      case DOWN:
        return isDown = b;
   
      case +'A':
      case LEFT:
        return isLeft = b;
   
      case +'D':
      case RIGHT:
        return isRight = b;
   
      default:
        return b;
      }
    }
