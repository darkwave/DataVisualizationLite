/*
    This file is part of DataVisualizationLite by Codemotion Kids!

    DataVisualizationLite is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    DataVisualizationLite is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with DataVisualizationLite.  If not, see <http://www.gnu.org/licenses/>.
*/
package datavisualization;

import java.lang.reflect.*;
import processing.core.*;
import processing.data.*;

public class DataVisualization {
  PApplet parent;
  Method displayMethod;
  Table table;

  public DataVisualization(PApplet _parent) {
    parent = _parent;


    try {
      displayMethod = parent.getClass().getMethod("displayEntry",
        new Class[] {
        TableRow.class
        }
        );
    }
    catch (Exception e) {
      // no such method, or an error.. which is fine, just ignore

      parent.println("Manca il metodo displayEntry");
    }
  }

  public void load(String filename) {
    table = parent.loadTable(filename, "header");

    parent.println("HEADER:");
    parent.println(PApplet.join(table.getColumnTitles(),"|"));
    parent.println(table.getRowCount() + " total rows in table");
  }

  public void visualize() {
    for (TableRow row : table.rows()) {
      displayEntryImpl(row);
    }
  }

  private void displayEntryImpl(TableRow row) {
    if (displayMethod != null) {
      try {
        displayMethod.invoke(parent, row);
      }
      catch (Exception e) {
        parent.println("Disabling displayEntry() because of an error.");
        // e.printStackTrace();
        displayMethod = null;
      }
    }
  }
}
