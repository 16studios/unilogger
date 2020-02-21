import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

public class Menu_bar {
  JFrame frame;

  public Menu_bar(PApplet app, String name, int width, int height) {
    System.setProperty("apple.laf.useScreenMenuBar", "true");
    frame = (JFrame) ((processing.awt.PSurfaceAWT.SmoothCanvas)app.getSurface().getNative()).getFrame();
    frame.setTitle(name);

    // Creates a menubar for a JFrame
    JMenuBar menu_bar = new JMenuBar();
    // Add the menubar to the frame
    frame.setJMenuBar(menu_bar);
    // Define and add drop down menus to the menubar
    JMenu file_menu = new JMenu("File");
    JMenu options_menu = new JMenu("Options");
    JMenu tools_menu = new JMenu("Tools");

    menu_bar.add(file_menu);
    menu_bar.add(options_menu);
    menu_bar.add(tools_menu);

    //File Menu Items
    JMenuItem new_file = new JMenuItem("Open Log");
    JMenuItem action_exit = new JMenuItem("Exit");

    file_menu.add(new_file);
    file_menu.addSeparator();
    file_menu.add(action_exit);
    
    //Options Menu Items
    
    //Tools Menu Items
    JMenuItem maf_scale = new JMenuItem("MAF Scaling");
    
    tools_menu.add(maf_scale);

    // Add a listener to the New menu item. actionPerformed() method will
    // invoked, if user triggred this menu item
    new_file.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent arg0) {
        selectInput("Select a file to process:", "selectFile");
      }
    }
    );
    
    action_exit.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent arg0) {
        exit();
      }
    }
    );
    
    frame.setVisible(true);
  }

}
