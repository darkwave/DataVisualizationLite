import datavisualization.*; //import the library to help us with data
PShape backgroundImage;
DataVisualization data; //prepare a DataVisualization object

void setup() {
  size(800, 450); //create a window 800x450
  backgroundImage = loadShape("background.svg");
  colorMode(HSB, 360, 100, 100);
  
  textAlign(LEFT, CENTER); //font align
  textSize(30);
  data = new DataVisualization(this); //create a DataVisualization object
  data.load("temperature.csv"); //load data from CSV file

  background(#008080); //clear the screen with (black) color
  shape(backgroundImage, 0, 0);
    
  translate(60, 120); //move to the upper/left corner where you want to start drawing your data
  data.visualize(); //visualize it
}

/**
  This function decide how you draw every row of your data.
**/

void displayEntry(TableRow row) {
  String time = row.getString("orario"); //get time (this is our label)
  float temperature = row.getFloat("temperatura"); //get temperature (this is our quantity)
  float temperatureAsHue = map(temperature, 0, 20, 60, 0);
  
  fill(0, 0, 100); //fill color is grey
  text(time, 0, 0); //print label
  fill(temperatureAsHue, 100, 100); //fill color is white
  noStroke(); //no border/outline for our shapes
  rect(100, 0, temperature * 30, 20); //draw a rectangle
  text(int(temperature) + "°", 110 + temperature * 30, 0); //print value
  translate(0, 30); //move 40px on the Y axis
}