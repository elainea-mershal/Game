class Nurse {
  PImage rNurse; //nurse facing right
  PImage nurseF; //sprite sheet of nurse walking forwards
  PImage[] spritesF = new PImage[4]; //array to run nurse's downwards walking animation
  PImage nurseL; //sprite sheet of nurse walking left
  PImage[] spritesL = new PImage[4]; //array to run nurse's left walking animation
  PImage nurseR; //sprite sheet of nurse idie to the right
  PImage[] rSprites = new PImage[4]; //array to run nurse's right idle animation
  PImage[] spritesR = new PImage[4]; //array to run nurse's right walking animation
  PImage nurseB; //sprite sheet of nurse walking backwards
  PImage[] spritesB = new PImage[4]; //array to run nurse's upwards walking animation

  int originalW=56; //orginal width of the nurse
  int originalH=108; //original height of the nurse
  int nurseCounter; //counter to display the nurse's text
  int nurseProgress; //counter to display the cut scene

  float aCounter; //counter for the nurse's animations
  float nurseW=56; //width of the nurse
  float nurseH=108; //height of the nurse
  float nurseX=691; //x-coordinate for the nurse
  float nurseY=-400; //y-coordinate for the nurse

  PImage[]firstText = new PImage[29]; //images for the nurses first dialogue
  PImage[]secondText = new PImage[43]; //images for the nurses second dialogue
  PImage[]thirdText = new PImage[27]; //images for the nurses third dialogue
  PImage[]fourthText = new PImage[24]; //images for the nurses fourth dialogue
  PImage[]fifthText = new PImage[11]; //images for the nurses fifth dialogue
  PImage[]sixthText = new PImage[16]; //images for the nurses sixth dialogue
  PImage[]walterResponse = new PImage[5]; //images for responses from walter
  PImage[]walterYes = new PImage[8]; //images for confirmation from walter

  boolean textBuffer; //stops the text from skipping ahead during conversations

  Nurse() {
    rNurse=loadImage("rNurse.png");
    nurseF=loadImage("nurseF.png");
    nurseR=loadImage("nurseR.png");
    nurseL=loadImage("nurseL.png");
    nurseB=loadImage("nurseB.png");

    for (int index=0; index<firstText.length; index++) //index variable has an initial value of 0, must be less than the length of firstText array, and increases by increments of 1
      firstText[index]=loadImage(index+"n1Text.png");
    for (int index=0; index<secondText.length; index++) //index variable has an initial value of 0, must be less than the length of secondText array, and increases by increments of 1
      secondText[index]=loadImage(index+"n2Text.png");
    for (int index=0; index<thirdText.length; index++) //index variable has an initial value of 0, must be less than the length of thirdText array, and increases by increments of 1
      thirdText[index]=loadImage(index+"n3Text.png");
    for (int index=0; index<fourthText.length; index++) //index variable has an initial value of 0, must be less than the length of fourthText array, and increases by increments of 1
      fourthText[index]=loadImage(index+"n4Text.png");
    for (int index=0; index<fifthText.length; index++) //index variable has an initial value of 0, must be less than the length of fifthText array, and increases by increments of 1
      fifthText[index]=loadImage(index+"n5Text.png");
    for (int index=0; index<sixthText.length; index++) //index variable has an initial value of 0, must be less than the length of sixthText array, and increases by increments of 1
      sixthText[index]=loadImage(index+"n6Text.png");
    for (int index=0; index<walterResponse.length; index++) //index variable has an initial value of 0, must be less than the length of walterResponse array, and increases by increments of 1
      walterResponse[index]=loadImage(index+"dotText.png");
    for (int index=0; index<walterYes.length; index++) //index variable has an initial value of 0, must be less than the length of walterYes array, and increases by increments of 1
      walterYes[index]=loadImage(index+"yesText.png");

    for (int index=0; index<spritesF.length; index++) { //index variable has an initial value of 0, must be less than the length of spritesF array, and increases by increments of 1
      spritesF[index]=nurseF.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from nurse's forward walking sprite sheet
      spritesL[index]=nurseL.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from nurse's left walking sprite sheet
      spritesR[index]=nurseR.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from nurse's right walking sprite sheet
      spritesB[index]=nurseB.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from nurse's back walking sprite sheet
      rSprites[index]=rNurse.get(index*originalW, 0, originalW, originalH); //retrieves the separate images from nurse's right idle sprite sheet
    }

    nurseW=map(nurseW, 0, 1920, 0, width);
    nurseH=map(nurseH, 0, 1080, 0, height);
    nurseX=map(nurseX, 0, 1920, 0, width);
    nurseY=map(nurseY, 0, 1080, 0, height);
  }

  void firstScene() { //plays the first scene in the hopsital room
    int indexW=floor(aCounter)%spritesF.length;  //index variable to use each image in Walter's walking sprite sheets
    if (nurseProgress==0) { //if the cut scene has jus started
      noMove=true; //walter cannot move
      if (s1.knockCounter==1) { //if the knock counter is equal to 0
        knock.play(); //play the knock sound
        s1.knockCounter++; //increase the knock counter
      }
    }
    if (key=='e' && keyPressed==true && textBuffer==false && ((roomCounter == 3 &&nurseProgress!=1 && nurseProgress<7) || (roomCounter == 7 && nurseProgress<7))) { //if e is pressed and a section of the cutscene where e is supposed to be pressed in playing
      if (nurseProgress==0 && roomCounter==3) //if this is the first nurse cutscene and the cutscene has just started
        nurseY = 215; //the nurseY is moved to just infront of the door
      nurseProgress++; //progresses the cutscene
      nurseCounter=0; //resets typewriter effect on textboxes
      textBuffer=true; //the cutscene has been updated
    }

    if (roomCounter==3) { //if this is Walter's second time in the hospital room
      if (nurseProgress==0) { //if the cut scene has just started
        image(firstText[nurseCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays the first nurse dialogue
        if (nurseCounter<firstText.length-2) //if the nurse text counter is less than the length of firstText array minus 2
          nurseCounter++; //increase the nurse text counter
        else
          textBuffer=false; //the cutscene is finished updating
      }
      if (nurseProgress==1) { //if the nurseProgress counter is equal to 1
        if (nurseY > height/8 && nurseY < height/4) { //if the nurse is further up on the screen than Walter's bed
          image(spritesF[indexW], nurseX, nurseY, nurseW, nurseH); //displays the nurse walking downwards
          aCounter+=w.aSpeedW; //sets the speed for the nurses walking animation
          nurseY+=w.wSpeedY/3*2; //moves the nurse downwards
        }
        if (nurseY > height/4) { //if the nurse is no longer higher on the screen than Walter's bed
          image (spritesR[indexW], nurseX, nurseY, nurseW, nurseH); //display the nurse walking to the right
          aCounter+=w.aSpeedW; //sets the speed for the nurses walking animation
          nurseX+=w.wSpeedX/3*2; //moves the nurse to the right
        }
        if (nurseX > width/12*7) { //if the nurse reaches Walter's bed
          nurseProgress++; //progresses the cutscene
          textBuffer=false; // the cutscene is finished updating
        }
      }
      if (nurseProgress>1 && nurseProgress<7) { //if the cutscene is in a section where the nurse is supposed to be standing beside Walter's bed
        image (rSprites[indexW], nurseX, nurseY, nurseW, nurseH); //displays the nurse beside Walter's bed
        aCounter+=w.aSpeedI; //sets the speed for the nurse's indle animations
      }
      if (nurseProgress==2) { //if the nurse progress counter is equal to 2
        image(secondText[nurseCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays the second nurse dialogue
        if (nurseCounter<secondText.length-2) //if the nurse text counter is less than the length of secondText array minus 2
          nurseCounter++; //increase the nurse text counter
        else
          textBuffer=false; //the cutscene is finished updating
      }
      if (nurseProgress==3) { //if the nurse progress counter is equal to 3
        image(walterResponse[nurseCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays the walter response dialogue
        if (nurseCounter<walterResponse.length-2) //if the nurse text counter is less than the length of walterResponse array minus 2
          nurseCounter++; //increase the nurse text counter
        else
          textBuffer=false; //the cutscene is finished updating
      }
      if (nurseProgress==4) { //if the nurse progress counter is equal to 4
        image(thirdText[nurseCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays the third nurse dialogue
        if (nurseCounter<thirdText.length-2) //if the nurse text counter is less than the length of thirdText array minus 2
          nurseCounter++; //increase the nurse text counter
        else
          textBuffer=false; //the cutscene is finished updating
      }
      if (nurseProgress==5) { //if the nurse progress counter is equal to 5
        image(walterResponse[nurseCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays the walter response dialogue
        if (nurseCounter<walterResponse.length-2) //if the nurse text counter is less than the length of walterResponse array minus 2
          nurseCounter++; //increase the nurse text counter
        else
          textBuffer=false; //the cutscene is finished updating
      }
      if (nurseProgress==6) { //if the nurse progress counter is equal to 6
        image(fourthText[nurseCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays the fourth nurse dialogue
        if (nurseCounter<fourthText.length-2) //if the nurse text counter is less than the length of fourthText array minus 2
          nurseCounter++; //increase the nurse text counter
        else
          textBuffer=false; //the cutscene is finished updating
      }
      if (nurseProgress==7) { //if the nurse is supposed to be walking away from Walter's bed
        if (nurseX > width/8*3-w.walterW/2) { //if the nurse is further right than the door
          image (spritesL[indexW], nurseX, nurseY, nurseW, nurseH); //display the nurse walking to the left
          aCounter+=w.aSpeedW; //sets the speed for the nurses walking animation
          nurseX-=w.wSpeedX/3*2; //moves the nurse to the left
        }
        if (nurseX < width/8*3-w.walterW/2 && nurseY > height/8) { //if the nurse is no longer to the right of the door, but is further down than the door
          image(spritesB[indexW], nurseX, nurseY, nurseW, nurseH); //displays the nurse walking upwards
          aCounter+=w.aSpeedW; //sets the speed for the nurses walking animation
          nurseY-=w.wSpeedY/3*2; //moves the nurse upwards towards the door
        }
        if (nurseY <= height/8) { //if the nurse reaches the door
          nurseProgress++; //progresses the cutscene
        }
      }
      if (nurseProgress==8) //if the nurse has left the room
        noMove=false; //Walter can now move freely
    }

    if (roomCounter==7) { //if this is Walter's third time in the hospital room
      if (nurseProgress<4) { //if the nurse is supposed to be beside Walter's bed
        image (rSprites[indexW], nurseX, nurseY, nurseW, nurseH); //displays the nurse beside Walter's bed
        aCounter+=w.aSpeedI; //sets the speed for the nurse's idle animations
      }
      if (nurseProgress==0) { //if the cut scene has just started
        image(sixthText[nurseCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays the sixth nurse dialogue
        if (nurseCounter<sixthText.length-2) //if the nurse text counter is less than the length of firstText array minus 2
          nurseCounter++; //increase the nurse text counter
        else
          textBuffer=false; //the cutscene is finished updating
      }
      if (nurseProgress==1) { //if the nurse progress counter is equal to 1
        image(walterResponse[nurseCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays the walter response dialogue
        if (nurseCounter<walterResponse.length-2) //if the nurse text counter is less than the length of walterResponse array minus 2
          nurseCounter++; //increase the nurse text counter
        else
          textBuffer=false; //the cutscene is finished updating
      }
      if (nurseProgress==2) { //if the nurse progress counter is equal to 2
        image(walterYes[nurseCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays the walter yes dialogue
        if (nurseCounter<walterYes.length-2) //if the nurse text counter is less than the length of walterTYes array minus 2
          nurseCounter++; //increase the nurse text counter
        else
          textBuffer=false; //the cutscene is finished updating
      }
      if (nurseProgress==3) { //if the nurse progress counter is equal to 3
        image(fifthText[nurseCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays the fifth nurse dialogue
        if (nurseCounter<fifthText.length-2) //if the nurse text counter is less than the length of fifthText array minus 2
          nurseCounter++; //increase the nurse text counter
        else
          textBuffer=false; //the cutscene is finished updating
      }
      if (nurseProgress==4) { //if the nurse is supposed to be leaving the room
        if (nurseX > width/8*3-w.walterW/2) { //if the nurse is further right than the door
          image (spritesL[indexW], nurseX, nurseY, nurseW, nurseH); //display the nurse walking to the left
          aCounter+=w.aSpeedW; //sets the speed for the nurses walking animation
          nurseX-=w.wSpeedX/3*2; //moves the nurse to the left
        }
        if (nurseX <= width/8*3-w.walterW/2 && nurseY > height/8) { //if the nurse is no longer to the right of the door, but is further down than the door
          image(spritesB[indexW], nurseX, nurseY, nurseW, nurseH); //displays the nurse walking upwards
          aCounter+=w.aSpeedW; //sets the speed for the nurses walking animation
          nurseY-=w.wSpeedY/3*2; //moves the nurse upwards towards the door
        }
        if (nurseY < height/8) { //if the nurse reaches the door
          nurseProgress++; //progresses the cutscene
        }
      }
      if (nurseProgress==5) { //if the nurse progress counter is equal to 5
        w.sleepHR=false; //Walter is out of bed
        w.idle=false; //Walter is moving
        noMove=true; //Walter cannot move
        if (w.walterX>width/8*3-w.walterW/2) { //if walter is to the right of the door
          w.aPressed=true; //the A key has been pressed
          w.walterX-=w.wSpeedX/3*2; //Walter moves to the right
        }
        if (w.walterX<width/8*3 && w.walterY>height/8) { //if walter is no longer to the right of the door, but is further down than the door
          w.aPressed=false; //the A key is no longer pressed
          w.wPressed=true; //the W key has been pressed
          w.walterY-=w.wSpeedY/3*2; //walter moves upwards
        }
        if (w.walterY < height/8) { //if walter reaches the door
          w.wPressed=false; //the W key is no longer pressed
          increaseTransparency=true; //a transition begins
          blackTransition=true; //the black transition begins
        }
      }
    }
  }
}
