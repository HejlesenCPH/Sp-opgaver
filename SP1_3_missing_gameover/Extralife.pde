class ExtraLife {

  private Dot dot; 
  private int life;
  private int maxLife;
  private int power;

  public ExtraLife(Dot dot, int life, int power) {

    this.dot = dot;
    this.life = life;
    this.maxLife = life;
    this.power = power;
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

  public void subtractLife(int x) {
    this.life = life - x;
  }

  public void updateExtraLife(Random rnd, Player player) {
    if (life <= 0) {
      this.dot.y = rnd.nextInt(this.dot.maxY);
      this.dot.x = rnd.nextInt(this.dot.maxX);
      life = maxLife;
    }

    moveExtralife(rnd, player);
  }

  private void moveExtralife(Random rnd, Player player) {
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
          dot.moveLeft();
        } else
        {
          //Player is to the left
          dot.moveRight();
        }
      } else if (dy > 0)
      {
        //Player is down;
        dot.moveUp();
      } else
      {//Player is up;
        dot.moveDown();
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
