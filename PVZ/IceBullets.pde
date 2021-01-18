
class IceBullets extends Bullet{
  
public IceBullets(int x, int y,int type){
  super(x,y,type);
}
void display(){
fill(62,210,223);
ellipse(super.x, super.y,20,20);
}
}
