HospitalRoom hr;
Walter w;

void setup() {
  fullScreen();

  hr=new HospitalRoom();
  w=new Walter();
}


void draw() {
  hr.displayHR();
  w.displayWalter();
  w.hrBoundaries();
  w.walterMove();
}

void keyPressed() {
  w.walterKeyPressed();
}

void keyReleased() {
w.walterKeyReleased();
}
