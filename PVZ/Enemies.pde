public class Enemy {
   private PImage bzombie;
  private int [] yLoc = {150, 240,330,420,510};
  private int x,s;
  private int y;
  private int colour;
  private int speed;
  private float health;
  private int location = int(random(yLoc.length));
  private boolean frozen;
  private int frozenTime,frozenDelay;
  public Enemy() {
    this.x = 1200;
    this.y = yLoc[location];
    this.s = 30;
    this.health = 3;
  }
  
  public Enemy(int x, int s, int y, float health, int speed,int frozenTime,PImage bzombie) {
     this.x = x;
     this.s = s;
     this.y = y;
     this.health = health;
     this.speed = speed;
     this.frozenTime=frozenTime;
     this.frozenDelay=3000;
     this.bzombie=bzombie;
     
   }
  void setFrozen(boolean i){
  this.frozen=i;
  }
  boolean getFrozen (){
    
  return frozen;
  }
  void update(){
    if (frozen==false){
    x = x + speed;
    speed = getSpeed();
    }else if(millis()>frozenTime+frozenDelay){
      frozen=false;

    }
  }

  void display() {
    
    //ellipse(x, y,s,s);
    image(bzombie, x-30,y-30);
       
  }
  public PImage getImage() {
        return bzombie;
    }

    public void setImage(PImage x) {
        this.bzombie= x;
    }

    public int[] getyLoc() {
        return yLoc;
    }

    public void setyLoc(int[] yLoc) {
        this.yLoc = yLoc;
    }
 public int getFrozenTime() {
        return frozenTime;
    }

    public void setFrozenTime(int x) {
        this.frozenTime = x;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getS() {
        return s;
    }

    public void setS(int s) {
        this.s = s;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public int getColour() {
        return colour;
    }

    public void setColour(int colour) {
        this.colour = colour;
    }

    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public float getHealth() {
        return health;
    }

    public void setHealth(float health) {
        this.health = health;
    }

    public int getLocation() {
        return location;
    }

    public void setLocation(int location) {
        this.location = location;
    }
  
  
  

}
