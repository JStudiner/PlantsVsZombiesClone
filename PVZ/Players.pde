class Player{
  
private int coins;
private int lives;

public Player(int coins){
this.coins = coins;
this.lives = 5;
}

public int getCoins() {
        return coins;
    }

public void setCoins(int i) {
      coins=i;
    }
    
    public int getLives() {
        return lives;
    }

public void setLives(int i) {
      lives=i;
    }
public void pickupcoin(){
  coins = coins + 25;
}
}
