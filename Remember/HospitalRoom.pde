class HospitalRoom {
  PImage hospitalRoom; //image of the hospital room
  PImage blanket; //image of the bed blanket

  int boundaryL=587; //left hospital room boundary for Walter
  int boundaryR=1275; //right hospital room boundary for Walter
  int boundaryU=95; //up hospital room boundary for Walter
  int boundaryD=725; //down hospital room boundary for Walter

  int bedBoundaryLX=1150; //horizontal lower bed boundary for Walter
  int bedBoundaryLY=283; //vertical lower bed boundary for Walter
  int bedBoundaryUX=1145; //horizontal upper bed boundary for Walter
  int bedBoundaryUY=220; //vertical upper bed boundary

  int doorW=80; //width of the door
  int doorX=671; //x-coordinate for the door
  int doorY=245; //y-coordinate for the door
  int doorCounter; //counter to display the door text
  int aDoorCounter; //counter to display the angry door text

  int diaryW=40; //width of the diary
  int diaryX=947; //x-coordinate of the diary
  int diaryY=519; //y-coordinate of the diary
  int dBoundaryL=895; //left diary boundary
  int dBoundaryR=965; //right diary boundary
  int dBoundaryU=384; //up diary boundary
  int dBoundaryD=432; //down diary boundary
  int diaryCounter; //counter to display the diary text

  PImage[]yes = new PImage[2]; //images for the arrow pointing toward yes
  PImage[]no=new PImage[2]; //images for the arrow pointing toward no

  boolean displayDoorText; //boolean to display the door text
  boolean displayDiaryText; //boolean to display the diary text
  boolean displayYes; //boolean to display the arrow pointing towards yes
  boolean displayNo; //boolean to display the arrow pointing towards no

  HospitalRoom() {
    hospitalRoom=loadImage("hospitalRoom.png");
    blanket=loadImage("blanket.png");

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
    image(hospitalRoom, 0, 0); //draws the hospital room background
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
    if (w.walterY>bedBoundaryLY && w.walterY<bedBoundaryLY+5 && w.walterX>bedBoundaryLX) //if Walter is at the foot of the bed
      w.walterY+=w.wSpeed; //Walter cannot move upwards

    if (w.walterY<bedBoundaryUY && w.walterX>bedBoundaryLX) //if Walter is above the bed
      w.walterX-=w.wSpeed; //Walter cannot move to the right

    if (w.walterY<bedBoundaryLY && w.walterY>bedBoundaryUY && w.walterX>bedBoundaryLX) { //if Walter is in the bed
      image(blanket, 0, 0); //Walter is covered by the blanket
      if (key!='a') //if 'a' is not being pressed
        w.sleep=true; //Walter is sleeping
      else
        w.sleep=false; //Walter is not sleeping
    }
  }

  void diaryBoundaries() { //sets movvement boundaries for Walter around the diary
    if (w.walterX>dBoundaryL && w.walterX<dBoundaryL+5 && w.walterY>dBoundaryU && w.walterY<dBoundaryD) //if Walter is at the left boundary of the diary
      w.walterX-=w.wSpeed; //Walter cannot move to the right
    if (w.walterX<dBoundaryR && w.walterX>dBoundaryR-5 && w.walterY>dBoundaryU && w.walterY<dBoundaryD) //if Walter is at the right boundary of the diary
      w.walterX+=w.wSpeed; //Walter cannot move to the left
    if (w.walterY>dBoundaryU && w.walterY<dBoundaryU+5 && w.walterX>dBoundaryL && w.walterX<dBoundaryR) //if Walter is at the upper boundary of the diary
      w.walterY-=w.wSpeed; //Walter cannot move down
    if (w.walterY<dBoundaryD && w.walterY>dBoundaryD-5 && w.walterX>dBoundaryL && w.walterX<dBoundaryR) //if Walter is at the lower boundary of the diary
      w.walterY+=w.wSpeed; //Walter cannot move up
  }

  void diaryInteraction() { //allows Walter to interact with the diary
    if (displayDiaryText) { //if the diary text is to be displayed
      if (displayYes) //if the yes arrow is to be displayed
        image(yes[frameCount%20/10], 1310, 625); //display the yes arrow
      else if (displayNo) //otherwise, if the no arrow is to be displayed
        image(no[frameCount%20/10], 1310, 625); //display the no arrow
      else if (displayYes==false && displayNo==false) //otherwise, if neither arrow is displayed
        displayYes=true; //display the yes arrow
      if (diaryCounter==1) { //if the diary text counter is 1
        diaryText.play(); //play the diary text gif
        noMove=true; //Walter cannot move
        image(diaryText, 360, 800); //display the diary text
        diaryCounter++; //increase the diary text counter by 1
      } else if (diaryCounter==2) { //otherwise, if the diary text counter is 2
        image(diaryText, 360, 800); //display the diary text
        noMove=true; //Walter cannot move
      } else if (diaryCounter==3) { //otherwise, if the diary text counter is 3
        noMove=false; //Walter can move
        displayDiaryText=false; //the diary text is no longer displayed
        diaryCounter=0; //the diary text counter is reset
      }
    }
  }

  void doorInteraction() { //allows Walter to interact with the door
    if (displayDoorText) { //if the door text is to be displayed
      if (doorCounter==1) { //if the door text counter is 1
        doorText.play(); //play the door text gif
        noMove=true; //Walter cannot move
        image(doorText, 360, 800); //display the door text
        doorCounter++; //increase the door text counter by 1
      } else if (doorCounter==2) { //otherwise, if the door text counter is 2
        image(doorText, 360, 800); //display the door text
        noMove=true; //Walter cannot move
      } else if (doorCounter==3) { //otherwise, if the door text counter is 3
        noMove=false; //Walter can move
        displayDoorText=false; //the door text is no longer displayed
        doorCounter=0; //the door text counter is reset
      }
      if (aDoorCounter==7) { //if the angry door text counter is 7
        doorAText.play(); //play the angry door text gif
        noMove=true; //Walter cannot move
        image(doorAText, 360, 800); //display the angry door text
        doorCounter=0; //reset the door text counter
        aDoorCounter++; //increase the angry door text counter by 1
      } else if (aDoorCounter==8) { //otherwise, if the angry door text counter is 8
        image(doorAText, 360, 800); //display the angry door text
        noMove=true; //Walter cannot move
        doorCounter=0; //reset the door text counter
      } else if (aDoorCounter==9) { //otherwise, if the angry door text counter is 9
        noMove=false; //Walter can move
        displayDoorText=false; //the angry door text is no longer displayed
        doorCounter=0; //reset the door text counter
      }
    }
  }

  void hrKeyPressed() { //allows interactions when certain keys are pressed
    if (key=='e') { //if 'e' is pressed
      if (w.walterY<=doorY && w.walterX>=doorX && w.walterX<=doorX+doorW) { //if Walter is near the door
        displayDoorText=true; //the door text is to be displayed
        doorCounter++; //the door text counter increases by 1
        aDoorCounter++; //the angry door text counter increases by 1
      }
      if (w.walterX>dBoundaryL && w.walterX<dBoundaryL+100 && w.walterY>dBoundaryU && w.walterY<dBoundaryD || w.walterX<dBoundaryR && w.walterX>dBoundaryR-100 && w.walterY>dBoundaryU && w.walterY<dBoundaryD || w.walterY>dBoundaryU && w.walterY<dBoundaryU+70 && w.walterX>dBoundaryL && w.walterX<dBoundaryR || w.walterY<dBoundaryD && w.walterY>dBoundaryD-70 && w.walterX>dBoundaryL && w.walterX<dBoundaryR) { //if Walter is near the diary
        displayDiaryText=true; //the diary text is to be displayed
        if (diaryCounter<2 || displayNo) //if the diary text counter is less than 2 and the arrow pointing towards no is displayed
          diaryCounter++; //the diary text counter increases by 1
        if (diaryCounter==2 && displayYes) //if the diary text counter is 2 and the arrow pointing towards yes is displayed
          increaseTransparency=true; //the transparency transition begins
          whiteTransition=true;
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
}
