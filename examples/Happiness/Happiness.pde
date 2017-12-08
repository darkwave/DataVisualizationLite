import datavisualization.*;

DataVisualization data;

void setup() {
  size(1000, 700);
  noStroke();
  colorMode(HSB, 100);
  data = new DataVisualization(this);
  data.load("happiness2016.csv");
}

void draw() {
  background(0);
  textSize(20);
  fill(100, 0, 100);
  text("Economy ", 30, height - 30);
  arrow(130, height - 35, 0);
  text("Health ", width - 70, 30);
  arrow(width-40,40,90);

  data.visualize();
}

void displayEntry(TableRow row) {
  String paese = row.getString("Country");
  paese = paese.substring(0, 3);

  int happiness = int(map(row.getFloat("Happiness Score"), 2.905, 7.526, 50, 100));
  float economy = map(row.getFloat("Economy (GDP per Capita)"), 0, 1.8, 40, width-50);
  float health = map(row.getFloat("Health (Life Expectancy)"), 0., 1., 40, height-40);
  fill(happiness, 99, 99);
  //textSize(happiness);
  textSize(10);
  text(paese, economy, health);
}

void arrow(float x, float y, float s)
{
  strokeWeight(3);
  stroke(100, 0, 100);
  pushMatrix();
  translate(x,y);
  rotate(radians(s));
  line(0,0,70,0);
  line(50,-10,70,0);
  line(50,10,70,0);
  //line(140, height-50, 160, height-35);
  popMatrix();
}
