import datavisualization.*;

DataVisualization data;
PImage img;

void setup() {
  size(1000, 700);
  noStroke();
  background(#3BD2EA);
  data = new DataVisualization(this);
  data.load("female-teachers.csv");

  img = loadImage("female-teacher2.png");

  data.visualize();
}

void draw() {
}

void displayEntry(TableRow row, int idx) {

  String paese = row.getString("Country");
  float dato = row.getFloat("Percentage");

  float base = width/4;
  float altezza = height/4;

  float startx= (idx%4)*base;
  float starty = floor(idx/4)*altezza;

  pushMatrix();
  translate(startx, starty);

  // sfondo riquadri
  stroke(21, 71, 206, 255);
  strokeWeight(3);
  noFill();
  rect(0, 0, base, altezza);

  // legenda paese
  fill(255, 255);
  textSize(20);
  text(paese, 10, 30);

  // immagine riscalata
  pushMatrix();
  translate(base*(1-dato/100), altezza*(1-dato/100));
  scale(base*dato/100, altezza*dato/100);
  tint(200, 0, 0);
  image(img, 0, 0, 1, 1);

  // dato testuale
  fill(255);
  textSize(0.15);
  text(round(dato) + "%", 0, 0); //NB: vorrei metterlo sulla lavagna, ma non riesco a capire come spostarlo!
  popMatrix();

  popMatrix();
}
