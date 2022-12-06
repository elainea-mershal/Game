import processing.sound.*; //allows sound to be imported into Processing
SoundFile brownNoise; //background noise for the hospital room

import gifAnimation.*; //allows gifs to be imported into Processing
Gif doorText; //door text gif to display a typewriter effect
Gif doorAText; //angry door text gif to display a typewriter effect
Gif diaryText; //diary text gif to display a typewriter effect

Walter w; //contstructs 1 object from the Walter class with w parameters
HospitalRoom hr; //constructs 1 object from the class HospitalRoom with hr parameters
LivingRoom lr; //constructs 1 object from the LivingRoom class with lr parameters

int roomCounter; //counter to display each room

boolean noMove; //boolean to prevent Walter from moving

PImage whiteScreen; //image of a white screen
int transparency; //stores the transparency
int transparencyChange=4; //changes the transparency in increments
int transparencyMax=280; //maximum transparency
boolean increaseTransparency; //boolean to increase the transparency
boolean decreaseTransparency; //boolean to decrease the transparency

void setup() {
  fullScreen(); //sets the run window to fullscreen
  brownNoise=new SoundFile(this, "brownNoise.wav");
  doorText=new Gif(this, "doorText.gif");
  doorAText=new Gif(this, "doorAText.gif");
  diaryText=new Gif(this, "diaryText.gif");
  whiteScreen=loadImage("whiteScreen.png");

  w=new Walter(); //initializes the class Walter
  hr=new HospitalRoom(); //initializes the class HospitalRoom
  lr=new LivingRoom(); //initializes the class LivingRoom

  hr.brownNoise(); //plays brown noise
}

void draw() {
  if (roomCounter==0) { //if the room counter is equal to 0
    hr.displayHR();
    hr.boundaries();
    hr.bedBoundaries();
    hr.doorInteraction();
    hr.diaryBoundaries();
    hr.diaryInteraction();
    w.displayWalter();
    hr.bedBoundaries();
  }
  if (roomCounter==1) { //if the room counter is equal to 1
    lr.displayLR();
    w.walterScene1();
    w.displayWalter();
  }
  w.walterMove();
  roomTransition();
}

void roomTransition() { //allows transparency transitions between rooms
  if (increaseTransparency) { //if the transparency is to be increased
    tint(255, transparency); //tints the room with transparency
    image(whiteScreen, 0, 0, width, height); //display a white screen
    transparency+=transparencyChange; //increase the transparency by transparencyChange intervals
  }
  if (transparency > transparencyMax) { //if the transparency is greater than the maximum transparency
    decreaseTransparency=true; //the transparency begins to decrease
    roomCounter++; //the room counter increases by 1
  }
  if (decreaseTransparency) { //if the transparency is to be decreased
    increaseTransparency=false; //the transparency stops increasing
    tint(255, transparency); //tints the room with transparency
    image(whiteScreen, 0, 0, width, height); //display a white screen
    transparency-=transparencyChange; //decrease the transparency by transparencyChange intervals
    if (transparency==0) { //if there is no transparency
      noTint(); //there is no tint
      noMove=false; //Walter can move
    }
  }
}

void keyPressed() {
  if (noMove==false) //if Walter can move
    w.walterKeyPressed();

  hr.hrKeyPressed();
}

void keyReleased() {
  w.walterKeyReleased();
}
