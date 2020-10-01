import java.util.Random; //<>//

class Game
{
  private Random rnd;
  private int width;
  private int height;
  private int[][] board;
  private Keys keys;
  private Player player1;
  private Player player2;
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
    Dot playerDotP1 = new Dot(00, 00, width-1, height-1);   
    Dot playerDotP2 = new Dot(24, 00, width-1, height-1); 
    player1 = new Player(100, playerDotP1, true);
    player2 = new Player(100, playerDotP2, false);
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

  public int getPlayerLifeP1()
  {
    return player1.getLife();
  }
  public int getPlayerLifeP2()
  {
    return player2.getLife();
  }


  public void onKeyPressed(char as)
  {
    keys.onKeyPressed(as);
  }
  public void onKeyReleased(char as)
  {
    keys.onKeyReleased(as);
  }

  public void update()
  {

    //if (!gameover) {
    player1.updatePlayer(keys);
    player2.updatePlayer(keys);
    updateEnemies();
    updateExtraLives();
    collisionChecker.checkForCollision(enemies, extraLives, player1, player2);
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
      enemies[i].updateEnemy(rnd, player1, player2);
    }
  }

  private void updateExtraLives() {
    for (int i = 0; i < extraLives.length; ++i)
    {
      extraLives[i].updateExtraLife(rnd, player1);
      extraLives[i].updateExtraLife(rnd, player1);
    }
  }


  private void populateBoard()
  {
    //Player 1 and 2
    board[player1.getX()][player1.getY()] = 1;
    board[player2.getX()][player2.getY()] = 4;
    //Enemies
    for (int i = 0; i < enemies.length; ++i)
    {
      board[enemies[i].getX()][enemies[i].getY()] = 2;
    }
    //ExtraLife
    for (int i = 0; i < extraLives.length; ++i) {
      board[extraLives[i].getX()][extraLives[i].getY()] = 3;
    }
  }
   

  
}
