class Peashooter extends Plants{

  public Peashooter(int x, int y, int size,int i,int j,int shots) {
    super(x, y, size,i,j,shots);
  
    setBulletColour(color(255,100,100));
    setDamage(1);
  }

  public void display(){
    image(playerImage,super.x + 5, super.y -30);
  }
  
  
  

}
