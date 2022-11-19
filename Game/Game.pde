import processing.sound.*; //allows sound to be imported into Processing
SoundFile brownNoise; //background noise for the hospital room

HospitalRoom hr; //constructs 1 object from the class HospitalRoom with hr parameters
Walter w; //contstructs 1 object from the Walter class with w parameters

void setup() {
  fullScreen(); //sets the run window to fullscreen
  brownNoise=new SoundFile(this, "brownNoise.wav");

  hr=new HospitalRoom(); //initializes the class HospitalRoom
  w=new Walter(); //initializes the class Walter

  hr.brownNoise(); //plays brown noise
}

void draw() {
  hr.displayHR();
  hr.boundaries();
  hr.diary();
  w.displayWalter(); 
  hr.bedBoundaries();
  w.walterMove(); 
}

void keyPressed() {
  w.walterKeyPressed(); 
}

void keyReleased() {
  w.walterKeyReleased();
}
