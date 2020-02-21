import grafica.*;

public GPlot graph;

Table table;
DataHandler DataHandler;
Menu_bar mp;
Checkbox[] boxes = new Checkbox[1];    

String fileName = " ";

Boolean clear = true;

void setup() {
  background(0);
  size(1280, 720);
  mp = new Menu_bar(this, "UniLogger", 100, 100);
  
  graphSetup();
    
  /*for (TableRow row : table.rows()) {

    float time = row.getFloat("Time (sec)");
    String fuel = row.getString("A/F Sensor #1 Ratio");
    String setfuel = row.getString("Commanded Fuel Final");

    println(time + " has an AFR of " + fuel + " and a coded fuel of " + setfuel);
  }*/

}

void draw() {
  
  //if(clear) {
    clear();
    //clear = false;
  //}
  
  if(boxes[0] != null) {
    for(int i=0; i< boxes.length; i++){
      boxes[i].render();
    }
  }
  drawGraph();
}

void drawGraph() {
    graph.beginDraw();
    graph.drawBackground();
    graph.drawBox();
    graph.drawXAxis();
    graph.drawYAxis();
    graph.drawTopAxis();
    graph.drawRightAxis();
    graph.drawTitle();
    graph.drawPoints();
    graph.drawLines();
    //graph.drawPoint(new GPoint(65, 1.5), mug);
    //graph.drawPolygon(polygonPoints, color(255, 200));
    graph.drawLabels();
    graph.endDraw();
    
}

void setGraph(int c) {
    float[] data = float(table.getStringColumn(c));
    float[] time = float(table.getStringColumn(0));
    println(data);
    GPointsArray points = new GPointsArray(data.length-1);
  
    for (int i = 0; i < data.length; i++) {
    points.add(time[i], data[i], str(data[i]));
  }
  
  graph.addLayer("layer " + c, points);
  graph.getLayer("layer " + c).setPointColor(boxes[0].colorArray[c]);
  graph.getLayer("layer " + c).setPointSize(1);
  graph.getLayer("layer " + c).setLineColor(boxes[0].colorArray[c]);
}

void graphSetup() {
  //real code
  
  graph = new GPlot(this);
  graph.setPos(280, 0);
  graph.setDim(900, 600);
  graph.setXLim(0, 400);
  graph.setYLim((-20), 300);
  graph.getTitle().setText("Log Viewer");
  graph.getXAxis().getAxisLabel().setText("Time");
  //graph.getYAxis().getAxisLabel().setText("noise (0.1 time)");
  graph.setLogScale("xy");
  graph.setBgColor(50);
  graph.setBoxBgColor(50);
  graph.setBoxLineColor(255);
  graph.setLabelBgColor(255);
  graph.setAllFontProperties("sansserif", 255, 12);
  
  graph.activatePanning();
  graph.activateZooming(1.2, CENTER, CENTER);
  graph.activatePointLabels();
  //testing stuff
  //graph.setPoints(points1a);
  //graph.setPointColor(color(20, 200, 255));
 // graph.setPointSize(5);
}

void selectFile(File selection) {
      if (selection == null) {
      println("Window was closed or the user hit cancel.");
    } else {
      println("User selected " + selection.getAbsolutePath());
      fileName = selection.getAbsolutePath();
      postSetup();
    }
}
  
void postSetup() {
   clear = true;
   table = loadTable(fileName, "header");
   DataHandler = new DataHandler(table);
   boxes = new Checkbox[table.getColumnCount()-1];
   println(table.getColumnCount() + " total Columns in table");

   for(int i=0; i< boxes.length; i++){
    boxes[i] = new Checkbox(10, 40 + 25 * i, DataHandler.parameters[i], i);
   }
    
}
  
void mousePressed(){
  if(boxes[0] != null) {
    for(int i=0; i< boxes.length; i++){
      boxes[i].click();
    }
  }
}
