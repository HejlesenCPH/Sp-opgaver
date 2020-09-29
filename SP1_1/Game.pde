import java.util.Random; //<>// //<>//

class Game
{
  private Random rnd;
  private int width;
  private int height;
  private int[][] board;
  private Keys keys;
  private Player player;
  private Enemy[] enemies;
  private ExtraLife[] extraLives;
  private CollisionChecker collisionChecker;


  Game(int width, int height, int numberOfEnemies, int numberOfExtraLife)
  {
    if (width < 10 || height < 10)
    {
      throw new IllegalArgumentException("Width and height must be at least 10");
    }
    if (numberOfEnemies < 0)
    {
      throw new IllegalArgumentException("Number of enemies must be positive");
    } 
    this.rnd = new Random();
    this.board = new int[width][height];

    this.width = width;
    this.height = height;
    keys = new Keys();
    collisionChecker = new CollisionChecker();
    Dot playerDot = new Dot(0, 0, width-1, height-1);    
    player = new Player(100, playerDot);
    enemies= new Enemy[numberOfEnemies];
    for (int i = 0; i < numberOfEnemies; ++i) 
    {
      enemies[i] = new Enemy(new Dot(width-1, height-1, width-1, height-1));
    }

    extraLives = new ExtraLife[numberOfExtraLife];
    for (int i = 0; i < numberOfExtraLife; ++i)
    {
      Dot tmpDot = new Dot(width/2, height/2, width/2, height/2);

      extraLives[i] = new ExtraLife(tmpDot, 1, 1);
    }
  }

  public int getWidth()
  {
    return width;
  }

  public int getHeight()
  {
    return height;
  }

  public int getPlayerLife()
  {
    return player.getLife();
  }

  public void onKeyPressed(char ch)
  {
    keys.onKeyPressed(ch);
  }

  public void onKeyReleased(char ch)
  {
    keys.onKeyReleased(ch);
  }

  public void update()
  {

    //if (!gameover) {
    player.updatePlayer(keys);
    updateEnemies();
    updateExtraLives();
    // updateSecondPlayer();
    collisionChecker.checkForCollision(enemies, extraLives, player);
    clearBoard();
    populateBoard();
  }

  public int[][] getBoard()
  {
    //ToDo: Defensive copy?
    return board;
  }

  private void clearBoard()
  {
    for (int y = 0; y < height; ++y)
    {
      for (int x = 0; x < width; ++x)
      {
        board[x][y]=0;
      }
    }
  }




  private void updateEnemies() {
    for (int i = 0; i < enemies.length; ++i)
    {
      enemies[i].updateEnemy(rnd, player);
    }
  }

  private void updateExtraLives() {
    for (int i = 0; i < extraLives.length; ++i)
    {
      extraLives[i].updateExtraLife(rnd, player);
    }
  }


  private void populateBoard()
  {
    //Insert player
    board[player.getX()][player.getY()] = 1;
    //Insert enemies
    for (int i = 0; i < enemies.length; ++i)
    {
      board[enemies[i].getX()][enemies[i].getY()] = 2;
    }
    //Insert extraLife
    for (int i = 0; i < extraLives.length; ++i) {
      board[extraLives[i].getX()][extraLives[i].getY()] = 3;
    }
  }


  //private void checkForCollisions()
  //{
  //  //Check enemy collisions

  //  for (int i = 0; i < enemies.length; ++i)
  //  {
  //    if (enemies[i].isColliding(player)) {
  //      player.subtractLife(1);
  //    }
  //  }
  //}
}
