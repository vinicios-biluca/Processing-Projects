ArrayList <Point> points; //<>//

Track track = new Track();
Car[] cars = new Car[12];

void setup() {

  size(800, 524);

  background(0, 120, 0);
  track.showTrack();
  points = track.fillPoints();

  for (int j = 0; j < cars.length; j++) {

    cars[j] = new Car(random(255), random(255), 0);
  }
}

int i = 0;

void draw() {

  noStroke();
  fill(128);

  stroke(0);

  background(0, 120, 0);
  track.showTrack();


  for (int j = 0; j < cars.length; j++) {


    if ((j + i) < points.size()) {
      cars[j].setPosition(points.get(j + i));
      cars[j].show();
    } else {

      for (int m = 1; m <= cars.length; m++) {
    
        int kkk = j + i;
        
        cars[j].setPosition(points.get((kkk) - m)); //<>//
        cars[j].show();
      }
    }
  }

  delay(10);

  i++;

  if (i >= points.size()) {
    i = 0;
  }
}