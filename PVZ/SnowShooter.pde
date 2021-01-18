class SnowShooter extends Plants{
  
  public SnowShooter(int x, int y, int size,int i,int j,int shots) {
    super(x, y, size,i,j,shots);
    setBulletColour(color(255,100,100));
    setDamage(0);
  }
  
  public void display(){
    image(snowImage,super.x + 5, super.y -30);
  }

}
