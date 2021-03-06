//main input tab, used to generate easier to use inputs
//dont forget to call the mouse function on the processing draw

boolean keyA, keyB, keyC, keyD, keyE, keyF, keyG, keyH, keyI,
        keyJ, keyK, keyL, keyM, keyN, keyO, keyP, keyQ, keyR, 
        keyS, keyT, keyU, keyV, keyW, keyX, keyY, keyZ, 
        keyUp, keyDown, keyLeft, keyRight, 
        key1, key2, key3, key4, key5, key6, key7, key8, key9, key0;
        
        
boolean mouseLeft, mouseRight, mouseCenter;

PVector mouse;

void Mouse()
{
  mouse = new PVector(width/2 - mouseX, height/2 - mouseY);
}

void keyPressed()
{
  Key(keyCode, true);
}

void keyReleased()
{
  Key(keyCode, false);
}

void mousePressed()
{
  Mouse(mouseButton, true);
}

void mouseReleased()
{
  Mouse(mouseButton, false);
}

public boolean Mouse(final int m, final boolean b)
{
  switch(m)
  {
  case LEFT: 
    return mouseLeft = b;
  case RIGHT: 
    return mouseRight = b;
  case CENTER: 
    return mouseCenter = b;
  }
  return b;
}

public boolean Key(final int k, final boolean b) 
{
  switch(k)
  {
  case 'A':
    return keyA = b;
  case 'B':
    return keyB = b;
  case 'C':
    return keyC = b;
  case 'D':
    return keyD = b;
  case 'E':
    return keyE = b;
  case 'F':
    return keyF = b;
  case 'G':
    return keyG = b;
  case 'H':
    return keyH = b;
  case 'I':
    return keyI = b;
  case 'J':
    return keyJ = b;
  case 'K':
    return keyK = b;
  case 'L':
    return keyL = b;
  case 'M':
    return keyM = b;
  case 'N':
    return keyN = b;
  case 'O':
    return keyO = b;
  case 'P':
    return keyP = b;
  case 'Q':             
    return keyQ = b;
  case 'R':
    return keyR = b;
  case 'S':
    return keyS = b;
  case 'T':
    return keyT = b;
  case 'U':
    return keyU = b;
  case 'V':
    return keyV = b;
  case 'W':
    return keyW = b;
  case 'X':
    return keyX = b;
  case 'Y':
    return keyY = b;   
  case 'Z':
    return keyZ = b;
  case UP:
    return keyUp = b;
  case DOWN:
    return keyDown = b;
  case LEFT:
    return keyLeft = b;
  case RIGHT:
    return keyRight = b;
  case '1':
    return key1 = b;
  case '2':
    return key2 = b;
  case '3':
    return key3 = b;
  case '4':
    return key4 = b;
  case '5':
    return key5 = b;
  case '6':
    return key6 = b;
  case '7':
    return key7 = b;
  case '8':
    return key8 = b;
  case '9':
    return key9 = b;
  case '0':
    return key0 = b;
  }
  return b;
} 
