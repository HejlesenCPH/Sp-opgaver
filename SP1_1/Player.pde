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
      if(this.life < 100)  {
        this.life = life + x;
      }
    
  }

  public void subtractLife(int x) {
    if(this.life > 0) {
      
    this.life = life - x;
     }
  }
  public void updatePlayer(Keys keys)
  {
    if(life > 0) {
      updateMovement(keys); 
    }
  }
  
  private void updateMovement(Keys keys) {

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


    //Update player
  }
}
