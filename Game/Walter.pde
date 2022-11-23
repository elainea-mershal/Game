class Walter {
  PImage walterSleep; //image of black & white Walter sleeping
  PImage fWalter; //sprite sheet of black & white Walter facing forwards
  PImage[] fSprites = new PImage[2];  //array to run Walter's forward facing idle animation
  PImage lWalter; //sprite sheet of black & white Walter facing left
  PImage[] lSprites = new PImage[2]; //array to run Walter's left facing idle animation
  PImage rWalter; //sprite sheet of black & white Walter facing right
  PImage[] rSprites = new PImage[2]; //array to run Walter's right facing idle animation
  PImage bWalter; //sprite sheet of black & white Walter facing backwards
  PImage[] bSprites = new PImage[2]; //array to run Walter's back facing idle animation
  PImage walterF; //sprite sheet of black & white Walter walking downwards
  PImage[] spritesF = new PImage[4]; //array to run Walter's downwards walking animation
  PImage walterL; //sprite sheet of black & white Walter walking left
  PImage[] spritesL = new PImage[4]; //array to run Walter's left walking animation
  PImage walterR; //sprite sheet of black & white Walter walking right
  PImage[] spritesR = new PImage[4]; //array to run Walter's right walking animation
  PImage walterB; //sprite sheet of black & white Walter walking upwards
  PImage[] spritesB = new PImage[4]; //array to run Walter's upwards walking animation

  int walterW=64; //Walter's width size
  int walterH=140; //Walter's height size
  int walterX, walterY; //x and y coordinates of Walter
  int wSpeed=4; //speed of Walter
  int sleepX=1215; //starting x position for Walter
  int sleepY=250; //starting y position for Walter

  int wasdKey; //stores the last wasd key pressed

  float aSpeedI=0.03; //speed of Walter's idle animations
  float aSpeedW=0.08; //speed of Walter's walking animations
  float aCounter; //counter for Walter's walking animations

  boolean startGame; //boolean to determine if the game has started
  boolean wPressed, aPressed, sPressed, dPressed; //booleans for if keys 'w', 'a', 's', and/or 'd' is being pressed
  boolean wLeft, wRight, wUp, wDown; //booleans to determine which direction Walter is facing
  boolean sleep; //boolean to determine whether or not Walter is sleeping
  boolean idle; //boolean to determine whether or not Walter is moving

  Walter() {

    walterSleep=loadImage("walterSleep.png");
    fWalter=loadImage("fWalter.png");
    lWalter=loadImage("lWalter.png");
    rWalter=loadImage("rWalter.png");
    bWalter=loadImage("bWalter.png");
    walterF=loadImage("walterF.png");
    walterL=loadImage("walterL.png");
    walterR=loadImage("walterR.png");
    walterB=loadImage("walterB.png");

    walterSprites(); //initializes Walter's sprite animations
    
    walterX=sleepX;
    walterY=sleepY;
  }

  void walterSprites() {
    for (int index=0; index<rSprites.length; index++) {
      fSprites[index]=fWalter.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's forward idle sprite sheet
      lSprites[index]=lWalter.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's left idle sprite sheet
      rSprites[index]=rWalter.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's right idle sprite sheet
      bSprites[index]=bWalter.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's back idle sprite sheet
    }

    for (int index=0; index<spritesF.length; index++) { //index variable has an initial value of 0, must be less than the length of t array, and increases by increments of 1
      spritesF[index]=walterF.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's forward walking sprite sheet
      spritesL[index]=walterL.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's left walking sprite sheet
      spritesR[index]=walterR.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's right walking sprite sheet
      spritesB[index]=walterB.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's back walking sprite sheet
    }
  }

  void displayWalter() { //displays Walter
    int indexI=floor(aCounter)%bSprites.length; //index variable to use each image in Walter's idle sprite sheets
    int indexW=floor(aCounter)%spritesF.length;  //index variable to use each image in Walter's walking sprite sheets

    if (startGame==false) //if the game has not started
      sleep=true; //Walter is sleeping

    if (sleep) { //if Walter is sleeping
      image(walterSleep, walterX, walterY); //display black & white Walter facing forwards
      walterX=sleepX; //sets Walter's starting x position
      walterY=sleepY; //sets Walter's starting y position
    } else if (wLeft==false&&wRight==false&&wUp==false&&wDown==false) //if Walter is not moving in any direction
      idle=true; //Walter is idle
    else if (wasdKey==1&&idle==true) { //if 'w' was the last key pressed and Walter is idle
      aCounter+=aSpeedI; //sets the speed for Walter's backward idle animation
      image(bSprites[indexI], walterX, walterY); //display black & white Walter facing backwards animation
    } else if (wasdKey==2&&idle==true) { //'a' was the last key pressed and Walter is idle
      aCounter+=aSpeedI;//sets the speed for Walter's left idle animation
      image(lSprites[indexI], walterX, walterY); //display black & white Walter facing left animation
    } else if (wasdKey==3&&idle==true) { //if 's' was the last key pressed and Walter is idle
      aCounter+=aSpeedI; //sets the speed for Walter's forward idle animation
      image(fSprites[indexI], walterX, walterY); //display black & white Walter facing forwards animation
    } else if (wasdKey==4&&idle==true) { //if 'd' was the last key pressed and Walter is idle
      aCounter+=aSpeedI; //sets the speed for Walter's right idle animation
      image(rSprites[indexI], walterX, walterY); //display black & white Walter facing right animation
    } else if (wPressed==true && idle==false) { //if Walter is moving upwards and is not idle
      aCounter+=aSpeedW; //sets the speed for Walter's downward walking animation
      image(spritesB[indexW], walterX, walterY); //displays Walter's walking animation moving upwards
    } else if (aPressed==true && idle==false) { //if Walter is moving left and is not idle
      aCounter+=aSpeedW; //sets the speed for Walter's left walking animation
      image(spritesL[indexW], walterX, walterY); //displays Walter's walking animation moving left
    } else if (dPressed==true&&idle==false) { //if Walter is moving right and is not idle
      aCounter+=aSpeedW; //sets the speed for Walter's right walking animation
      image(spritesR[indexW], walterX, walterY); //displays Walter's walking animation moving right
    } else if (sPressed==true && idle==false) { //if Walter is moving down and is not idle
      aCounter+=aSpeedW; //sets the speed for Walter's downward walking animation
      image(spritesF[indexW], walterX, walterY); //displays Walter's walking animation moving downwards
    }
  }

  void walterMove() { //allows Walter to move
    if (wPressed) //if 'w' is being pressed
      walterY-=wSpeed; //Walter moves upwards
    if (aPressed) //if 'a' is being pressed
      walterX-=wSpeed; //Walter moves to the left
    if (sPressed) //if 's' is being pressed
      walterY+=wSpeed; //Walter moves downwards
    if (dPressed) //if 'd' is being pressed
      walterX+=wSpeed; //Walter moves to the right
  }
  
  void walterKeyPressed() { //moves Walter with wasd keys
  startGame=true;
    if (key=='w') { //if 'w' is being pressed
      wPressed=true; //'w' is being pressed
      idle=false; //Walter is not idle
      wUp=true; //Walter is facing upwards
      wLeft=false; //walter is not facing left
      wRight=false; //Walter is not facing right
      wDown=false; //Walter is not facing downwards
      wasdKey=1; //wasd key is 1, storing 'w' as the last key pressed
    } else if (key=='a') { //if 'a' is being pressed
      aPressed=true; //'a' is being pressed
      idle=false; //Walter is not idle
      wUp=false; //Walter is not facing upwards
      wLeft=true; //Walter is facing left
      wRight=false; //Walter is not facing right
      wDown=false;  //Walter is not facing downwards
      wasdKey=2; //wasd key is 2, storeing 'a' as the last key pressed
    } else if (key=='s') { //if 's' is being pressed
      sPressed=true; //'s' is being pressed
      idle=false; //Walter is not idle
      wUp=false; //Walter is not facing upwards
      wLeft=false; //Walter is not facing left
      wRight=false; //Walter is not facing right
      wDown=true; //Walter is facing downwards
      wasdKey=3; //wasd key is 3, storing 's' as the last key pressed
    } else if (key=='d') { //if 'd' is being pressed
      dPressed=true; //'d' is being pressed
      idle=false; //Walter is not idle
      wUp=false; //Walter is not facing upwards
      wLeft=false; //Walter is not facing left
      wRight=true; //Walter is facing right
      wDown=false; //Walter is not faacing downwards
      wasdKey=4; //wasd key is 4, storing 'd' as the last key pressed
    }
  }

  void walterKeyReleased() { //allows Walter to move diagonally
    if (key=='w') { //if 'w' is released
      wPressed=false; //'w' is not being pressed
      idle=true; //Walter is idle
    }
    if (key=='a') { //if 'a' is released
      aPressed=false; //'a' is not being pressed
      idle=true; //Walter is idle
    }
    if (key=='s') { //if 's' is released
      sPressed=false; //'s' is not being pressed
      idle=true; //Walter is idle
    }
    if (key=='d') { //if 'd' is released
      dPressed=false; //'d' is not being pressed
      idle=true; //Walter is idle
    }
  }
}
