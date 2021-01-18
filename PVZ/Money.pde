class Money{
  private int x,y,rad;
  
  public Money(int x, int y){
  this.x=x;
  this.y=y;
  this.rad=30;
  }
  public int getx() {
        return x;
    }

      public void setx(int i) {
      x=i;
    }
      public int gety() {
        return y;
    }

      public void sety(int i) {
      y=i;
    }
      public void setRad (int i){
      rad=i;
    }
      public int getRad ()
    {
      return rad;
    }
    
    public void display(){
      fill(255,255,0);
      ellipse(x,y,rad,rad);
    }
}
