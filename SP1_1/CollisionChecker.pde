class CollisionChecker {
  
 public CollisionChecker() {
   
 }
 
 
 
  public void checkForCollision(Enemy[] enemies,ExtraLife[] extraLives, Player player){
  
    checkForCollisions(enemies, player);
    checkForCollisions(extraLives, player);
  }
  
  public void checkForCollisions(Enemy[] enemies, Player player)
  {
    //Check enemy collisions
    for (int i = 0; i < enemies.length; ++i)
    {
      if (enemies[i].isColliding(player)) {
        player.subtractLife(1);
      }
    }
  }
  
    public void checkForCollisions(ExtraLife[] extraLives, Player player){
    //Check extraLife collisions
    for (int i = 0; i < extraLives.length; ++i)
    {
      ExtraLife extraLife = extraLives[i];
      if (extraLife.isColliding(player)) {
        player.addLife(extraLife.power);
        extraLife.subtractLife(1);
      }
    }
  }

}
