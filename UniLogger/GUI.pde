class Checkbox {
  int x, y;
  boolean b;
  String m;
  Checkbox(int _x, int _y, String _m){
    x = _x;
    y = _y;
    m = _m;
    b = false;
  }
  void render(){
    stroke(255);
    fill(isOver()?128:64);
    rect(x, y, 20, 20);
    if(b){
      fill(255, 0, 0);
      line(x, y, x+20, y+20);
      line(x, y+20, x+20, y);
    }
    stroke(0);
    text(m, x + 30, y + 15);
  }
  void click(){
    if(isOver()){
      b=!b;
    }
  }
  boolean isOver(){
    return(mouseX>x&&mouseX<x+120&&mouseY>y&&mouseY<y+20);
  }
}
