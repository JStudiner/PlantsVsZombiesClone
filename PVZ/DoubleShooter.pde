class doubleShooter extends Plants{
  
  public doubleShooter(int x, int y, int size,int i,int j,int shots) {
    super(x, y, size,i,j,shots);
    setBulletColour(color(255,100,100));
    setDamage(2);
  }
  
  public void display(){
    image(doubleImage,super.x + 5, super.y -30);
  }

}
