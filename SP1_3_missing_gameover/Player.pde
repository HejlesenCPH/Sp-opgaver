class Player {

  private Dot dot;
  private int life;
  private boolean playerOne;

  public Player(int life, Dot dot, boolean playerOne) {
    this.life = life;
    this.dot = dot;
    this.playerOne = playerOne;
  }

 public Dot getDot()
 {
   return dot;
   
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
  public void updatePlayer(Keys keys)
  {
    if (life > 0) {
      if (playerOne){
        updateMovementP1(keys);
      } else {
        updateMovementP2(keys);
      }
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


    if (keys.UpDown() && !keys.DownDown())
    {
      dot.moveUp();
    }
    if (keys.LeftDown() && !keys.RightDown())
    {
      dot.moveLeft();
    }
    if (keys.DownDown() && !keys.UpDown())
    {
      dot.moveDown();
    }
    if (keys.RightDown() && !keys.LeftDown())
    {
      dot.moveRight();
    }
  }
}
