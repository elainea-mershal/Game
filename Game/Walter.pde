class Walter {
  PImage walterSleep; //image of blac & white Walter sleeping
  PImage fbwWalter; //image of black & white Walter facing forwards
  PImage lbwWalter; //image of black & white Walter facing left
  PImage rbwWalter; //image of black & white Walter facing right
  PImage bbwWalter; //image of black & white Walter facing backwards
  PImage bwWalterF; //sprite sheet of black & white Walter walking downwards
  PImage[] bwSpritesF = new PImage[4]; //array to run Walters downwards walking animation
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
  float animationSpeed=0.07; //speed of Walter's walking animations
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
    for (int index=0; index<bwSpritesF.length; index++) { //index variable has an initial value of 0, must be less than the length of t array, and increases by increments of 1
      bwSpritesF[index]=bwWalterF.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's forward facing sprite sheet
      bwSpritesL[index]=bwWalterL.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's left facing sprite sheet
      bwSpritesR[index]=bwWalterR.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's right facing sprite sheet
      bwSpritesB[index]=bwWalterB.get(index*walterW, 0, walterW, walterH); //retrieves the separate images from Walter's back facing sprite sheet
    }
  }

  void displayWalter() {
    int animationIndex=floor(animationCounter)%bwSpritesF.length;  //index variable to use each image on Walter's forward facing sprite sheet

    if (walterLeft==false&&walterRight==false&&walterUp==false&&walterDown==false) //if Walter is not moving in any direction
      walterIdle=true; //Walter is idle

    if (startGame==false) //if the game has not started
      image(walterSleep, walterX, walterY); //display black & white Walter facing forwards

    if (key=='w'&&walterIdle==true) //if 'w' was the last key pressed and Walter is idle
      image(bbwWalter, walterX, walterY); //display black & white Walter facing backwards

    if (key=='a'&&walterIdle==true) //'a' was the last key pressed and Walter is idle
      image(lbwWalter, walterX, walterY); //display black & white Walter facing left

    if (key=='s'&&walterIdle==true) //if 's' was the last key pressed and Walter is idle
      image(fbwWalter, walterX, walterY); //display black & white Walter facing forwards

    if (key=='d'&&walterIdle==true) //if 'd' was the last key pressed and Walter is idle
      image(rbwWalter, walterX, walterY); //display black & white Walter facing right

    if (walterUp==true && walterIdle==false) { //if Walter is moving upwards and is not idle
      animationCounter+=animationSpeed; //sets the speed for Walter's downward walking animation
      image(bwSpritesB[animationIndex], walterX, walterY); //displays Walter's walking animation moving upwards
    }

    if (walterLeft==true && walterIdle==false) { //if Walter is moving left and is not idle
      animationCounter+=animationSpeed; //sets the speed for Walter's left walking animation
      image(bwSpritesL[animationIndex], walterX, walterY); //displays Walter's walking animation moving left
    }

    if (walterRight==true&&walterIdle==false) { //if Walter is moving right and is not idle
      animationCounter+=animationSpeed; //sets the speed for Walter's right walking animation
      image(bwSpritesR[animationIndex], walterX, walterY); //displays Walter's walking animation moving right
    }

    if (walterDown==true && walterIdle==false) { //if Walter is moving down and is not idle
      animationCounter+=animationSpeed; //sets the speed for Walter's downward walking animation
      image(bwSpritesF[animationIndex], walterX, walterY); //displays Walter's walking animation moving downwards
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
    }
    if (key=='a') { //if 'a' is being pressed
      startGame=true; //the game has started
      aPressed=true; //'a' is being pressed
      walterIdle=false; //Walter is not idle
      walterUp=false; //Walter is not facing upwards
      walterLeft=true; //Walter is facing left
      walterRight=false; //Walter is not facing right
      walterDown=false;  //Walter is not facing downwards
    }
    if (key=='s') { //if 's' is being pressed
      startGame=true; //the game has started
      sPressed=true; //'s' is being pressed
      walterIdle=false; //Walter is not idle
      walterUp=false; //Walter is not facing upwards
      walterLeft=false; //Walter is not facing left
      walterRight=false; //Walter is not facing right
      walterDown=true; //Walter is facing downwards
    }
    if (key=='d') { //if 'd' is being pressed
      startGame=true; //the game has started
      dPressed=true; //'d' is being pressed
      walterIdle=false; //Walter is not idle
      walterUp=false; //Walter is not facing upwards
      walterLeft=false; //Walter is not facing left
      walterRight=true; //Walter is facing right
      walterDown=false; //Walter is not faacing downwards
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
