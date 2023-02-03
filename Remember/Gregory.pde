class Gregory {
  PImage gregorySitF; //image of Gregory sitting facing forward
  PImage rGregory; //sprite sheet of Gregory's right idle animation
  PImage[]rSprites = new PImage[2]; //array to run Gregory's right idle animation
  PImage bGregory; //sprite shee of Gregory's back idle animation
  PImage[]bSprites = new PImage[2]; //array to run Gregory's back idle animation
  PImage gregoryL; //sprite sheet of Gregory walking to the left
  PImage[] spritesL=new PImage[4]; //array to run Gregory's left walking animation
  PImage gregoryR; //sprite sheet of Gregory walking to the right
  PImage[]spritesR = new PImage[4]; //array to run Gregory's right walking animation
  PImage gregoryF; //sprite sheet of Gregory walking forwards
  PImage[] spritesF=new PImage[4]; //array to run Gregory's forward walking animation
  PImage gregoryThrow; //image of Gregory throwing the baseball
  PImage gregoryGlove; //image of Gregory holding his glove

  PImage[]firstText = new PImage[29]; //images for Gregory's first dialogue outside
  PImage[]secondText = new PImage[53]; //images for Gregory's second dialogue outside
  PImage[]thirdText = new PImage[23]; //images for Gregory's third dialogue outside
  PImage[]fourthText = new PImage[12]; //images for Gregory's fourth dialogue outside

  boolean gSitF; //boolean to determine if Gregory is sitting facing forward
  boolean gIdleR, gIdleB; //boolean to determine which direction Gregory is facing
  boolean gLeft, gDown; //boolean to determine which direction Gregory is walking

  int originalW=60; //Gregory's original width
  int originalH=92; //Gregory's original height
  float gregBYX=634; //Gregory's x position in the backyard
  float gregBYY=614; //Gregory's y position in the backyard
  int gCounter; //counter for Gregory's dialogue
  float gregoryX, gregoryY; //x and y coordinates for Gregory

  float gregoryW=60; //Gregory's width
  float gregoryH=93; //Gregory's height
  float aCounter; //counter for Gregory's animations

  Gregory() {
    gregorySitF=loadImage("gregorySitF.png");
    rGregory=loadImage("rGregory.png");
    bGregory=loadImage("bGregory.png");
    gregoryL=loadImage("gregoryL.png");
    gregoryR=loadImage("gregoryR.png");
    gregoryF=loadImage("gregoryF.png");
    gregoryGlove=loadImage("gregoryGlove.png");
    gregoryThrow=loadImage("gregoryThrow.png");
    for (int index=0; index<firstText.length; index++) //index variable has an initial value of 0, must be less than the length of firstText array, and increases by increments of 1
      firstText[index]=loadImage(index+"g2Text.png");
    for (int index=0; index<secondText.length; index++) //index variable has an initial value of 0, must be less than the length of secondText array, and increases by increments of 1
      secondText[index]=loadImage(index+"g3Text.png");
    for (int index=0; index<thirdText.length; index++) //index variable has an initial value of 0, must be less than the length of thirdText array, and increases by increments of 1
      thirdText[index]=loadImage(index+"g4Text.png");
    for (int index=0; index<fourthText.length; index++) //index variable has an initial value of 0, must be less than the length of fourthText array, and increases by increments of 1
      fourthText[index]=loadImage(index+"g5Text.png");

    for (int index=0; index<spritesR.length; index++) { //index variable has an initial value of 0, must be less than the length of spritesR array, and increases by increments of 1
      spritesL[index]=gregoryL.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Gregory's left walking sprite sheet
      spritesR[index]=gregoryR.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Gregory's right walking sprite sheet
      spritesF[index]=gregoryF.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Gregory's forward walking sprite sheet
    }

    for (int index=0; index<rSprites.length; index++) { //index variable has an initial value of 0, must be less than the length of rSprites array, and increases by increments of 1
      rSprites[index]=rGregory.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Gregory's right idle sprite sheet
      bSprites[index]=bGregory.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from Gregory's back idle sprite sheet
    }

    gregoryW=map(gregoryW, 0, 1920, 0, width);
    gregoryH=map(gregoryH, 0, 1080, 0, height);
    gregoryX=map(gregoryX, 0, 1920, 0, width);
    gregoryY=map(gregoryY, 0, 1080, 0, height);
    gregBYX=map(gregBYX, 0, 1920, 0, width);
    gregBYY=map(gregBYY, 0, 1080, 0, height);
  }

  void displayGregory() { //displays Gregory
    int indexI=floor(aCounter)%rSprites.length; //index variable to use each image in Gregory's idle sprite sheets
    int indexW=floor(aCounter)%spritesR.length;  //index variable to use each image in Lindsay's walking sprite sheets

    if (gSitF) //if Gregory is sitting facing forward
      image(g.gregorySitF, 0, 0, width, height); //display Gregory sitting facing forward
    else if (gIdleR) { //if Gregory is idle facing right
      image(rSprites[indexI], gregoryX, gregoryY, gregoryW, gregoryH); //display Gregory idle facing right
      aCounter+=w.aSpeedI; //sets the speed for Gregory's idle animations
    } else if (gIdleB) { //if Gregory is idle facing back
      image(bSprites[indexI], gregoryX, gregoryY, gregoryW, gregoryH); //display Gregory idle facing back
      aCounter+=w.aSpeedI; //sets the speed for Gregory's idle animations
    } else if (gLeft) { //if Gregory is walking to the left
      image(spritesL[indexW], gregoryX, gregoryY, gregoryW, gregoryH); //display Gregory walking left
      aCounter+=w.aSpeedI; //sets the speed for Gregory's walking animations
      gregoryX-=w.wSpeedX/3*2; //Gregory moves to the left
    } else if (gDown) { //if Gregory is walking forwards
      image(spritesF[indexW], gregoryX, gregoryY, gregoryW, gregoryH); //display Gregory walking forwards
      aCounter+=w.aSpeedI; //sets the speed for Gregory's walking animations
      gregoryY+=w.wSpeedY/3*2; //Gregory moves down
    }
  }
}
