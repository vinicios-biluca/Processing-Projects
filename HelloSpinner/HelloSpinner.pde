void setup() {

  size(400, 400);
}

int i = 1;
float angle = 0;

void draw() {
  background(255);

  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(angle));
  Spinner spinner = new Spinner(255, 0, 0);
  spinner.show();

  if (mouseX > (width/2)) {

    angle = angle + (mouseY * 0.15);
  } else {

    angle = angle + (mouseY * 0.15) * (-1);
  }

  popMatrix();

  fill(0);
  textSize(18);
  text("Velocidade: " + (mouseY * 0.15)/60*100 + "%", 10, 30);
}

class Spinner {

  float R, G, B;

  Spinner(int R, int G, int B) {

    this.R = R;
    this.G = G;
    this.B = B;
  }

  void show() {

    translate(-width/2, -height/2);

    showBody();
    showCentralRoller();
  }

  void showBody() {

    float xi = width/2;
    float yi = height/2;

    float xf, yf, xm, ym;

    stroke(this.R, this.G, this.B);
    strokeWeight(20);
    ellipse(xi, yi, 80, 80);

    float angle;
    float radius = 90;
    float gap = 58;

    for (int i = 1; i <= 3; i++) {
      strokeWeight(60);
      stroke(this.R, this.G, this.B);

      angle = radians(120 * i);

      xf = (sin(angle) * radius); 
      yf = (cos(angle) * radius);

      xm = (sin(angle) * gap); 
      ym = (cos(angle) * gap);

      line(xi + xm, yi + ym, xi + xf, yi + yf);

      showRoller(xi + xf, yi + yf);
    }
  }

  void showCentralRoller() {

    for (int i = 1; i <= 7; i++) {

      float xi, yi, xf, yf, angle, radius;
      xi = width/2;
      yi = height/2;
      angle = radians(51 * i);
      radius = 22;


      xf = (sin(angle) * radius); 
      yf = (cos(angle) * radius);

      fill(128);
      noStroke();
      strokeWeight(8);
      ellipse(xi + xf, yi + yf, 10, 10);
    } 

    fill(255, 1);
    stroke(50);
    strokeWeight(8);
    ellipse(width/2, height/2, 60, 60);

    fill(this.R, this.G, this.B);
    stroke(50);
    strokeWeight(8);
    ellipse(width/2, height/2, 30, 30);
  }

  void showRoller(float xi, float yi) {

    fill(0, 1);
    stroke(this.R, this.G, this.B);
    strokeWeight(20);
    ellipse(xi, yi, 80, 80);

    fill(255);
    stroke(50);
    strokeWeight(8);
    ellipse(xi, yi, 60, 60);

    for (int i = 1; i <= 7; i++) {

      float xf, yf, angle, radius;

      angle = radians(51 * i);
      radius = 22;

      xf = (sin(angle) * radius); 
      yf = (cos(angle) * radius);

      fill(128);
      noStroke();
      ellipse(xi + xf, yi + yf, 10, 10);
    }



    fill(this.R, this.G, this.B);
    stroke(50);
    strokeWeight(8);
    ellipse(xi, yi, 30, 30);
  }
}