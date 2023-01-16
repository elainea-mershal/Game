import processing.sound.*; //allows sound to be imported into Processing
SoundFile brownNoise; //background noise for the hospital room
SoundFile pleasantMemory; //background music for scene 1

import gifAnimation.*; //allows gifs to be imported into Processing
Gif diaryText; //diary text gif to display a typewriter effect

Walter w; //contstructs 1 object from the Walter class with w parameters
HospitalRoom hr; //constructs 1 object from the class HospitalRoom with hr parameters
LivingRoom lr; //constructs 1 object from the LivingRoom class with lr parameters
Outside o; //constructs 1 object from the Outside class with o parameters
Kitchen k; //constructs 1 object from the Kitchen class with k parameters
Hall h; //contructs 1 object from the Hall class with h parameters
Scene1 s1; //contructs 1 object from the Scene1 class with s1 parameters

PImage titleScreen; //image of the title screen

int roomCounter; //counter to display each room
int change1Counter; //counter to display Walter's scene 1 sprites
int soundCounter; //counter to play different background noise/music

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

boolean changeLR; //boolean to determine if the screen is to be changed to the living room
boolean displayOutside; //boolean to determine if the outside is displayed
boolean changeOutside; //boolean to determine if the screen is to be changed to the outside
boolean displayKitchen; //boolean to dtermine if the kitchen is displayed
boolean changeKitchen; //boolean to determine if the screen is to be changed to the kitchen
boolean displayHall; //boolean to determine of the hall is displayed
boolean changeHall; //boolean to determine if the screen is to be changed to the hall

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
  h=new Hall(); //initializes the class Hall
  s1=new Scene1(); //initializes the class Scene1
}

void draw() {
  sound();

  if (roomCounter==0) { //if the room counter has not increased
    image(titleScreen, 0, 0, width, height); //display the title screen
    noMove=true; //Walter cannot move
  }

  if (displayOutside==false && displayKitchen==false && displayHall==false) { //if none of the side rooms are displayed
    if (roomCounter==1) { //if the room counter is equal to 1
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
      change1Counter++; //increase Walter's scene 1 appearance change counter
    }
    if (change1Counter==1) { //if the change Walter's appearance counter is equal to 1
      w.walterScene1();
      w.walterHR();
    }
  }

  if (displayOutside) { //if the outside is displayed
    o.display();
    o.boundaries();
    o.leave();
    w.displayWalter();
  }

  if (displayHall) { //if the hall is displayed
    h.display();
    h.boundaries();
    w.displayWalter();
    h.leave();
  }

  if (displayKitchen) { //if the kitchen is displayed
    k.display();
    if (k.kitchenCounter==1) //if hte kitchen counter is equal to 1
      s1.playScene1();
    w.displayWalter();
  }
  if (k.kitchenCounter!=1 && noMove==false) //if the kitchen counter is not equal to 1 and Walter can move
    w.walterMove();
  roomTransition();
}

void roomTransition() { //allows transparency transitions between rooms
  if (increaseTransparency) { //if the transparency is to be increased
    noMove=true; //Walter cannot move
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
        displayOutside=true; //the outside is displayed
        o.come();
        changeOutside=false; //the screen is no longer being changed to the outside
      }
      if (changeLR) { //if the screen is to be changed to the living room
        lr.come();
        displayOutside=false; //the outside is not displayed
        displayKitchen=false; //the kitchen is not displayed
        displayHall=false; //the hall is not displayed
        changeLR=false; //the screen is no longer being changed to the living room
      }
      if (changeKitchen) { //if the screen is to be changed to the kitchen
        displayKitchen=true; //the kitchen is displayed
        k.kitchenCounter++; //the kitchen counter is increased
        k.come();
        changeKitchen=false; //the screen is no longer being changed to the kitchen
      }
      if (changeHall) { //if the screen is to be changed to the hall
        displayHall=true; //the hall is displayed
        h.come();
        changeHall=false; //the screen is no longer being changed to the hall
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
  brownNoise.amp(0.2); //lowers the volume of the brown noise to 0.2 of its volume
  pleasantMemory.amp(0.1); //lowers the volume of the scene 1 music to 0.1 of its volume

  if (roomCounter==1 && soundCounter<2) //if the hospital room is displayed and the sound counter is less than 2
    soundCounter++; //increase the sound counter
  if (roomCounter==2 && soundCounter<4) //if the first scene is dispalyed and the sound counter is less than 4
    soundCounter++; //increase the sound counter

  if (soundCounter==1) { //if hte sound counter is equal to 1
    brownNoise.play(); //plays the noise for the hospital room
    brownNoise.loop(); //when the brown noise ends, it starts playing again
    soundCounter++; //increase the sound counter
  } else if (soundCounter==3) { //if the sound counter is equal to 3
    brownNoise.stop(); //stop playing the brown noise
    pleasantMemory.play(); //play the scene 1 music
    pleasantMemory.loop(); //when the scene 1 music ends, it starts playing again
    soundCounter++; //increase the sound counter
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
