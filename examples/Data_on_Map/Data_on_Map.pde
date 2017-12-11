/**
  Example of data visualization over a simple map using data from "Employment in high-tech sectors, EU-28 and selected countries, 2015" by Eurostat
  available at http://ec.europa.eu/eurostat/product?code=htec_emp_nat2&language=en&mode=view
**/

import datavisualization.*;

DataVisualization data; 

PShape europeMap;

void setup() {
   size(800, 450);
   europeMap = loadShape("europe2.svg");
   europeMap.disableStyle();
   data = new DataVisualization(this);
   data.load("eu_employment_in_tech.csv");
   
}

void draw() {
  background(#008080);
  fill(255);
  stroke(#008099);
  shape(europeMap, 0, 0);
  fill(0);
  textSize(8);
  text(mouseX + "," + mouseY, mouseX, mouseY);
  fill(#ff00ff);
  noStroke();
  textSize(24);
  data.visualize();
}

void displayEntry(TableRow row) {
 int year = row.getInt("TIME");
 String sex = row.getString("SEX");

 if (year == 2016 && sex.equals("Females")) {
   if (row.getString("GEO").equals("Italy")) {
      text(nfc(row.getFloat("VALUE"), 1), 570, 350);
   }
 }
}