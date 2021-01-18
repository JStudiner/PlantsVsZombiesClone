class Bullet{
  
  private int bulletSpeed;
  private int x;
  private int y;
  private int type;
 
  Bullet(int x, int y,int type) {
    this.x = x;
    this.y = y;
    this.type=type;
  }
    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = x;
    }
  public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }
    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

  void update() {
    x = x + bulletSpeed;
    bulletSpeed = 3;
  }
  
  void display(){
    fill(255);
    ellipse(x, y,20,20);
  }
}
