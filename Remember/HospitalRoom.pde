class HospitalRoom {
  PImage hospitalRoom; //image of the hospital room
  PImage blanket; //image of the bed blanket

  int boundaryL; //left hospital room boundary
  int boundaryR; //right hospital room boundary
  int boundaryU; //up hospital room boundary
  int boundaryD; //down hospital room boundary

  int bedBoundaryLX; //horizontal lower bed boundary
  int bedBoundaryLY; //vertical lower bed boundary
  int bedBoundaryUX; //horizontal upper bed boundary
  int bedBoundaryUY; //vertical upper bed boundary

  int doorW; //width of the door
  int doorX; //x-coordinate for the door
  int doorY; //y-coordinate for the door
  int doorCounter; //counter to display the door text
  int aDoorDisplayCounter; //counter to display the angry door text
  int aDoorCounter;

  int diaryW; //width of the diary
  int diaryX; //x-coordinate of the diary
  int diaryY; //y-coordinate of the diary
  int dBoundaryL; //left diary boundary
  int dBoundaryR; //right diary boundary
  int dBoundaryU; //up diary boundary
  int dBoundaryD; //down diary boundary
  int diaryCounter; //counter to display the diary text

  int boundaryIncreaseX; //interval to increase x boundaries
  int boundaryIncreaseY; //interval to increase y boundaries
  int boundaryInteractionX; //increases x boundaries to allow interactions
  int boundaryInteractionY; //increases y boundaries to allow interactions

  int ynX; //x-coordinate for the yes/no option
  int ynY; //y-coordinate for the yes/no option
  int ynW; //width of the yes/no option
  int ynH; //height of the yes/no option
  PImage[]yes = new PImage[2]; //images for the arrow pointing toward yes
  PImage[]no=new PImage[2]; //images for the arrow pointing toward no

  boolean displayDoorText; //boolean to display the door text
  boolean displayDiaryText; //boolean to display the diary text
  boolean displayYes; //boolean to display the arrow pointing towards yes
  boolean displayNo; //boolean to display the arrow pointing towards no

  int textX; //x-coordinate for the text boxes
  int textY; //y-coordinate for the text boxes
  int textW; //width of the text boxes
  int textH; //height of the text boxes

  PImage[]dText = new PImage[13];
  PImage[]aDoorText = new PImage[18];

  HospitalRoom() {
    hospitalRoom=loadImage("hospitalRoom.png");
    blanket=loadImage("blanket.png");

    for (int index=0; index<dText.length; index++)
      dText[index]=loadImage(index+"dText.png");

    for (int index=0; index<aDoorText.length; index++)
      aDoorText[index]=loadImage(index+"aDoorText.png");

    boundaryL=width*587/1920;
    boundaryR=width*1275/1920;
    boundaryU=height*95/1080;
    boundaryD=height*725/1080;

    bedBoundaryLX=width*1150/1920;
    bedBoundaryLY=height*283/1080;
    bedBoundaryUX=width*1145/1920;
    bedBoundaryUY=height*220/1080;

    doorW=width*80/1920;
    doorX=width*671/1920;
    doorY=height*245/1080;

    diaryW=width*40/1920;
    diaryX=width*947/1920;
    diaryY=height*519/1080;
    dBoundaryL=width*895/1920;
    dBoundaryR=width*965/1920;
    dBoundaryU=height*384/1080;
    dBoundaryD=height*432/1080;

    ynX=width*1310/1920;
    ynY=height*625/1080;
    ynW=width*250/1920;
    ynH=height*175/1080;

    textX=width*360/1920;
    textY=height*800/1080;
    textW=width*1200/1920;
    textH=height*240/1080;

    boundaryIncreaseX=width*5/1920;
    boundaryIncreaseY=height*5/1080;
    boundaryInteractionX=width*100/1920;
    boundaryInteractionY=height*70/1080;


    for (int index=0; index<yes.length; index++) { //index variable has an initial value of 0, must be less than the length of yes array, and increases by increments of 1
      yes[index]=loadImage(str(index)+"yes.png");
      no[index]=loadImage(str(index)+"no.png");
    }
  }

  void brownNoise () { //plays brown noise in the hospital room
    brownNoise.play(); //plays the noise for the hospital room
    brownNoise.loop(); //when the hospital room noise ends, it starts playing again
    brownNoise.amp(0.2); //lowers the volume of the hospital room noise to a quarter of its volume
  }

  void display() { //displays the hospital room
    image(hospitalRoom, 0, 0, width, height); //draws the hospital room background
  }

  void boundaries() { //sets movement boundaries for Walter in the hospital room
    if (w.walterX<boundaryL) //if Walter is outside of the left hospital room boundary
      w.walterX+=w.wSpeed; //Walter cannot move to the left
    if (w.walterX>boundaryR) //if Walter is outside of the right hospital room boundary
      w.walterX-=w.wSpeed; //Walter cannot move to the right
    if (w.walterY<boundaryU) //if walter is outside of the top hospital room boundary
      w.walterY+=w.wSpeed; //Walter cannot move upwards
    if (w.walterY>boundaryD) //if Walter is outside of the bottom hospital room boundary
      w.walterY-=w.wSpeed; //Walter cannot move downwards
  }

  void bedBoundaries() { //sets movement boundaries for Walter around the bed
    if (w.walterY>bedBoundaryLY && w.walterY<bedBoundaryLY+boundaryIncreaseY && w.walterX>bedBoundaryLX) //if Walter is at the foot of the bed
      w.walterY+=w.wSpeed; //Walter cannot move upwards

    if (w.walterY<bedBoundaryUY && w.walterX>bedBoundaryLX) //if Walter is above the bed
      w.walterX-=w.wSpeed; //Walter cannot move to the right

    if (w.walterY<bedBoundaryLY && w.walterY>bedBoundaryUY && w.walterX>bedBoundaryLX) { //if Walter is in the bed
      image(blanket, 0, 0, width, height); //Walter is covered by the blanket
      if (key!='a') //if 'a' is not being pressed
        w.sleep=true; //Walter is sleeping
      else
        w.sleep=false; //Walter is not sleeping
    }
  }

  void diaryBoundaries() { //sets movement boundaries for Walter around the diary
    if (w.walterX>dBoundaryL && w.walterX<dBoundaryL+boundaryIncreaseX && w.walterY>dBoundaryU && w.walterY<dBoundaryD) //if Walter is at the left boundary of the diary
      w.walterX-=w.wSpeed; //Walter cannot move to the right
    if (w.walterX<dBoundaryR && w.walterX>dBoundaryR-boundaryIncreaseX && w.walterY>dBoundaryU && w.walterY<dBoundaryD) //if Walter is at the right boundary of the diary
      w.walterX+=w.wSpeed; //Walter cannot move to the left
    if (w.walterY>dBoundaryU && w.walterY<dBoundaryU+boundaryIncreaseY && w.walterX>dBoundaryL && w.walterX<dBoundaryR) //if Walter is at the upper boundary of the diary
      w.walterY-=w.wSpeed; //Walter cannot move down
    if (w.walterY<dBoundaryD && w.walterY>dBoundaryD-boundaryIncreaseY && w.walterX>dBoundaryL && w.walterX<dBoundaryR) //if Walter is at the lower boundary of the diary
      w.walterY+=w.wSpeed; //Walter cannot move up
  }

  void diaryInteraction() { //allows Walter to interact with the diary
    if (displayDiaryText) { //if the diary text is to be displayed
      if (displayYes) //if the yes arrow is to be displayed
        image(yes[frameCount%20/10], ynX, ynY, ynW, ynH); //display the yes arrow
      else if (displayNo) //otherwise, if the no arrow is to be displayed
        image(no[frameCount%20/10], ynX, ynY, ynW, ynH); //display the no arrow
      else if (displayYes==false && displayNo==false) //otherwise, if neither arrow is displayed
        displayYes=true; //display the yes arrow
      if (diaryCounter==1) { //if the diary text counter is 1
        diaryText.play(); //play the diary text gif
        noMove=true; //Walter cannot move
        image(diaryText, textX, textY, textW, textH); //display the diary text
        diaryCounter++; //increase the diary text counter by 1
      } else if (diaryCounter==2) { //otherwise, if the diary text counter is 2
        image(diaryText, textX, textY, textW, textH); //display the diary text
        noMove=true; //Walter cannot move
      } else if (diaryCounter==3) { //otherwise, if the diary text counter is 3
        noMove=false; //Walter can move
        displayDiaryText=false; //the diary text is no longer displayed
        diaryCounter=0; //the diary text counter is reset
      }
    }
  }

  void diaryKeyPressed() { //triggers the diary interactions related to keys being pressed
    if (key=='e') { //if 'e' is pressed
      if (w.walterX>dBoundaryL && w.walterX<dBoundaryL+boundaryInteractionX && w.walterY>dBoundaryU && w.walterY<dBoundaryD || w.walterX<dBoundaryR && w.walterX>dBoundaryR-boundaryInteractionX && w.walterY>dBoundaryU && w.walterY<dBoundaryD || w.walterY>dBoundaryU && w.walterY<dBoundaryU+boundaryInteractionY && w.walterX>dBoundaryL && w.walterX<dBoundaryR || w.walterY<dBoundaryD && w.walterY>dBoundaryD-boundaryInteractionY && w.walterX>dBoundaryL && w.walterX<dBoundaryR) { //if Walter is near the diary
        displayDiaryText=true; //the diary text is to be displayed
        noMove=true; //Walter cannot move
        if (diaryCounter<2 || displayNo) //if the diary text counter is less than 2 and the arrow pointing towards no is displayed
          diaryCounter++; //the diary text counter increases by 1
        if (diaryCounter==2 && displayYes) { //if the diary text counter is 2 and the arrow pointing towards yes is displayed
          increaseTransparency=true; //the transparency transition begins
          whiteTransition=true; //the white transparency transition begins
          diaryCounter++; //the diary counter increases by 1
        }
      }
    }
    if (displayDiaryText) { //if the diary text is displayed
      if (key=='w') { //if 'w' is pressed
        displayYes=true; //the arrow points towards yes
        displayNo=false; //the arrow points towards no
      }
      if (key=='s') { //if 's' is pressed
        displayYes=false; //the arrow points towards yes
        displayNo=true; //the arrow points towards no
      }
    }
  }

  void doorInteraction() { //allows Walter to interact with the door
    if (displayDoorText) { //if the door text is to be displayed
      noMove=true;
      image(dText[doorCounter], textX, textY, textW, textH);
      if (doorCounter<dText.length-2)
        doorCounter++;
      if (doorCounter==dText.length-1 || aDoorCounter==aDoorText.length-1) {
        doorCounter=0;
        displayDoorText=false;
        noMove=false;
        aDoorDisplayCounter++;
      }
      if (aDoorDisplayCounter==2) {
        doorCounter=0;
        image(aDoorText[aDoorCounter], textX, textY, textW, textH);
        if (aDoorCounter<aDoorText.length-2)
          aDoorCounter++;
      }
      delay(10);



      /*if (doorCounter==1) { //if the door text counter is 1
       doorText.play(); //play the door text gif
       noMove=true; //Walter cannot move
       image(doorText, textX, textY, textW, textH); //display the door text
       doorCounter++; //increase the door text counter by 1
       } else if (doorCounter==2) { //otherwise, if the door text counter is 2
       image(doorText, textX, textY, textW, textH); //display the door text
       noMove=true; //Walter cannot move
       } else if (doorCounter==3) { //otherwise, if the door text counter is 3
       noMove=false; //Walter can move
       displayDoorText=false; //the door text is no longer displayed
       doorCounter=0; //the door text counter is reset
       }
       if (aDoorCounter==7) { //if the angry door text counter is 7
       doorAText.play(); //play the angry door text gif
       noMove=true; //Walter cannot move
       image(doorAText, textX, textY, textW, textH); //display the angry door text
       doorCounter=0; //reset the door text counter
       aDoorCounter++; //increase the angry door text counter by 1
       } else if (aDoorCounter==8) { //otherwise, if the angry door text counter is 8
       image(doorAText, textX, textY, textW, textH); //display the angry door text
       noMove=true; //Walter cannot move
       doorCounter=0; //reset the door text counter
       } else if (aDoorCounter==9) { //otherwise, if the angry door text counter is 9
       noMove=false; //Walter can move
       displayDoorText=false; //the angry door text is no longer displayed
       doorCounter=0; //reset the door text counter
       } */
    }
  }

  void doorKeyPressed() { //triggers the door interactions related to keys being pressed
    if (key=='e') { //if 'e' is pressed
      if (w.walterY<=doorY && w.walterX>=doorX && w.walterX<=doorX+doorW) { //if Walter is near the door
        displayDoorText=true; //the door text is to be displayed
        if (doorCounter<dText.length-1) //if the door counter is less than one less than the length of dText
          doorCounter++; //the door text counter increases by 1
        if (aDoorCounter<aDoorText.length-1) //if the angry door counter is less than one less than the length of aDoorText
          aDoorCounter++; //the angry door text counter increases by 1
      }
    }
  }
}
