import processing.sound.*; //allows sound to be imported into Processing
SoundFile brownNoise; //background noise for the hospital room
SoundFile pleasantMemory; //background music for scene 1
SoundFile darkPast; //background music for scene 2
SoundFile knock; //knock for scene 1
SoundFile lullaby; //background music for scene 3
SoundFile burden; //last background music

import gifAnimation.*; //allows gifs to be imported into Processing
Gif diaryText; //diary text gif to display a typewriter effect

Walter w; //contstructs 1 object from the Walter class with w parameters
HospitalRoom hr; //constructs 1 object from the class HospitalRoom with hr parameters
LivingRoom lr; //constructs 1 object from the LivingRoom class with lr parameters
Outside o; //constructs 1 object from the Outside class with o parameters
Kitchen k; //constructs 1 object from the Kitchen class with k parameters
Hall h; //contructs 1 object from the Hall class with h parameters
Scene1 s1; //contructs 1 object from the Scene1 class with s1 parameters
Scene2 s2; //constructs 1 object from the Scene2 class with s2 parameters
Scene3 s3; //constructs 1 objecct from the Scene3 class with s3 parameters
BlankRoom br; //constructs 1 object from the BlankRoom class with br parameters
Backyard b; //constructs 1 object from the Backyard class with b parameters
Lindsay l; //constructs 1 object from the Lindsay class with l parameters
Gregory g; //constructs 1 object from the Gregory class with g parameters
Nurse n; //constructs 1 object from the Nurse class with n parameters
MasterBedroom mb; //constructs 1 object from the MasterBedroom class with mb parameters
GregoryBedroom gb; //constructs 1 object from the GregoryBedroom class with gb parameters
Bathroom bath; //constructs 1 object from the Bathroom class with bath parameters

PImage titleScreen; //image of the title screen
PImage endScreen; //image of the end screen

int roomCounter; //counter to display each room
int changeCounter; //counter to display Walter's scene 1 sprites
int soundCounter; //counter to play different background noise/music

boolean noMove; //boolean to prevent Walter from moving
boolean endGame; //boolean to state when the game ends

PImage whiteScreen; //image of a white screen
PImage blackScreen; //image of a black screen
int transparency; //stores the transparency
int wTransparencyChange=4; //changes the white transparency in increments
int bTransparencyChange=10; //changes the black transparency in increments
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
boolean displayHall; //boolean to determine if the hall is displayed
boolean changeHall; //boolean to determine if the screen is to be changed to the hall
boolean displayBR; //boolean to determine if the blank room is displayed
boolean changeBR; //boolean to determine if the screen is to be changed to the blank room
boolean displayBackyard; //boolean to determine if the backyard is displayed
boolean changeBackyard; //boolean to determine if the screen is to be changed to the backyard
boolean displayMB; //boolean to determine if the master bedroom is displayed
boolean changeMB; //boolean to determine if the screen is to be changed to the master bedroom
boolean displayGB; //boolean to determine if Gregory's bedroom is displayed
boolean changeGB; //boolean to determine if the screen is to be changed to Gregory's bedroom
boolean displayBath; //boolean to determine id the bathroom is displayed
boolean changeBath; //boolean to determine if the screen is to be changed to the bathroom

void setup() {
  size(1920, 1080); //sets the run window to 1920x1080
  brownNoise=new SoundFile(this, "brownNoise.wav");
  pleasantMemory=new SoundFile(this, "pleasantMemory.wav");
  darkPast=new SoundFile(this, "darkPast.wav");
  knock=new SoundFile(this, "knock.wav");
  lullaby=new SoundFile(this, "lullaby.wav");
  burden=new SoundFile(this, "burden.wav");

  titleScreen=loadImage("titleScreen.png");
  endScreen=loadImage("endScreen.png");
  whiteScreen=loadImage("whiteScreen.png");
  blackScreen=loadImage("blackScreen.png");

  w=new Walter(); //initializes the class Walter
  hr=new HospitalRoom(); //initializes the class HospitalRoom
  lr=new LivingRoom(); //initializes the class LivingRoom
  o=new Outside(); //initializes the class Outside
  k=new Kitchen(); //initializes the class Kitchen
  h=new Hall(); //initializes the class Hall
  br=new BlankRoom(); //initializes the class BlankRoom
  b=new Backyard(); //initializes the class Backyard
  l=new Lindsay(); //initializes the class Lindsay
  g=new Gregory(); //innitializes the class Gregory
  n=new Nurse(); //initializes the class Nurse
  mb=new MasterBedroom(); //initializes the class MasterBedroom
  gb=new GregoryBedroom(); //initializes the class GregoryBedroom
  bath=new Bathroom(); //initializes the class Bathroom
  s1=new Scene1(); //initializes the class Scene1
  s2=new Scene2(); //initializes the class Scene2
  s3=new Scene3(); //initialzes the class Scene3
}

