/**
  Example of data visualization over a simple map using data from "Employment in high-tech sectors, EU-28 and selected countries, 2015" by Eurostat
  available at http://ec.europa.eu/eurostat/product?code=htec_emp_nat2&language=en&mode=view
**/

import datavisualization.*;

DataVisualization data;

PShape europeMap;

void setup() {
   size(800, 450);
   europeMap = loadShape("europe2.svg"); //load europe image
   europeMap.disableStyle(); //disable the current style of europe image in order to change it later with fill() and stroke()
   data = new DataVisualization(this);
   data.load("eu_employment_in_tech.csv");
   textAlign(CENTER, CENTER);
   PFont myFont = loadFont("ubuntu_font.vlw");
   textFont(myFont, 24);

}

void draw() {
  background(#008080); //water color
  fill(255); //white color for the map
  stroke(#008099); //light blue for the borders
  shape(europeMap, 0, 0);
  fill(0);
  textSize(12);
  text(mouseX + "," + mouseY, mouseX, mouseY - 20); //optional, write on screen mouse coordinates
  
  textSize(24);
  data.visualize();
}
/**
  This function help you find out coordinates on the screen
**/
void mouseClicked() {
  println(mouseX + "," + mouseY);
}

void displayEntry(TableRow row, int idx) {
 int year = row.getInt("TIME");
 String sex = row.getString("SEX");

 if (year == 2008 && sex.equals("Females")) { //select only values about Females workers in the year 2016
   String value = nfc(row.getFloat("VALUE"), 1); //convert VALUE into a String with only 1 decimal
   fill(#000099); //color for females worker
   if (row.getString("GEO").equals("Italy")) { //if GEO is equal to Italy
      text(value, 570, 350); //write the value at coordinates x: 570 y: 350
   }
   if (row.getString("GEO").equals("France")) {
      text(value, 470,311);
   }
   if (row.getString("GEO").equals("Spain")) {
      text(value, 425,376);
   }
   if (row.getString("GEO").equals("Portugal")) {
      text(value, 376,383);
   }
   if (row.getString("GEO").equals("United Kingdom")) {
      text(value, 467,234);
   }
   if (row.getString("GEO").equals("Germany")) {
      text(value, 553,271);
   }
 }
 
 if (year == 2008 && sex.equals("Males")) { //select only values about Females workers in the year 2016
   String value = nfc(row.getFloat("VALUE"), 1); //convert VALUE into a String with only 1 decimal
   fill(#990000); //color for males worker
   if (row.getString("GEO").equals("Italy")) { //if GEO is equal to Italy
      text(value, 600,372); //write the value at coordinates x: 570 y: 350
   }
 }
}