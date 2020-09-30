import java.lang.Math;

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

  public void updateEnemy(Random rnd, Player player, Player player2) {
    moveEnemy(rnd, player, player2);
  }

  private void moveEnemy(Random rnd, Player p1, Player p2) {
    double distp1= dot.getDistance(p1.getDot());
    double distp2 = dot.getDistance(p2.getDot());
    Player playerToFollow;
    if (distp1>distp2) {
      playerToFollow = p2;
    } else {
      playerToFollow = p1;
    }

    if (rnd.nextInt(3) < 2)
    { 
      //We follow
      int dx = playerToFollow.getX() - dot.getX();
      int dy = playerToFollow.getY() - dot.getY();
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
