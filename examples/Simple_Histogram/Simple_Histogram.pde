import datavisualization.*; //import the library to help us with data

DataVisualization data; //prepare a DataVisualization object

void setup() {
  size(800, 450); //create a window 800x450

  textAlign(LEFT, TOP); //font align

  data = new DataVisualization(this); //create a DataVisualization object
  data.load("temperature.csv"); //load data from CSV file

  background(0); //clear the screen with (black) color

  text("Temperature oggi", width - 200, height - 50); //write a simple title/source for your data

  translate(60, 10); //move to the upper/left corner where you want to start drawing your data
  data.visualize(); //visualize it
}

/**
  This function decide how you draw every row of your data.
**/

void displayEntry(TableRow row, int idx) {
  String time = row.getString("orario"); //get time (this is our label)
  float temperature = row.getFloat("temperatura"); //get temperature (this is our quantity)
  fill(128); //fill color is grey
  text(time, 0, 0); //print label
  fill(255); //fill color is white
  noStroke(); //no border/outline for our shapes
  rect(50, 0, temperature * 10, 30); //draw a rectangle
  translate(0, 40); //move 40px on the Y axis
}
