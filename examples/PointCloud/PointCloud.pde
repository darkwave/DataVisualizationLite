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
  // etichette degli assi: abbiamo usato la funzione "arrow" definita più avanti
  textSize(20);
  fill(100, 0, 100);
  text("Economy ", 30, height - 30);
  arrow(130, height - 35, 0);
  text("Health ", width - 70, 30);
  arrow(width-40,40,90);

  data.visualize();
}

void displayEntry(TableRow row, int idx) {
  // usiamo i primi tre caratteri del campo "Country" per la stringa "paese"
  String paese = row.getString("Country");
  paese = paese.substring(0, 3);

  // estraiamo i campi "Happiness", "Economy" e "Health" facendo map sugli intervalli
  // che ci interessano nella rappresentazione.
  int happiness = int(map(row.getFloat("Happiness Score"), 2.905, 7.526, 50, 100));
  float economy = map(row.getFloat("Economy (GDP per Capita)"), 0, 1.8, 40, width-50);
  float health = map(row.getFloat("Health (Life Expectancy)"), 0., 1., 40, height-40);
  // la HUE del colore del testo viene usata per rappresentare l'indice di felicità
  fill(happiness, 99, 99);
  textSize(10);
  text(paese, economy, health);
}

// funzione arrow per disegnare una freccia nella posizione (x,y), ruotata di s gradi
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
  popMatrix();
}
