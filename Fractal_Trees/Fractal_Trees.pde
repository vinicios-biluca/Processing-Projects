//O Angulo entre os Galhos
float angle = PI/4;

//Limite de comprimento dos Galhos e da Raiz
float limiteArvore = 2;
float limiteRaiz = 5;

void setup() {

  size(600, 600);
}

void draw() {

  background(112,147,219);
  fill(147,219,112);
  noStroke();
  rect(0, height - 100, width, height);

  fill(0);
  textSize(18);
  text("Ângulo: " + degrees(angle), 20, 20);

  pushMatrix();
  translate(width/2, height-100);
  float ComprimentoArvore = 150;
  buildTree(ComprimentoArvore);
  popMatrix();

  pushMatrix();
  translate(width/2, height-100);
  float ComprimentoRaiz = 50;
  buildRoots(ComprimentoRaiz);
  popMatrix();

  angle = (mouseX * PI)/ width;

  noFill();
}

void buildTree(float len) {

  if (len < (limiteArvore*12)) {
    strokeWeight(1);
    stroke(33, 94, 33);
  } else {
    strokeWeight(2);
    stroke(92, 51, 23);
  }

  line(0, 0, 0, -len);

  translate(0, -len);

  if (len > limiteArvore) {
    pushMatrix();
    rotate(angle);
    buildTree(len * 0.7);
    popMatrix();
    pushMatrix();
    rotate(-angle);
    buildTree(len * 0.7);
    popMatrix();
  }
}

void buildRoots(float len) {
  rotate(-PI);
  
  strokeWeight(1);
  stroke(165,128,100);

  line(0, 0, 0, -len);

  translate(0, -len);

  if (len > limiteRaiz) {
    pushMatrix();
    rotate(angle);
    buildRoots(len * 0.7);
    popMatrix();
    pushMatrix();
    rotate(-angle);
    buildRoots(len * 0.7);
    popMatrix();
  }
}