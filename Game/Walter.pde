class Walter {
  PImage walterSleep; //image of black & white Walter sleeping
  PImage fbwWalter; //sprite sheet of black & white Walter facing forwards
  PImage[] fbwSprites = new PImage[2];  //array to run Walter's forward facing idle animation
  PImage lbwWalter; //sprite sheet of black & white Walter facing left
  PImage[] lbwSprites = new PImage[2]; //array to run Walter's left facing idle animation
  PImage rbwWalter; //sprite sheet of black & white Walter facing right
  PImage[] rbwSprites = new PImage[2]; //array to run Walter's right facing idle animation
  PImage bbwWalter; //sprite sheet of black & white Walter facing backwards
  PImage[] bbwSprites = new PImage[2]; //array to run Walter's back facing idle animation
  PImage bwWalterF; //sprite sheet of black & white Walter walking downwards
  PImage[] bwSpritesF = new PImage[4]; //array to run Walter's downwards walking animation
  PImage bwWalterL; //sprite sheet of black & white Walter walking left
  PImage[] bwSpritesL = new PImage[4]; //array to run Walter's left walking animation
  PImage bwWalterR; //sprite sheet of black & white Walter walking right
  PImage[] bwSpritesR = new PImage[4]; //array to run Walter's right walking animation
  PImage bwWalterB; //sprite sheet of black & white Walter walking upwards
  PImage[] bwSpritesB = new PImage[4]; //array to run Walter's upwards walking animation
  int walterW=64; //Walter's width size
  int walterH=140; //Walter's height size
  int startPosX=1215; //starting x position for Walter
  int startPosY=250; //starting y position for Walter
  int walterX, walterY; //x and y coordinates of Walter
  int walterSpeed=4; //speed of Walter
  int hrBoundaryL=587; //left hospital room boundary for Walter
  int hrBoundaryR=1271; //right hospital room boundary for Walter
  int hrBoundaryU=100; //up hospital room boundary for Walter
  int hrBoundaryD=720; //down hospital room boundary for Walter
  int bedBoundaryX=1145; //horizontal bed boundary for Walter
  int bedBoundaryY=283; //vertical bed boundary for Walter
  int wasdKey; //stores the last wasd key pressed
  float animationSpeedI=0.04; //speed of Walter's idle animations
  float animationSpeedW=0.07; //speed of Walter's walking animations
  float animationCounter; //counter for Walter's walking animations
  boolean wPressed, aPressed, sPressed, dPressed; //booleans for if keys 'w', 'a', 's', and/or 'd' is being pressed
  boolean walterLeft, walterRight, walterUp, walterDown; //booleans to determine which direction Walter is facing
  boolean walterIdle; //boolean to determine whether or not Walter is moving
  boolean bedCollision; //boolean to determine if Walter has collided with the bed boundaries
  boolean startGame; //boolean to determine if the game has started

  Walter() {
    walterSleep=loadImage("walterSleep.png");
    fbwWalter=loadImage("fbwWalter.png");
    lbwWalter=loadImage("lbwWalter.png");
    rbwWalter=loadImage("rbwWalter.png");
    bbwWalter=loadImage("bbwWalter.png");
    bwWalterF=loadImage("bwWalterF.png");
    bwWalterL=loadImage("bwWalterL.png");
    bwWalterR=loadImage("bwWalterR.png");
    bwWalterB=loadImage("bwWalterB.png");

    walterX=startPosX; //sets Walter's starting x position
    walterY=startPosY; //sets Walter's starting y position

    walterSprites(); //initializes Walter's sprite animations
  }

  void walterSprites() {
    for (int index=0; index<rbwSprites.length; index++) {
      fbwSprites[index]=fbwWalter.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's forward idle sprite sheet
      lbwSprites[index]=lbwWalter.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's left idle sprite sheet
      rbwSprites[index]=rbwWalter.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's right idle sprite sheet
      bbwSprites[index]=bbwWalter.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's back idle sprite sheet
    }

    for (int index=0; index<bwSpritesF.length; index++) { //index variable has an initial value of 0, must be less than the length of t array, and increases by increments of 1
      bwSpritesF[index]=bwWalterF.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's forward walking sprite sheet
      bwSpritesL[index]=bwWalterL.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's left walking sprite sheet
      bwSpritesR[index]=bwWalterR.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's right walking sprite sheet
      bwSpritesB[index]=bwWalterB.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's back walking sprite sheet
    }
  }

  void displayWalter() {
    int animationIndexI=floor(animationCounter)%bbwSprites.length; //index variable to use each image in Walter's idle sprite sheets
    int animationIndexW=floor(animationCounter)%bwSpritesF.length;  //index variable to use each image in Walter's walking sprite sheets

    if (startGame==false) //if the game has not started
      image(walterSleep, walterX, walterY); //display black & white Walter facing forwards

    if (walterLeft==false&&walterRight==false&&walterUp==false&&walterDown==false) //if Walter is not moving in any direction
      walterIdle=true; //Walter is idle

    else if (wasdKey==1&&walterIdle==true) { //if 'w' was the last key pressed and Walter is idle
      animationCounter+=animationSpeedI; //sets the speed for Walter's backward idle animation
      image(bbwSprites[animationIndexI], walterX, walterY); //display black & white Walter facing backwards animation
    } else if (wasdKey==2&&walterIdle==true) { //'a' was the last key pressed and Walter is idle
      animationCounter+=animationSpeedI;//sets the speed for Walter's left idle animation
      image(lbwSprites[animationIndexI], walterX, walterY); //display black & white Walter facing left animation
    } else if (wasdKey==3&&walterIdle==true) { //if 's' was the last key pressed and Walter is idle
      animationCounter+=animationSpeedI; //sets the speed for Walter's forward idle animation
      image(fbwSprites[animationIndexI], walterX, walterY); //display black & white Walter facing forwards animation
    } else if (wasdKey==4&&walterIdle==true) { //if 'd' was the last key pressed and Walter is idle
      animationCounter+=animationSpeedI; //sets the speed for Walter's right idle animation
      image(rbwSprites[animationIndexI], walterX, walterY); //display black & white Walter facing right animation
    }

    if (walterUp==true && walterIdle==false) { //if Walter is moving upwards and is not idle
      animationCounter+=animationSpeedW; //sets the speed for Walter's downward walking animation
      image(bwSpritesB[animationIndexW], walterX, walterY); //displays Walter's walking animation moving upwards
    } else if (walterLeft==true && walterIdle==false) { //if Walter is moving left and is not idle
      animationCounter+=animationSpeedW; //sets the speed for Walter's left walking animation
      image(bwSpritesL[animationIndexW], walterX, walterY); //displays Walter's walking animation moving left
    } else if (walterRight==true&&walterIdle==false) { //if Walter is moving right and is not idle
      animationCounter+=animationSpeedW; //sets the speed for Walter's right walking animation
      image(bwSpritesR[animationIndexW], walterX, walterY); //displays Walter's walking animation moving right
    } else if (walterDown==true && walterIdle==false) { //if Walter is moving down and is not idle
      animationCounter+=animationSpeedW; //sets the speed for Walter's downward walking animation
      image(bwSpritesF[animationIndexW], walterX, walterY); //displays Walter's walking animation moving downwards
    }
  }

  void hrBoundaries() {
    if (walterX<hrBoundaryL) //if Walter is outside of the left hospital room boundary
      walterX+=walterSpeed; //Walter cannot move to the left
    if (walterX>hrBoundaryR) //if Walter is outside of the right hospital room boundary
      walterX-=walterSpeed; //Walter cannot move to the right
    if (walterY<hrBoundaryU) //if walter is outside of the top hospital room boundary
      walterY+=walterSpeed; //Walter cannot move upwards
    if (walterY>hrBoundaryD) //if Walter is outside of the bottom hospital room boundary
      walterY-=walterSpeed; //Walter cannot move downwards

    //if (walterY==bedBoundaryY&&walterX>bedBoundaryX) //if Walter is at the foot of the bed
    //walterY+=walterSpeed; //Walter cannot move upwards
  }

  void walterMove() {
    if (wPressed) //if 'w' is being pressed
      walterY-=walterSpeed; //Walter moves upwards
    if (aPressed) //if 'a' is being pressed
      walterX-=walterSpeed; //Walter moves to the left
    if (sPressed) //if 's' is being pressed
      walterY+=walterSpeed; //Walter moves downwards
    if (dPressed) //if 'd' is being pressed
      walterX+=walterSpeed; //Walter moves to the right
  }

  void walterKeyPressed() {
    if (key=='w') { //if 'w' is being pressed
      startGame=true; //the game has started
      wPressed=true; //'w' is being pressed
      walterIdle=false; //Walter is not idle
      walterUp=true; //Walter is facing upwards
      walterLeft=false; //walter is not facing left
      walterRight=false; //Walter is not facing right
      walterDown=false; //Walter is not facing downwards
      wasdKey=1; //wasd key is 1, storing 'w' as the last key pressed
    } else if (key=='a') { //if 'a' is being pressed
      startGame=true; //the game has started
      aPressed=true; //'a' is being pressed
      walterIdle=false; //Walter is not idle
      walterUp=false; //Walter is not facing upwards
      walterLeft=true; //Walter is facing left
      walterRight=false; //Walter is not facing right
      walterDown=false;  //Walter is not facing downwards
      wasdKey=2; //wasd key is 2, storeing 'a' as the last key pressed
    } else if (key=='s') { //if 's' is being pressed
      startGame=true; //the game has started
      sPressed=true; //'s' is being pressed
      walterIdle=false; //Walter is not idle
      walterUp=false; //Walter is not facing upwards
      walterLeft=false; //Walter is not facing left
      walterRight=false; //Walter is not facing right
      walterDown=true; //Walter is facing downwards
      wasdKey=3; //wasd key is 3, storing 's' as the last key pressed
    } else if (key=='d') { //if 'd' is being pressed
      startGame=true; //the game has started
      dPressed=true; //'d' is being pressed
      walterIdle=false; //Walter is not idle
      walterUp=false; //Walter is not facing upwards
      walterLeft=false; //Walter is not facing left
      walterRight=true; //Walter is facing right
      walterDown=false; //Walter is not faacing downwards
      wasdKey=4; //wasd key is 4, storing 'd' as the last key pressed
    }
  }

  void walterKeyReleased() {
    if (key=='w') { //if 'w' is released
      wPressed=false; //'w' is not being pressed
      walterIdle=true; //Walter is idle
    }
    if (key=='a') { //if 'a' is released
      aPressed=false; //'a' is not being pressed
      walterIdle=true; //Walter is idle
    }
    if (key=='s') { //if 's' is released
      sPressed=false; //'s' is not being pressed
      walterIdle=true; //Walter is idle
    }
    if (key=='d') { //if 'd' is released
      dPressed=false; //'d' is not being pressed
      walterIdle=true; //Walter is idle
    }
  }
}
