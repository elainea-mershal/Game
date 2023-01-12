import processing.sound.*; //allows sound to be imported into Processing
SoundFile brownNoise; //background noise for the hospital room

import gifAnimation.*; //allows gifs to be imported into Processing
Gif doorText; //door text gif to display a typewriter effect
Gif doorAText; //angry door text gif to display a typewriter effect
Gif diaryText; //diary text gif to display a typewriter effect

Walter w; //contstructs 1 object from the Walter class with w parameters
HospitalRoom hr; //constructs 1 object from the class HospitalRoom with hr parameters
LivingRoom lr; //constructs 1 object from the LivingRoom class with lr parameters
Outside o; //constructs 1 object from the Outside class with o parameters
Kitchen k; //constructs 1 object from the Kitchen class with k parameters

int roomCounter; //counter to display each room
int changeCounter; //counter to display Walter's different sprites

boolean noMove; //boolean to prevent Walter from moving

PImage whiteScreen; //image of a white screen
PImage blackScreen; //image of a black screen
int transparency; //stores the transparency
int wTransparencyChange=4; //changes the transparency in increments
int bTransparencyChange=10;
boolean increaseTransparency; //boolean to increase the transparency
boolean decreaseTransparency; //boolean to decrease the transparency
int transparencyMax=280; //maximum transparency
boolean whiteTransition; //boolean to determine if the transition is white
boolean blackTransition; //boolean to determine if the transition is black

boolean displayOutside; //boolean to display the outside


void setup() {
  fullScreen(); //sets the run window to fullscreen
  brownNoise=new SoundFile(this, "brownNoise.wav");
  doorText=new Gif(this, "doorText.gif");
  doorAText=new Gif(this, "doorAText.gif");
  diaryText=new Gif(this, "diaryText.gif");
  whiteScreen=loadImage("whiteScreen.png");
  blackScreen=loadImage("blackScreen.png");

  w=new Walter(); //initializes the class Walter
  hr=new HospitalRoom(); //initializes the class HospitalRoom
  lr=new LivingRoom(); //initializes the class LivingRoom
  o=new Outside(); //initializes the class Outside
  k=new Kitchen(); //initializes the class Kitchen

  hr.brownNoise();
}

void draw() {
  println(hr.bedBoundaryLX);
  if (displayOutside==false) {
    if (roomCounter==0) { //if the room counter is equal to 0
      hr.display();
      hr.boundaries();
      hr.bedBoundaries();
      hr.doorInteraction();
      hr.diaryBoundaries();
      hr.diaryInteraction();
      w.displayWalter();
      hr.bedBoundaries();
    }
    if (roomCounter==1) { //if the room counter is equal to 1
      lr.display();
      lr.boundaries();
      lr.fireBoundaries();
      lr.couchBoundaries();
      lr.cTableBoundaries();
      lr.tvBoundaries();
      lr.ktableBoundaries();
      lr.kchairBoundaries();
      lr.bookcaseBoundaries();
      lr.chairLBoundaries();
      lr.chairRBoundaries();
      lr.seatBoundaries();
      lr.leave();
      lr.come();
      w.displayWalter();
      lr.displayFurniture();
      changeCounter++;
    }
    if (changeCounter==1) {
      w.walterScene1();
      w.walterHR();
      changeCounter++;
    }
  }
  if (displayOutside) {
    o.display();
    o.boundaries();
    o.leave();
    o.come();
    w.displayWalter();
  }
  w.walterMove();
  roomTransition();
}

void roomTransition() { //allows transparency transitions between rooms
  if (increaseTransparency) { //if the transparency is to be increased
    tint(255, transparency); //tints the room with transparency

    if (whiteTransition) { //if the transition is white
      image(whiteScreen, 0, 0, width, height); //display a white screen
      transparency+=wTransparencyChange; //increase the transparency by transparencyChange intervals
    }

    if (blackTransition) { //if the transition is black
      image(blackScreen, 0, 0, width, height); //display a black screen
      transparency+=bTransparencyChange; //increase the transparency by transparencyChange intervals
    }
  }
  if (transparency>transparencyMax) { //if the transparency is greater than the maximum transparency
    decreaseTransparency=true; //the transparency begins to decrease
    if (whiteTransition) //if the transition is white
      roomCounter++; //increase the room counter
    if (blackTransition) { //if the transition is black
      if (displayOutside==false) { //if Walter is not outside
        displayOutside=true; //display the outside
      } else if (displayOutside) { //if Walter is outside
        displayOutside=false; //Walter is no longer outside
        lr.goIn=true; //Walter is going inside
      }
    }
  }
  if (decreaseTransparency) { //if the transparency is to be decreased
    increaseTransparency=false; //the transparency stops increasing
    tint(255, transparency); //tints the room with transparency

    if (whiteTransition) { //if the transition is white
      image(whiteScreen, 0, 0, width, height); //display a white screen
      transparency-=wTransparencyChange; //decrease the transparency by transparencyChange intervals
    }

    if (blackTransition) { //if the transition is black
      image(blackScreen, 0, 0, width, height); //display a black image
      transparency-=bTransparencyChange; //decrease the transparency by transparencyChange intervals
    }

    if (transparency<=0) { //if there is no transparency
      decreaseTransparency=false; //the transparency is no longer decreasing
      transparency=0; //there is no transparency
      noTint(); //there is no tint
      noMove=false; //Walter can move
      blackTransition=false; //there is no black transition
      whiteTransition=false; //there is no white transition
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
