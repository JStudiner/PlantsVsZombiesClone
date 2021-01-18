class NutPlant extends Plants{
 
  NutPlant(int x, int y, int size,int i,int j,int shots) {
    super(x,y, size,i,j,shots);
 }
  
  public void display(){
    image(nutImage,super.x + 5, super.y -30);
  }
}
  
