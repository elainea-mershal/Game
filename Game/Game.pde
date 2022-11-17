import processing.sound.*; //allows sound to be imported into Processing
SoundFile hrNoise; //background noise for the hospital room

HospitalRoom hr; //constructs 1 object from the class HospitalRoom with hr parameters
Walter w; //contstructs 1 object from the Walter class with w parameters

void setup() {
  fullScreen(); //sets the rin window to fullscreen

  hr=new HospitalRoom(); //initializes the class HospitalRoom
  w=new Walter(); //initializes the class Walter
  hrNoise=new SoundFile(this, "hrNoise.wav");
}


void draw() {
  hr.displayHR(); //displays the hospital room
  w.displayWalter(); //displays Walter
  w.hrBoundaries(); //sets movement boundaries for Walter in the hospital room
  w.walterMove(); //allows Walter to move
  hr.brownNoise(); //plays sound
}

void keyPressed() {
  w.walterKeyPressed(); //moves Walter with wasd keys
}

void keyReleased() {
  w.walterKeyReleased(); //allows Walter to move diagonally
}