void draw() {
  if (endGame==false) { //if the game has not ended
    sound();
    if (roomCounter==0) { //if the room counter has not increased
      image(titleScreen, 0, 0, width, height); //display the title screen
      noMove=true; //Walter cannot move
    }

    if (displayOutside==false && displayKitchen==false && displayHall==false && displayBR==false && displayBackyard==false && displayMB==false && displayGB==false && displayBath==false) { //if none of the side rooms are displayed
      if (roomCounter==1 || roomCounter==3 || roomCounter==5 || roomCounter==7) { //if Walter is in the hospital room
        hr.display();
        hr.boundaries();
        hr.bedBoundaries();
        hr.doorInteraction();
        hr.diaryBoundaries();
        hr.diaryInteraction();
        w.displayWalter();
        hr.bedBoundaries();
        if (roomCounter==3 || roomCounter==7) //if Walter is in the hospital room for the second or fourth time
          n.firstScene();
      }
      if (roomCounter==2 || roomCounter==4 || roomCounter==6) { //if Walter is in his house
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
        if (roomCounter==6) { //if Walter is in the living room for the third time
          s3.playScene3();
          l.displayLindsay();
          g.displayGregory();
        }
      }
    }

    if (displayOutside) { //if the outside is displayed
      o.display();
      o.boundaries();
      o.leave();
      w.displayWalter();
    } else if (displayHall) { //if the hall is displayed
      h.display();
      h.boundaries();
      w.displayWalter();
      h.leave();
    } else  if (displayKitchen) { //if the kitchen is displayed
      k.display();
      k.boundaries();
      k.leave();
      if (roomCounter==2) { //if the kitchen counter is equal to 1
        s1.playScene1a();
        g.displayGregory();
        l.displayLindsay();
      } else {
        k.counterBoundaries();
        k.cupboardBoundaries();
        k.tableBoundaries();
        k.chairBoundaries();
        k.miscellaneousBoundaries();
      }
      w.displayWalter();
    } else if (displayBR) { //if the blank room is displayed
      br.display();
      br.boundaries();
      br.leave();
      w.displayWalter();
    } else if (displayMB) { //if the master bedroom is displayed
      mb.display();
      mb.boundaries();
      mb.sTableBoundaries();
      mb.bookcaseBoundaries();
      mb.dresserBoundaries();
      mb.leave();
      w.displayWalter();
      mb.displayFurniture();
      mb.bedBoundaries();
    } else if (displayGB) { //if Gregory's bedroom is displayed
      gb.display();
      gb.boundaries();
      gb.bedBoundaries();
      gb.bearBoundaries();
      gb.couchBoundaries();
      gb.bookcaseBoundaries();
      gb.leave();
      w.displayWalter();
      gb.displayFurniture();
    } else if (displayBackyard) { //if the backyard is displayed
      b.display();
      b.boundaries();
      b.leave();
      w.displayWalter();
      s2.playScene2a();
    } else if (displayBath) { //if the bathroom is displayed
      bath.display();
      bath.boundaries();
      bath.sinkBoundaries();
      bath.leave();
      w.displayWalter();
    }
    if (k.kitchenCounter!=1 && noMove==false) //if the kitchen counter is not equal to 1 and Walter can move
      w.walterMove();
  }
  displayEnd();
  roomTransition();
  changeSprites();
}

void displayEnd() { //displays the end screen
  if (endGame) //if the game ends
    image(endScreen, 0, 0, width, height); //display the end screen
}

void changeSprites() {
  if (roomCounter == 1 || roomCounter == 3 || roomCounter == 5 || roomCounter == 7) //if Walter is in the hospital room
    w.walterHR();
  else if (roomCounter == 2) //if Walter is in the living room for the first time
    w.walterScene1();
  else if (roomCounter == 4) //if Walter is in the living room for the second time
    w.walterScene2();
  else if (roomCounter == 6) //if Walter is in the living room for the third time
    w.walterScene3();
  w.walterChange();
}

