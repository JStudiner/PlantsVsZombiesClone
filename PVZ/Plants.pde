class Plants {
  
 private int x,y,size,i,j;
 private int damage;
 private int shots;
 private color bulletColour;
 ArrayList<Bullet> bullets;
 private int health = 3;

    public Plants() {
    }
    
    public Plants(int x, int y, int size,int i,int j,int shots) {
      this.x = x;
      this.y = y;
      this.size = size;
      //this.health = health;
      this.i=i;
      this.j=j;
      this.shots=shots;
    }

    public Plants(int x, int y, int size, int damage, int bulletColour,int gridi,int gridj) {
      this.x = x;
      this.y = y;
      this.size = size;
      this.damage = damage;
      this.bulletColour = color(255,100,100);
      this.health = health;
      this.i=i;
      this.j=j;
    }
    
    public void display (){
        rect (x,y-45,size,size);
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }
     public int getShots() {
        return shots;
    }

    public void setShots(int x) {
        this.shots = x;
    }
 public int getI() {
        return i;
    }

    public void setI(int i) {
        this.i = i;
    }
 public int getj() {
        return j;
    }

    public void setJ(int j) {
        this.j= j;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getDamage() {
        return damage;
    }

    public void setDamage(int damage) {
        this.damage = damage;
    }
    
    public int getBulletColour() {
     return bulletColour;
    }

    public void setBulletColour(int bulletColour) {
     this.bulletColour = bulletColour;
    }
    
    public int getHealth() {
        return health;
    }

    public void setHealth(int health) {
        this.health = health;
    }

}
