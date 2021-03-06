class Player {

  private Dot dot;
  private int life;

  public Player(int life, Dot dot) {
    this.life = life;
    this.dot = dot;
  }


  public int getX() {
    return dot.x;
  }

  public int getY() {
    return dot.y;
  }

  public int getLife() {
    return life;
  }
  public void addLife(int x) {
    if (this.life < 100) {
      this.life = life + x;
    }
  }

  public void subtractLife(int x) {
    if (this.life > 0) {

      this.life = life - x;
    }
  }
  public void updatePlayer1(Keys keys)
  {
    if (life > 0) {
      updateMovementP1(keys);
    }
  }
  public void updatePlayer2(Keys keys)
  {
    if (life > 0) {
      updateMovementP2(keys);
    }
  }

  private void updateMovementP1(Keys keys) {

    if (keys.wDown() && !keys.sDown())
    {
      dot.moveUp();
    }
    if (keys.aDown() && !keys.dDown())
    {
      dot.moveLeft();
    }
    if (keys.sDown() && !keys.wDown())
    {
      dot.moveDown();
    }
    if (keys.dDown() && !keys.aDown())
    {
      dot.moveRight();
    }
  }

  private void updateMovementP2(Keys keys) {

    if (keys.UpDown() && !keys.UpDown())
    {
      dot.moveUp();
    }
    if (keys.LeftDown() && !keys.LeftDown())
    {
      dot.moveLeft();
    }
    if (keys.DownDown() && !keys.DownDown())
    {
      dot.moveDown();
    }
    if (keys.RightDown() && !keys.RightDown())
    {
      dot.moveRight();
    }
  }
}
