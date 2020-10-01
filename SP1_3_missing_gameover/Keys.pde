class Keys
{
  //Player1
  private boolean wDown = false;
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;

  // player 2
  private boolean UpDown = false;
  private boolean LeftDown = false;
  private boolean DownDown = false;
  private boolean RightDown = false;

  public Keys() {
  }
  // Player 1
  public boolean wDown()
  {
    return wDown;
  }

  public boolean aDown()
  {
    return aDown;
  }

  public boolean sDown()
  {
    return sDown;
  }

  public boolean dDown()
  {
    return dDown;
  }

  // Player 2
  public boolean UpDown()
  {
    return UpDown;
  }

  public boolean LeftDown()
  {
    return LeftDown;
  }

  public boolean DownDown()
  {
    return DownDown;
  }

  public boolean RightDown()
  {
    return RightDown;
  }

  //Player1
  void onKeyPressed(char ch)
  {

    if (ch == 'W' || ch == 'w')
    {
      wDown = true;
    } else if (ch == 'A' || ch == 'a')
    {
      aDown = true;
    } else if (ch == 'S' || ch == 's')
    {
      sDown = true;
    } else if (ch == 'D' || ch == 'd')
    {
      dDown = true;
    } else {
      if (key == CODED) {
        if (keyCode == UP) {
          UpDown = true;
        } else if (keyCode == LEFT) {
          LeftDown = true;
        } else if ( keyCode == DOWN) {
          DownDown= true;
        } else if ( keyCode == RIGHT) {
          RightDown = true;
        }
      }
    }
  }

  //Player1
  void onKeyReleased(char ch)
  {
    if (ch == 'W' || ch == 'w')
    {
      wDown = false;
    } else if (ch == 'A' || ch == 'a')
    {
      aDown = false;
    } else if (ch == 'S' || ch == 's')
    {
      sDown = false;
    } else if (ch == 'D' || ch == 'd')
    {
      dDown = false;
    } else {
      if (key == CODED) {
        if (keyCode == UP) {
          UpDown = false;
        } else if (keyCode == LEFT) {
          LeftDown = false;
        } else if ( keyCode == DOWN) {
          DownDown= false;
        } else if ( keyCode == RIGHT) {
          RightDown = false;
        }
      }
    }
  }
}
