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
      //text(DataHandler.parameters[i], 20, 10 + 30 * i); 
    }
  }
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
    boxes[i] = new Checkbox(10, 10 + 25 * i, DataHandler.parameters[i]);
   }
    
}
  
void mousePressed(){
  if(boxes[0] != null) {
    for(int i=0; i< boxes.length; i++){
      boxes[i].click();
    }
  }
}
