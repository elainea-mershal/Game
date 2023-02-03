class Walter {
  PImage walterSleepHR; //image of Walter sleeping in the hospital room
  PImage walterSleepMB1; //image of Walter sleeping in the master bedroom
  PImage walterSitL1; //image of Walter sitting facing left
  PImage walterSitR1; //image of Walter sitting facing right
  PImage walterSitB; //image of Walter sitting facing back
  PImage fWalter; //sprite sheet of Walter facing forwards;
  PImage[] fSprites = new PImage[2];  //array to run Walter's forward facing idle animation
  PImage lWalter; //sprite sheet of Walter facing left
  PImage[] lSprites = new PImage[2]; //array to run Walter's left facing idle animation
  PImage rWalter; //sprite sheet of Walter facing right
  PImage[] rSprites = new PImage[2]; //array to run Walter's right facing idle animation
  PImage bWalter; //sprite sheet of Walter facing backwards
  PImage[] bSprites = new PImage[2]; //array to run Walter's back facing idle animation
  PImage walterF; //sprite sheet of Walter walking downwards
  PImage[] spritesF = new PImage[4]; //array to run Walter's downwards walking animation
  PImage walterL; //sprite sheet of Walter walking left
  PImage[] spritesL = new PImage[4]; //array to run Walter's left walking animation
  PImage walterR; //sprite sheet of Walter walking right
  PImage[] spritesR = new PImage[4]; //array to run Walter's right walking animation
  PImage walterB; //sprite sheet of Walter walking upwards
  PImage[] spritesB = new PImage[4]; //array to run Walter's upwards walking animation

  int originalW=64; //original width of Walter
  int originalH=140; //original height of Walter
  float walterW=64; //Walter's width
  float walterH=140; //Walter's height
  float walterBYX=1222; //Walter's X position in the backyard
  float walterBYY=569; //Walter's Y position in the backyard
  float walterX, walterY; //x and y coordinates of Walter
  float wSpeedX=3; //horizontal speed of Walter
  float wSpeedY=3; //vertical speed of Walter
  float hrSleepX=1215; //sleeping x-coordinate for Walter in the hospital room
  float hrSleepY=250; //sleeping y-coordinate for Walter in the hospital room
  float mblSleepX=895; //sleeping x-coordinate for Walter in the master bedroom on the left
  float mbrSleepX=961; //sleeping x-coordiante for Walter in the master bedroom on the right
  float mbSleepY=261; //sleeping y-coordiante for Walter in the master bedroom

  int wasdKey; //stores the last wasd key pressed

  float aSpeedI=0.03; //speed of Walter's idle animations
  float aSpeedW=0.05; //speed of Walter's walking animations
  float aCounter; //counter for Walter's animations

  boolean startGame; //boolean to determine if the game has started
  boolean wPressed, aPressed, sPressed, dPressed; //booleans for if keys 'w', 'a', 's', and/or 'd' is being pressed
  boolean wLeft, wRight, wUp, wDown; //booleans to determine which direction Walter is facing
  boolean sleepHR; //boolean to determine whether or not Walter is sleeping in the hospital room
  boolean sleepMBL; //boolean to determine whether or not Walter is sleeping on the left side of the master bedroom
  boolean sleepMBR; //boolean to determine whether or not Walter is sleeping on the right side of the master bedroom
  boolean sit; //boolean to determine whether or not Walter is sitting
  boolean idle; //boolean to determine whether or not Walter is moving

  Walter() {
    walterSleepHR=loadImage("walterSleepHR.png");
    walterSleepMB1=loadImage("walterSleepMB1.png");
    walterSitL1=loadImage("walterSitL1.png");
    walterSitR1=loadImage("walterSitR1.png");
    walterSitB=loadImage("walterSitB.png");

    walterHR();
    walterChange();

    walterW=map(walterW, 0, 1920, 0, width);
    walterH=map(walterH, 0, 1080, 0, height);
    wSpeedX=map(wSpeedX, 0, 1920, 0, width);
    wSpeedY=map(wSpeedY, 0, 1080, 0, height);
    hrSleepX=map(hrSleepX, 0, 1920, 0, width);
    hrSleepY=map(hrSleepY, 0, 1080, 0, height);
    walterBYX=map(walterBYX, 0, 1920, 0, width);
    walterBYY=map(walterBYY, 0, 1080, 0, height);

    walterX=hrSleepX; //initial x-coordinate for Walter
    walterY=hrSleepY; //initial y-coordinate for Walter
  }

  void walterChange() { //initializes Walter's sprite animations
    for (int index=0; index<rSprites.length; index++) { //index variable has an initial value of 0, must be less than the length of rSprites array, and increases by increments of 1
      fSprites[index]=fWalter.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Walter's forward idle sprite sheet
      lSprites[index]=lWalter.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Walter's left idle sprite sheet
      rSprites[index]=rWalter.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Walter's right idle sprite sheet
      bSprites[index]=bWalter.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Walter's back idle sprite sheet
    }

    for (int index=0; index<spritesF.length; index++) { //index variable has an initial value of 0, must be less than the length of spritesF array, and increases by increments of 1
      spritesF[index]=walterF.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Walter's forward walking sprite sheet
      spritesL[index]=walterL.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Walter's left walking sprite sheet
      spritesR[index]=walterR.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Walter's right walking sprite sheet
      spritesB[index]=walterB.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Walter's back walking sprite sheet
    }
  }

  void walterHR() { //initializes Walter's hospital room sprite animations
    fWalter=loadImage("fWalter.png");
    lWalter=loadImage("lWalter.png");
    rWalter=loadImage("rWalter.png");
    bWalter=loadImage("bWalter.png");
    walterF=loadImage("walterF.png");
    walterL=loadImage("walterL.png");
    walterR=loadImage("walterR.png");
    walterB=loadImage("walterB.png");
  }

  void walterScene1() { //initializes Walter's scene 1 sprite animations
    fWalter=loadImage("fWalter1.png");
    bWalter=loadImage("bWalter1.png");
    lWalter=loadImage("lWalter1.png");
    rWalter=loadImage("rWalter1.png");
    walterF=loadImage("walterF1.png");
    walterB=loadImage("walterB1.png");
    walterL=loadImage("walterL1.png");
    walterR=loadImage("walterR1.png");
  }

  void walterScene2() { //initializes Walter's scene 2 sprite animations
    fWalter=loadImage("fWalter2.png");
    bWalter=loadImage("bWalter2.png");
    lWalter=loadImage("lWalter2.png");
    rWalter=loadImage("rWalter2.png");
    walterF=loadImage("walterF2.png");
    walterB=loadImage("walterB2.png");
    walterL=loadImage("walterL2.png");
    walterR=loadImage("walterR2.png");
  }

  void walterScene3() { //initializes Walter's scene 3 sprite animations
    fWalter=loadImage("fWalter3.png");
    bWalter=loadImage("bWalter3.png");
    lWalter=loadImage("lWalter3.png");
    rWalter=loadImage("rWalter3.png");
    walterF=loadImage("walterF3.png");
    walterB=loadImage("walterB3.png");
    walterL=loadImage("walterL3.png");
    walterR=loadImage("walterR3.png");
  }

  void displayWalter() { //displays Walter
    int indexI=floor(aCounter)%bSprites.length; //index variable to use each image in Walter's idle sprite sheets
    int indexW=floor(aCounter)%spritesF.length;  //index variable to use each image in Walter's walking sprite sheets

    if (sit==false) { //if Walter is not sitting
      if (startGame==false) //if the game has not started
        sleepHR=true; //Walter is sleeping

      if (sleepHR) { //if Walter is sleeping in the hospital room
        image(walterSleepHR, walterX, walterY, walterW, walterH); //display Walter sleeping in the hospital room
        walterX=hrSleepX; //sets Walter's sleeping x position in the hospital room
        walterY=hrSleepY; //sets Walter's sleeping y position in the hospital room
      } else if (sleepMBL) { //if Walter is sleeping on the left side in the amster bedroom
        image(walterSleepMB1, walterX, walterY, walterW, walterH); //display Walter sleeping in the master bedroom
        walterX=mblSleepX; //sets Walter's left sleeping x position in the master bedroom
        walterY=mbSleepY; //sets Walter's sleeping y position in the master bedroom
      } else if (sleepMBR) { //if Walter is sleeping on the right side in the master bedroom
        image(walterSleepMB1, walterX, walterY, walterW, walterH); //display Walter sleeping in the master bedroom
        walterX=mbrSleepX; //sets Walter's right sleeping x position in the master bedroom
        walterY=mbSleepY; //sets Walter's sleeping y position in the master bedroom
      } else if (wLeft==false&&wRight==false&&wUp==false&&wDown==false) //if Walter is not moving in any direction
        idle=true; //Walter is idle
      else if ((wasdKey==1&&idle) || (wasdKey==0&&idle)) //if 'w' was the last key pressed and Walter is idle
        image(bSprites[indexI], walterX, walterY, walterW, walterH); //display Walter facing backwards animation
      else if (wasdKey==2&&idle) //'a' was the last key pressed and Walter is idle
        image(lSprites[indexI], walterX, walterY, walterW, walterH); //display Walter facing left animation
      else if (wasdKey==3&&idle) //if 's' was the last key pressed and Walter is idle
        image(fSprites[indexI], walterX, walterY, walterW, walterH); //display Walter facing forwards animation
      else if (wasdKey==4&&idle) //if 'd' was the last key pressed and Walter is idle
        image(rSprites[indexI], walterX, walterY, walterW, walterH); //display Walter facing right animation
      else if (wPressed&&idle==false) //if Walter is moving upwards and is not idle
        image(spritesB[indexW], walterX, walterY, walterW, walterH); //displays Walter's walking animation moving upwards
      else if (aPressed&&idle==false) //if Walter is moving left and is not idle
        image(spritesL[indexW], walterX, walterY, walterW, walterH); //displays Walter's walking animation moving left
      else if (dPressed&&idle==false) //if Walter is moving right and is not idle
        image(spritesR[indexW], walterX, walterY, walterW, walterH); //displays Walter's walking animation moving right
      else if (sPressed&&idle==false) //if Walter is moving down and is not idle
        image(spritesF[indexW], walterX, walterY, walterW, walterH); //displays Walter's walking animation moving right

      if (wPressed || aPressed || sPressed || dPressed) //if 'w', 'a', 's', or 'd' is pressed
        aCounter+=aSpeedW; //sets the speed for Walter's walking animations
    }

    if (wasdKey>=1 && wasdKey<=4) //if the last key pressed was 'w', 'a', 's', or 'd'
      aCounter+=aSpeedI; //sets the speed for Walter's idle animations
  }

  void walterMove() { //allows Walter to move
    if (wPressed) //if 'w' is being pressed
      walterY-=wSpeedY; //Walter moves upwards
    if (aPressed) //if 'a' is being pressed
      walterX-=wSpeedX; //Walter moves to the left
    if (sPressed) //if 's' is being pressed
      walterY+=wSpeedY; //Walter moves downwards
    if (dPressed) //if 'd' is being pressed
      walterX+=wSpeedX; //Walter moves to the right

    if (wPressed==false && aPressed==false && sPressed==false && dPressed==false) //if Walter is not moving
      idle=true; //Walter is not moving
  }

  void walterKeyPressed() { //moves Walter with wasd keys
    startGame=true; //the game has started
    if (key=='w') { //if 'w' is being pressed
      wPressed=true; //'w' is being pressed
      idle=false; //Walter is not idle
      wUp=true; //Walter is facing upwards
      wLeft=false; //walter is not facing left
      wRight=false; //Walter is not facing right
      wDown=false; //Walter is not facing downwards
    } else if (key=='a') { //if 'a' is being pressed
      aPressed=true; //'a' is being pressed
      idle=false; //Walter is not idle
      wUp=false; //Walter is not facing upwards
      wLeft=true; //Walter is facing left
      wRight=false; //Walter is not facing right
      wDown=false;  //Walter is not facing downwards
    } else if (key=='s') { //if 's' is being pressed
      sPressed=true; //'s' is being pressed
      idle=false; //Walter is not idle
      wUp=false; //Walter is not facing upwards
      wLeft=false; //Walter is not facing left
      wRight=false; //Walter is not facing right
      wDown=true; //Walter is facing downwards
    } else if (key=='d') { //if 'd' is being pressed
      dPressed=true; //'d' is being pressed
      idle=false; //Walter is not idle
      wUp=false; //Walter is not facing upwards
      wLeft=false; //Walter is not facing left
      wRight=true; //Walter is facing right
      wDown=false; //Walter is not faacing downwards
    }

    if (key!='e') //if any key other than 'e' is pressed
      sit=false; //Walter is not sitting

    if (key!='w' && key!='a' && key!='s' && key!='d') { //if none of the wasd keys are pressed
      wPressed=false; //'w' is not pressed
      aPressed=false; //'a' is not pressed
      sPressed=false; //'s' is not pressed
      dPressed=false; //'d' is not pressed
      idle=true; //Walter is idle
    }
  }

  void walterKeyReleased() { //allows Walter to move diagonally
    if (key=='w') { //if 'w' is released
      wPressed=false; //'w' is not being pressed
      wasdKey=1; //wasd key is 1, storing 'w' as the last key pressed
      if (keyPressed==false) { //if a key is not pressed
        idle=true; //Walter is idle
      }
    }
    if (key=='a') { //if 'a' is released
      aPressed=false; //'a' is not being pressed
      wasdKey=2; //wasd key is 2, storeing 'a' as the last key pressed
      if (keyPressed==false) { //if a key is not pressed
        idle=true; //Walter is idle
      }
    }
    if (key=='s') { //if 's' is released
      sPressed=false; //'s' is not being pressed
      wasdKey=3; //wasd key is 3, storing 's' as the last key pressed
      if (keyPressed==false) { //if a key is not pressed
        idle=true; //Walter is idle
      }
    }
    if (key=='d') { //if 'd' is released
      dPressed=false; //'d' is not being pressed
      wasdKey=4; //wasd key is 4, storing 'd' as the last key pressed
      if (keyPressed==false) { //if a key is not pressed
        idle=true; //Walter is idle
      }
    }
  }
}
