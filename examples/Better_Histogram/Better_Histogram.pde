/**
 In this example we use data from "Production, value added and employment by industry groups in the environmental goods and services sector"
 data-set by eurostat available at http://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=env_ac_egss3&lang=en

 We converted it into a simple csv file showing only per year "Total employment domestic concept" in "Full-time equivalent (FTE)"

 **/

import datavisualization.*; //import the library to help us with data
PShape backgroundImage; //prepare a SVG (vector) graphics for your background
color backgroundColor;
DataVisualization data; //prepare a DataVisualization object

void setup() {
  size(800, 450); //create a window 800x450
  backgroundColor = color(0);
  backgroundImage = loadShape("background.svg");


  textSize(18);
  data = new DataVisualization(this); //create a DataVisualization object
  data.load("total_employment.csv"); //load data from CSV file

  background(backgroundColor); //clear the screen with a color
  shape(backgroundImage, 0, 0, width, height);
  // scale(2);
  translate(60, 100); //move to the upper/left corner where you want to start drawing your data
  data.visualize(); //visualize it
}

/**
 This function decide how you draw every row of your data.
 **/

void displayEntry(TableRow row, int idx) {
  String time = row.getString("time"); //get time (this is our label)
  float value = row.getFloat("value"); //get value (this is our quantity)

  float people = map(value, 2000000, 5000000, 200, 500); //scaled down value using map() function for interpolation

  fill(#ffcc00); //fill color is orange
  textAlign(LEFT, TOP); //font align
  text(time, 0, 0); //print label
  fill(#ccff00); //fill color is green
  noStroke(); //no border/outline for our shapes
  rect(50, 0, people, 20); //draw a rectangle
  fill(backgroundColor);
  textAlign(RIGHT, TOP); //font align
  text(value / 1000000 + " mln", people + 50, 0);
  translate(0, 30); //move 40px on the Y axis
}
