class Lindsay {
  PImage lindsaySitR; //image of Lindsay sitting facing right
  PImage rLindsay; //sprite sheet of Lindsay facing right
  PImage[] bSprites=new PImage[2]; //array to run Lindsay's back facing idle animation
  PImage bLindsay; //sprite sheet of Lindsay facing back
  PImage[] rSprites=new PImage[2]; //array to run Lindsay's right facing idle animation
  PImage lindsayL; //sprite sheet of Lindsay walking left
  PImage[] spritesL=new PImage[4]; //array to run Lindsay's left walking animation
  PImage lindsayR; //sprite sheet of Lindsay walking right
  PImage[] spritesR=new PImage[4]; //array to run Lindsay's right walking animation
  PImage lindsayF; //sprite sheet of Lindsay walking forward
  PImage[] spritesF=new PImage[4]; //array to run Lindsay's forward walking animation
  PImage lindsayB; //sprite sheet of Lindsay walking back
  PImage[] spritesB=new PImage[4]; //array to run Lindsay's back walking animation

  int originalW=60; //Lindsay's original width
  int originalH=108; //Lindsay's original height
  float lindsayW=60; //Lindsay's width
  float lindsayH=108; //Lindsay's height
  float lindsayX=740; //x-coordinate for Lindsay
  float lindsayY=390; //y-coordinate for Lindsay

  float aCounter; //counter for Lindsay's animations

  boolean lLeft, lRight, lUp, lDown; //booleans to determine which direction Lindsay is facing while walking
  boolean lIdleR, lIdleB; //boolean to determine which direction Lindsay is facing while idle
  boolean lSitR; //boolean to determine if Lindsay is sitting facing right

  Lindsay() {
    rLindsay=loadImage("rLindsay.png");
    bLindsay=loadImage("bLindsay.png");
    lindsayL=loadImage("lindsayL.png");
    lindsayR=loadImage("lindsayR.png");
    lindsayF=loadImage("lindsayF.png");
    lindsayB=loadImage("lindsayB.png");
    lindsaySitR=loadImage("lindsaySitR.png");

    for (int index=0; index<rSprites.length; index++) { //index variable has an initial value of 0, must be less than the length of rSprites array, and increases by increments of 1
      rSprites[index]=rLindsay.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Lindsay's right idle sprite sheet
      bSprites[index]=bLindsay.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Lindsay's back idle sprite sheet
    }

    for (int index=0; index<spritesR.length; index++) { //index variable has an initial value of 0, must be less than the length of spritesR array, and increases by increments of 1
      spritesL[index]=lindsayL.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Lindsay's left walking sprite sheet
      spritesR[index]=lindsayR.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Lindsay's right walking sprite sheet
      spritesF[index]=lindsayF.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Lindsay's forward walking sprite sheet
      spritesB[index]=lindsayB.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Lindsay's back walking sprite sheet
    }

    lindsayW=map(lindsayW, 0, 1920, 0, width);
    lindsayH=map(lindsayH, 0, 1080, 0, height);
    lindsayX=map(lindsayX, 0, 1920, 0, width);
    lindsayY=map(lindsayY, 0, 1080, 0, height);
  }

  void displayLindsay() { //displays Lindsay
    int indexI=floor(aCounter)%rSprites.length; //index variable to use each image in Lindsay's idle sprite sheets
    int indexW=floor(aCounter)%spritesR.length;  //index variable to use each image in Lindsay's walking sprite sheets

    if (lIdleR) { //if Lindsay is idle facing right
      image(rSprites[indexI], lindsayX, lindsayY, lindsayW, lindsayH); //display Lindsay idle facing right
      aCounter+=w.aSpeedI; //sets the speed for Lindsay's idle animations
    } else if (lIdleB) { //if Lindsay is idle facing back
      image(bSprites[indexI], lindsayX, lindsayY, lindsayW, lindsayH); //display Lindsay idle facing back
      aCounter+=w.aSpeedI; //sets the speed for Lindsay's idle animations
    } else if (lLeft) { //if Lindsay is walking left
      image(spritesL[indexW], lindsayX, lindsayY, lindsayW, lindsayH); //display Lindsay walking left
      lindsayX-=w.wSpeedX/3*2; //Lindsay moves to the left
    } else if (lRight) { //if Lindsay is walking right
      image(spritesR[indexW], lindsayX, lindsayY, lindsayW, lindsayH); //display Lindsay walking right
      lindsayX+=w.wSpeedX/3*2; //Lindsay moves to the right
    } else if (lUp) { //if Lindsay is walking up
      image(spritesB[indexW], lindsayX, lindsayY, lindsayW, lindsayH); //display Lindsay walking up
      lindsayY-=w.wSpeedY/3*2; //Lindsay moves upwards
    } else if (lDown) { //if Lindsay is walking down
      image(spritesF[indexW], lindsayX, lindsayY, lindsayW, lindsayH); //display Lindsay walking down
      lindsayY+=w.wSpeedY/3*2; //Lindsay moves downwards
    } else if (lSitR) //if Lindsay is sitting facing right
      image(lindsaySitR, 0, 0, width, height); //display Lindsay sitting facing right

    if (lLeft|lRight||lUp||lDown) //if Lindsay is walking
      aCounter+=w.aSpeedW; //the counter for Lindsay's walking animation increases to display the different images
  }
}
