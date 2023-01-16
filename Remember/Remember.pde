import processing.sound.*; //allows sound to be imported into Processing
SoundFile brownNoise; //background noise for the hospital room
SoundFile pleasantMemory;

import gifAnimation.*; //allows gifs to be imported into Processing
Gif diaryText; //diary text gif to display a typewriter effect

Walter w; //contstructs 1 object from the Walter class with w parameters
HospitalRoom hr; //constructs 1 object from the class HospitalRoom with hr parameters
LivingRoom lr; //constructs 1 object from the LivingRoom class with lr parameters
Outside o; //constructs 1 object from the Outside class with o parameters
Kitchen k; //constructs 1 object from the Kitchen class with k parameters
Hall h;

PImage titleScreen; //image of the title screen

int roomCounter; //counter to display each room
int changeCounter; //counter to display Walter's different sprites
int roomID; //stores a value to display certain side rooms

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

boolean isOutside; //boolean to determine if walter is outside
boolean inKitchen; //boolean to determine if walter is in the kitchen
boolean inHallway; //boolean to determine if walter is in the hallway
boolean displayOutside;
boolean changeOutside;
boolean displayKitchen;
boolean changeKitchen;
boolean changeHall;
boolean displayHall;
boolean changeLR;

int soundCounter;

void setup() {
  fullScreen(); //sets the run window to fullscreen
  brownNoise=new SoundFile(this, "brownNoise.wav");
  pleasantMemory=new SoundFile(this, "pleasantMemory.wav");
  diaryText=new Gif(this, "diaryText.gif");
  titleScreen=loadImage("titleScreen.png");
  whiteScreen=loadImage("whiteScreen.png");
  blackScreen=loadImage("blackScreen.png");

  w=new Walter(); //initializes the class Walter
  hr=new HospitalRoom(); //initializes the class HospitalRoom
  lr=new LivingRoom(); //initializes the class LivingRoom
  o=new Outside(); //initializes the class Outside
  k=new Kitchen(); //initializes the class Kitchen
  h=new Hall();
}

void draw() {
  println(transparency);
  sound();

  if (roomCounter==0) //if the room counter has not increased
    image(titleScreen, 0, 0, width, height); //display the title screen

  if (displayOutside==false && displayKitchen==false && displayHall==false) {
    if (roomCounter==1) { //if the room counter is equal to 0
      hr.display();
      hr.boundaries();
      hr.bedBoundaries();
      hr.doorInteraction();
      hr.diaryBoundaries();
      hr.diaryInteraction();
      w.displayWalter();
      hr.bedBoundaries();
    }
    if (roomCounter==2) { //if the room counter is equal to 2
      lr.display();
      lr.boundaries();
      lr.fireBoundaries();
      lr.couchBoundaries();
      lr.cTableBoundaries();
      lr.tvBoundaries();
      lr.kTableBoundaries();
      lr.kchairBoundaries();
      lr.bookcaseBoundaries();
      lr.chairLBoundaries();
      lr.chairRBoundaries();
      lr.seatBoundaries();
      lr.leave();
      if (w.sit==false) //if Walter is not sitting
        w.displayWalter();
      lr.displayFurniture();
      lr.chairSit();
      changeCounter++;
    }
    if (changeCounter==1) { //if the change Walter's appearance counter is equal to 1
      w.walterScene1();
      w.walterHR();
      changeCounter++; //the counter to change Walter's appearance is increased by 1
    }
  }

  if (displayOutside) { //if a side room is displayed
    o.display();
    o.boundaries();
    o.leave();
    w.displayWalter();
  }

  if (displayHall) {
    h.display();
    h.boundaries();
    w.displayWalter();
    h.leave();
  }

  if (displayKitchen) {
    k.display();
    if (k.kitchenCounter==1)
      k.scene1();
    w.displayWalter();
  }
  if (k.kitchenCounter!=1 && noMove==false)
    w.walterMove();
  roomTransition();
}

void roomTransition() { //allows transparency transitions between rooms
  if (increaseTransparency) { //if the transparency is to be increased
    noMove=true;
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
      if (changeOutside) { //if Walter is not outside
        displayOutside=true;
        o.come();
        changeOutside=false;
      }
      if (changeLR) {
        lr.come();
        displayOutside=false;
        displayKitchen=false;
        displayHall=false;
        changeLR=false;
      }
      if (changeKitchen) {
        displayKitchen=true;
        k.kitchenCounter++;
        k.come();
        changeKitchen=false;
      }
      if (changeHall) {
        displayHall=true;
        h.come();
        changeHall=false;
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

void sound () { //plays brown noise in the hospital room
  brownNoise.amp(0.2); //lowers the volume of the hospital room noise to a quarter of its volume
  pleasantMemory.amp(0.1);

  if (roomCounter==1 && soundCounter<2)
    soundCounter++;
  if (roomCounter==2 && soundCounter<4)
    soundCounter++;

  if (soundCounter==1) {
    brownNoise.play(); //plays the noise for the hospital room
    brownNoise.loop(); //when the hospital room noise ends, it starts playing again
    soundCounter++;
  } else if (soundCounter==3) {
    brownNoise.stop();
    pleasantMemory.play();
    pleasantMemory.loop();
    soundCounter++;
  }
}

void keyPressed() {
  if (roomCounter==0 && key==ENTER) { //if the room counter is at 0 and 'ENTER' is pressed
    increaseTransparency=true; //the room transition begins
    whiteTransition=true; //the white room transition begins
  }

  if (noMove==false) //if Walter is not allowed to move
    w.walterKeyPressed();

  if (roomCounter==1) { //if the room counter is equal to 1
    hr.diaryKeyPressed();
    hr.doorKeyPressed();
  }
}

void keyReleased() {
  w.walterKeyReleased();
}
