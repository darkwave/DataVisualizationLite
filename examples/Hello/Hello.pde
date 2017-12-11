import datavisualization.*;

DataVisualization data;

void setup() {
  size(1000, 100);
  noStroke();
  data = new DataVisualization(this);
  data.load("colesterolo.csv");

}

void draw() {
  background(128);
  posX = 0;
   data.visualize();
}
int posX = 0;
void displayEntry(TableRow row, int idx) {

  ellipse(posX, 50, 10, row.getInt("CONSUMO MEDIO RICOVERO") / 10);
  posX += 10;
}