void roomTransition() { //allows transparency transitions between rooms
  if (increaseTransparency) { //if the transparency is to be increased
    noMove=true; //Walter cannot move
    tint(255, transparency); //tints the room with transparency

    if (whiteTransition) { //if the transition is white
      image(whiteScreen, 0, 0, width, height); //display a white screen
      transparency+=wTransparencyChange; //increase the transparency by transparencyChange intervals
    } else if (blackTransition) { //if the transition is black
      image(blackScreen, 0, 0, width, height); //display a black screen
      transparency+=bTransparencyChange; //increase the transparency by transparencyChange intervals
    }
  }
  if (transparency>transparencyMax) { //if the transparency is greater than the maximum transparency
    decreaseTransparency=true; //the transparency begins to decrease
    if (whiteTransition) { //if the transition is white
      roomCounter++; //increase the room counter
      w.wPressed=false; //Walter is not moving upwards
      w.aPressed=false; //Walter is not moving to the left
      w.sPressed=false; //Walter is not moving downwards
      w.dPressed=false; //Walter is not moving to the right
      w.idle=true; //Walter is not moving
      if (roomCounter==3) { //if the hospital room is displayed for the second time
        displayKitchen=false; //the kitchen is no longer displayed
        w.sit=false; //Walter is no longer sitting
        k.kitchenCounter++; //the first scene is no longer displayed
      } else if (roomCounter==5) { //if the hospital room is displayed for the third time
        n.nurseProgress=0; //resets the nurse cutscene progress
        displayBackyard=false; //the backyard is no longer displayed
      } else if (roomCounter==6) { //if the living room is displayed for the third time
        displayMB=true; //the master bedroom is displayed
        w.sleepMBR=true; //Walter is sleeping in the right side of the master bed
      }
      if (roomCounter==3 || roomCounter==5 || roomCounter==7) {//if Walter is in the hospital room for the second, third, or fourth time
        w.sleepHR=true; //Walter is sleeping in the hospital room
        if (roomCounter==7) {//if Walter is in the hospital room for the fourth time
          n.nurseX=width/12*7;
          n.nurseY=height/4; //the nurse is placed beside Walter's bed
        }
      }
    } else if (blackTransition) { //if the transition is black
      w.wPressed=false; //Walter is not moving upwards
      w.aPressed=false; //Walter is not moving to the left
      w.sPressed=false; //Walter is not moving downwards
      w.dPressed=false; //Walter is not moving to the right
      w.idle=true; //Walter is not moving

      if (roomCounter==7) { //if Walter is in the hospital for the last time
        endGame=true; //the game ends
      }

      if (changeOutside) { //if Walter is not outside
        displayOutside=true; //the outside is displayed
        o.come();
        changeOutside=false; //the screen is no longer being changed to the outside
      } else if (changeLR) { //if the screen is to be changed to the living room
        lr.come();
        displayOutside=false; //the outside is not displayed
        displayKitchen=false; //the kitchen is not displayed
        displayHall=false; //the hall is not displayed
        changeLR=false; //the screen is no longer being changed to the living room
      } else if (changeKitchen) { //if the screen is to be changed to the kitchen
        displayKitchen=true; //the kitchen is displayed
        displayBackyard=false; //the backyard is not displayed
        if (roomCounter==2) //if the living room is displayed for the first time
          k.kitchenCounter=1; //the kitchen counter is increased
        k.come();
        changeKitchen=false; //the screen is no longer being changed to the kitchen
      } else if (changeHall) { //if the screen is to be changed to the hall
        displayHall=true; //the hall is displayed
        displayBR=false; //the blank room is no longer displayed
        displayMB=false; //the master bedroom is no longer displayed
        displayBath=false; //the bathroom is no longer displayed
        displayGB=false; //Gregory's bedroom is no longer displayed
        h.come();
        changeHall=false; //the screen is no longer being changed to the hall
      } else if (changeBR) { //if the screen is to be changed to the blank room
        displayBR=true; //the blank room is displayed
        displayHall=false; //the hall is no longer displayed
        br.come();
        changeBR=false; //the screen is no longer being changed to the blank room
      } else if (changeMB) { //if the screen is to be changed to the master bedroom
        displayMB=true; //the master bedroom is displayed
        displayHall=false; //the hall is no longer displayed
        mb.come();
        changeMB=false; //the screen is no longer being changed to the master bedroom
      } else if (changeGB) { //if the screen is to be changed to Gregory's bedroom
        displayGB=true; //Gregory's bedroom is displayed
        displayHall=false; //the hall is no longer displayed
        gb.come();
        changeGB=false; //the screen is no longer being changed to Gregory's bedroom
      } else if (changeBackyard) { //if the screen is to be changed to the backyard
        if (roomCounter==4) //if the living room is displayed for the second time
          w.wasdKey=1; //Walter is facing back
        displayBackyard=true; //the backyard is displayed
        s2.gregoryBackyard=true; //gregory is in the backyard
        displayKitchen=false; //the kitchen is not displayed
        b.come();
        changeBackyard=false; //the screen is no longer being changed to the blank room
      } else if (changeBath) { //if the screen is to be changed to the bathroom
        displayBath=true; //the bathroom is displayed
        displayHall=false; //the hall is no longer displayed
        bath.come();
        changeBath=false; //the screen is no longer being changed to the bathroom
      }
    }
  }
  if (decreaseTransparency) { //if the transparency is to be decreased
    increaseTransparency=false; //the transparency stops increasing
    tint(255, transparency); //tints the room with transparency

    if (whiteTransition) { //if the transition is white
      image(whiteScreen, 0, 0, width, height); //display a white screen
      transparency-=wTransparencyChange; //decrease the transparency by transparencyChange intervals
    } else if (blackTransition) { //if the transition is black
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

void sound () { //plays all background music
  brownNoise.amp(0.2); //lowers the volume of the brown noise to 0.2 of its volume
  pleasantMemory.amp(0.1); //lowers the volume of the scene 1 music to 0.1 of its volume
  darkPast.amp(0.1); //lowers the volume of the scene 2 music to 0.1 of its volume
  lullaby.amp(0.1); //lowers the volume of the scene 3 music to 0.1 of its volume
  burden.amp(0.1); //lowers the volume of the last music to 0.1 of its volume

  if (roomCounter==1 && soundCounter<2) //if the hospital room is displayed and the sound counter is less than 2
    soundCounter++; //increase the sound counter
  else if (roomCounter==2 && soundCounter<4) //if the first scene is displayed and the sound counter is less than 4
    soundCounter++; //increase the sound counter
  else if (roomCounter==3 && soundCounter<6) //if the hospital room is displayed and the sound counter is less than 6
    soundCounter++; //increase the sound counter
  else if (roomCounter==4 && soundCounter<8) //if the second scene is displayed and the sound counter is less than 8
    soundCounter++; //increase the sound counter
  else if (roomCounter==5 && soundCounter<10) //if the hospital room is displayed and the sound counter is less than 10
    soundCounter++; //increase the sound counter
  else if (roomCounter==6 && soundCounter<12) //if the third scene is displayed and the sound counter is less than 12
    soundCounter++; //increase the sound counter

  if (soundCounter==1 || soundCounter==5 || soundCounter==9) { //if the sound counter is equal to 1 or 5
    pleasantMemory.stop(); //stop playing Pleasant Memory
    darkPast.stop(); //stop playing darkPast
    brownNoise.play(); //plays the noise for the hospital room
    brownNoise.loop(); //when the brown noise ends, it starts playing again
    soundCounter++; //increase the sound counter
  } else if (soundCounter==3) { //if the sound counter is equal to 3
    brownNoise.stop(); //stop playing the brown noise
    pleasantMemory.play(); //play the scene 1 music
    pleasantMemory.loop(); //when the scene 1 music ends, it starts playing again
    soundCounter++; //increase the sound counter
  } else if (soundCounter==7) { //if the sound counter is equal to 7
    brownNoise.stop(); //stop playing the brown noise
    darkPast.play(); //play the scene 2 music
    darkPast.loop(); //when the scene 2 music ends, it starts playing again
    soundCounter++; //increase the sound counter
  } else if (soundCounter==11) { //if the sound counter is equal to 11
    brownNoise.stop(); //stop playing the brown noise
    lullaby.play(); //play the scene 3 music
    lullaby.loop(); //when the scene 3 music ends, it starts playing again
    soundCounter++; //increase the sound counter
  } else if (soundCounter==13) { //if the sound counter is equal to 13
    lullaby.stop(); //stop playing the scene 3 music
    burden.play(); //play the last music
    burden.loop(); //when the last music ends, it starts playing again
    soundCounter++; //increase the sound counter
  } else if (soundCounter==15)  //if the sound counter is equal to 15
    burden.stop(); //the last music stops playing
}

void keyPressed() {
  if (roomCounter==0 && key==ENTER) { //if the room counter is at 0 and 'ENTER' is pressed
    increaseTransparency=true; //the room transition begins
    whiteTransition=true; //the white room transition begins
  }

  if (noMove==false) //if Walter is not allowed to move
    w.walterKeyPressed();

  if (roomCounter==1 || roomCounter==3 || roomCounter==5) { //if the hopsital room is displayed
    hr.diaryKeyPressed();
    hr.doorKeyPressed();
  }
  if (k.kitchenCounter==1) //if the first scene is displayed
    s1.scene1KeyPressed();

  if (roomCounter==6 && displayOutside==false && displayKitchen==false && displayHall==false && displayBR==false && displayBackyard==false && displayMB==false && displayGB==false && displayBath==false) //if Walter is in the living room for the third time
    s3.scene3KeyPressed();
}

void keyReleased() {
  if (noMove==false) //if Walter is not allowed to move
    w.walterKeyReleased();
}
