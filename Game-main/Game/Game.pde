import processing.sound.*; //allows sound to be imported into Processing
SoundFile brownNoise; //background noise for the hospital room

import gifAnimation.*;
Gif doorText;
Gif doorAText;
Gif diaryText;

import processing.video.*;
Movie whiteFlash;

HospitalRoom hr; //constructs 1 object from the class HospitalRoom with hr parameters
Walter w; //contstructs 1 object from the Walter class with w parameters

boolean noMove;

void setup() {
  fullScreen(); //sets the run window to fullscreen
  brownNoise=new SoundFile(this, "brownNoise.wav");
  doorText=new Gif(this, "doorText.gif");
  doorAText=new Gif(this, "doorAText.gif");
  diaryText=new Gif(this, "diaryText.gif");
  whiteFlash=new Movie(this,"whiteFlash.mp4");

  hr=new HospitalRoom(); //initializes the class HospitalRoom
  w=new Walter(); //initializes the class Walter

  hr.brownNoise(); //plays brown noise
}

void movieEvent(Movie whiteFlash) {
  whiteFlash.read();
}

void draw() {
  println(hr.diaryTextCounter);
  hr.displayHR();
  hr.boundaries();
  hr.diaryBoundaries();
  hr.diaryInteraction();
  w.displayWalter();
  hr.doorInteraction();
  hr.bedBoundaries();
  w.walterMove();
  hr.transition();
}

void keyPressed() {
  if (noMove==false)
    w.walterKeyPressed();

  hr.hrKeyPressed();
}

void keyReleased() {
  w.walterKeyReleased();
}
