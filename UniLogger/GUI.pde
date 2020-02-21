class Checkbox {
  int x, y;
  boolean b; //Is selected?
  String m;
  int c; //Column Number
  public color[] colorArray = {#FF6633, #FF33FF, #FFFF99, #00B3E6, 
      #E6B333, #3366E6, #999966, #99FF99, #B34D4D,
      #80B300, #809900, #E6B3B3, #6680B3, #66991A, 
      #FF99E6, #CCFF1A, #FF1A66, #E6331A, #33FFCC,
      #66994D, #B366CC, #4D8000, #B33300, #CC80CC, 
      #66664D, #991AFF, #E666FF, #4DB3FF, #1AB399,
      #E666B3, #33991A, #CC9999, #B3B31A, #00E680, 
      #4D8066, #809980, #E6FF80, #1AFF33, #999933,
      #FF3380, #CCCC00, #66E64D, #4D80CC, #9900B3, 
      #E64D66, #4DB380, #FF4D4D, #99E6E6, #6666FF};
      
  Checkbox(int _x, int _y, String _m, int _c){
    x = _x;
    y = _y;
    m = _m;
    c = _c;
    b = false;
  }
  void render(){
    stroke(255);
    fill(isOver()?128:64);
    rect(x, y, 20, 20);
    if(b){
      fill(int(colorArray[c]));
      line(x, y, x+20, y+20);
      line(x, y+20, x+20, y);
    }
    stroke(0);
    text(m, x + 30, y + 15);
  }
  void click(){
    if(isOver()){
      b=!b;
      if(b) {
        setGraph(c);
      }
      else{
       graph.removeLayer("layer " + c); 
      }
    }
  }
  boolean isOver(){
    return(mouseX>x&&mouseX<x+120&&mouseY>y&&mouseY<y+20);
  }
}
