class Car {

  Point position;
  float R, G, B;
  

  Car (float R, float G, float B) {
    this.R = R;
    this.G = G;
    this.B = B;
    
  }

  void setPosition(Point position) {
    this.position = position;
  }

  void show() {

    fill(R, G, B);
    noStroke();
    ellipse(position.x, position.y, 10, 10);
  }

}