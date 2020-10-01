class CollisionChecker {

  public CollisionChecker() {
  }


  public void checkForCollision(Enemy[] enemies, ExtraLife[] extraLives, Player player, Player player2) {

    checkForCollisions(enemies, player, player2);
    checkForCollisions(extraLives, player, player2);
  }


// collisioncheck enemys 
  public void checkForCollisions(Enemy[] enemies, Player player, Player player2)
  {

    for (int i = 0; i < enemies.length; ++i)
    {
      Enemy enemy = enemies[i];
      if (enemy.isColliding(player)) {
        player.subtractLife(1);
      }
      if (enemy.isColliding(player2)) {
        player2.subtractLife(1);
      }
    }
  }

// collisioncheck extra life 
  public void checkForCollisions(ExtraLife[] extraLives, Player player, Player player2) {
    //Check extraLife collisions
    for (int i = 0; i < extraLives.length; ++i)
    {
      ExtraLife extraLife = extraLives[i];
      if (extraLife.isColliding(player)) {
        player.addLife(extraLife.power);
        extraLife.subtractLife(1);
      }
      if (extraLife.isColliding(player2)) {
        player2.addLife(extraLife.power);
        extraLife.subtractLife(1);
      }
      
    }
  }
}
