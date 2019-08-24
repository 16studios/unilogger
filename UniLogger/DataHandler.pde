class DataHandler {

  String[] parameters; 

  DataHandler(Table table) {

    try {
      java.lang.reflect.Field f = table.getClass().getDeclaredField("columnTitles");
      f.setAccessible(true);
      parameters = (String[]) f.get(table);
      println(parameters);

    } 
    catch (Exception exc) {
      exc.printStackTrace();
    }
  }

}
