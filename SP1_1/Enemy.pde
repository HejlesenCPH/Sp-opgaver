class Enemy {

  private Dot dot; 



  public Enemy(Dot _dot) {

    this.dot = _dot;
  }

  public int getX() {
    return dot.x;
  }
  public int getY() {

    return dot.y;
  }


  public boolean isColliding(Player player) {

    if (getX() == player.getX() && getY() == player.getY())
    {
      //We have a collision
      return true;
    }
    return false;
  }

  public void updateEnemy(Random rnd, Player player) {
    moveEnemy(rnd, player);  
  }

  private void moveEnemy(Random rnd, Player player) {
    if (rnd.nextInt(3) < 2)
    {
      //We follow
      int dx = player.getX() - dot.getX();
      int dy = player.getY() - dot.getY();
      if (abs(dx) > abs(dy))
      {
        if (dx > 0)
        {
          //Player is to the right
          dot.moveRight();
        } else
        {
          //Player is to the left
          dot.moveLeft();
        }
      } else if (dy > 0)
      {
        //Player is down;
        dot.moveDown();
      } else
      {//Player is up;
        dot.moveUp();
      }
    } else
    {
      //We move randomly
      int move = rnd.nextInt(4);
      if (move == 0)
      {
        //Move right
        dot.moveRight();
      } else if (move == 1)
      {
        //Move left
        dot.moveLeft();
      } else if (move == 2)
      {
        //Move up
        dot.moveUp();
      } else if (move == 3)
      {
        //Move down
        dot.moveDown();
      }
    }
  }
}
