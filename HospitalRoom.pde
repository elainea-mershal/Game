class HospitalRoom {
  PImage hospitalRoom; //image of the hospital room
  PImage blanket; //image of the bed blanket

  float[] boundariesX=new float[] {587, 1275}; //left and right hospital room boundaries
  float[] boundariesY=new float[] {95, 725}; //up and down hospital room boundaries
  float[] bedBoundariesX=new float[] {1145, 1150}; //upper and lower horizontal bed boundaries
  float[] bedBoundariesY=new float[] {220, 283}; //upper and lower vertical bed boundaries
  float[] increaseBoundariesX=new float[] {5, 100}; //interval to increase x boundaries and to allow interactions
  float[] increaseBoundariesY=new float[] {5, 70}; //interval to increase y boundaries and to allow interactions

  float[] doorX=new float[] {671, 80}; //x-ccordinate and width of the door
  float doorY=245; //y-coordinate for the door
  int doorCounter; //counter to display the door text
  int aDoorDisplayCounter; //counter to begin to display the angry door text
  int aDoorCounter; //counter to display the angry door text

  float[] diaryX=new float[] {947, 40}; //x-ccordinate and width of the diary
  float diaryY=519; //y-coordinate of the diary
  float[] dBoundariesX=new float[] {895, 965}; //left and right diary boundaries
  float[] dBoundariesY=new float[] {385, 432}; //upper and lower diary boundaries
  int diaryCounter; //counter to display the diary text

  float[] ynX=new float[] {1310, 250}; //x-coordinate and width of the yes/no option
  float[] ynY=new float[] {625, 175}; //y-coordinate and height of the yes/no option
  PImage[]yes = new PImage[2]; //images for the arrow pointing toward yes
  PImage[]no=new PImage[2]; //images for the arrow pointing toward no

  boolean displayDoorText; //boolean to display the door text
  boolean displayDiaryText; //boolean to display the diary text
  boolean displayYes; //boolean to display the arrow pointing towards yes
  boolean displayNo; //boolean to display the arrow pointing towards no

  float[] textX=new float[] {360, 1200}; //x-coordinate and width of the text boxes
  float[] textY=new float[] {800, 240, 700, 340}; //y-coordinate and height of the text boxes
  PImage[]dText = new PImage[13]; //images for the door text
  PImage[]aDoorText = new PImage[18]; //images for the angry door text
  PImage[]diaryText=new PImage[15]; //images for the diary text

  HospitalRoom() {
    hospitalRoom=loadImage("hospitalRoom.png");
    blanket=loadImage("blanket.png");

    for (int index=0; index<dText.length; index++) //index variable has an initial value of 0, must be less than the length of dText array, and increases by increments of 1
      dText[index]=loadImage(index+"dText.png");

    for (int index=0; index<aDoorText.length; index++) //index variable has an initial value of 0, must be less than the length of aDoorText array, and increases by increments of 1
      aDoorText[index]=loadImage(index+"aDoorText.png");

    for (int index=0; index<diaryText.length; index++) //index variable has an initial value of 0, must be less than the length of diaryText array, and increases by increments of 1
      diaryText[index]=loadImage(index+"diaryText.png");

    for (int index=0; index<yes.length; index++) { //index variable has an initial value of 0, must be less than the length of yes array, and increases by increments of 1
      yes[index]=loadImage(str(index)+"yes.png");
      no[index]=loadImage(str(index)+"no.png");
    }

    for (int index=0; index<boundariesX.length; index++) { //index variable has an initial value of 0, must be less than the length of boundariesX array, and increases by increments of 1
      boundariesX[index]=map(boundariesX[index], 0, 1920, 0, width);
      boundariesY[index]=map(boundariesY[index], 0, 1080, 0, height);
      bedBoundariesX[index]=map(bedBoundariesX[index], 0, 1920, 0, width);
      bedBoundariesY[index]=map(bedBoundariesY[index], 0, 1080, 0, height);
      increaseBoundariesX[index]=map(increaseBoundariesX[index], 0, 1920, 0, width);
      increaseBoundariesY[index]=map(increaseBoundariesY[index], 0, 1080, 0, height);
      doorX[index]=map(doorX[index], 0, 1920, 0, width);
      diaryX[index]=map(diaryX[index], 0, 1920, 0, width);
      dBoundariesX[index]=map(dBoundariesX[index], 0, 1920, 0, width);
      dBoundariesY[index]=map(dBoundariesY[index], 0, 1080, 0, height);
      ynX[index]=map(ynX[index], 0, 1920, 0, width);
      ynY[index]=map(ynY[index], 0, 1080, 0, height);
      textX[index]=map(textX[index], 0, 1920, 0, width);
    }

    for (int index=0; index<textY.length; index++) //index variable has an initial value of 0, must be less than the length of textY array, and increases by increments of 1
      textY[index]=map(textY[index], 0, 1080, 0, height);

    doorY=map(doorY, 0, 1080, 0, height);
    diaryY=map(diaryY, 0, 1080, 0, height);
  }

  void display() { //displays the hospital room
    image(hospitalRoom, 0, 0, width, height); //draws the hospital room background
  }

  void boundaries() { //sets movement boundaries for Walter in the hospital room
    if (w.walterX<boundariesX[0]) //if Walter is outside of the left hospital room boundary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    if (w.walterX>boundariesX[1]) //if Walter is outside of the right hospital room boundary
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    if (w.walterY<boundariesY[0]) //if walter is outside of the top hospital room boundary
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
    if (w.walterY>boundariesY[1]) //if Walter is outside of the bottom hospital room boundary
      w.walterY-=w.wSpeedY; //Walter cannot move downwards
  }

  void bedBoundaries() { //sets movement boundaries for Walter around the bed
    if (w.walterY>bedBoundariesY[1] && w.walterY<bedBoundariesY[1]+increaseBoundariesY[0] && w.walterX>bedBoundariesX[1]) //if Walter is at the foot of the bed
      w.walterY+=w.wSpeedY; //Walter cannot move upwards

    if (w.walterY<bedBoundariesY[0] && w.walterX>bedBoundariesX[1]) //if Walter is above the bed
      w.walterX-=w.wSpeedX; //Walter cannot move to the right

    if (w.walterY<bedBoundariesY[1] && w.walterY>bedBoundariesY[0] && w.walterX>bedBoundariesX[1]) { //if Walter is in the bed
      image(blanket, 0, 0, width, height); //Walter is covered by the blanket
      if (key!='a') //if 'a' is not being pressed
        w.sleepHR=true; //Walter is sleeping in the hospital room
      else if (noMove==false)
        w.sleepHR=false; //Walter is not sleeping in the hospital room
    }
  }

  void diaryBoundaries() { //sets movement boundaries for Walter around the diary
    if (w.walterX>dBoundariesX[0] && w.walterX<dBoundariesX[0]+increaseBoundariesX[0] && w.walterY>dBoundariesY[0] && w.walterY<dBoundariesY[1]) //if Walter is at the left boundary of the diary
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<dBoundariesX[1] && w.walterX>dBoundariesX[1]-increaseBoundariesX[0] && w.walterY>dBoundariesY[0] && w.walterY<dBoundariesY[1]) //if Walter is at the right boundary of the diary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY>dBoundariesY[0] && w.walterY<dBoundariesY[0]+increaseBoundariesY[0] && w.walterX>dBoundariesX[0] && w.walterX<dBoundariesX[1]) //if Walter is at the upper boundary of the diary
      w.walterY-=w.wSpeedY; //Walter cannot move down
    else if (w.walterY<dBoundariesY[1] && w.walterY>dBoundariesY[1]-increaseBoundariesY[0] && w.walterX>dBoundariesX[0] && w.walterX<dBoundariesX[1]) //if Walter is at the lower boundary of the diary
      w.walterY+=w.wSpeedY; //Walter cannot move up
  }

  void diaryInteraction() { //allows Walter to interact with the diary
    if (displayDiaryText) { //if the diary text is to be displayed
      noMove=true; //walter cannot move
      image(diaryText[diaryCounter], textX[0], textY[0], textX[1], textY[1]); //displays the diary text
      if (displayYes) //if the yes arrow is to be displayed
        image(yes[frameCount%20/10], ynX[0], ynY[0], ynX[1], ynY[1]); //display the yes arrow
      else if (displayNo) //otherwise, if the no arrow is to be displayed
        image(no[frameCount%20/10], ynX[0], ynY[0], ynX[1], ynY[1]); //display the no arrow
      if (diaryCounter<diaryText.length-2) //if the diary counter is less than the length of diaryText array minus 2
        diaryCounter++; //increase the diary counter
      if (diaryCounter==diaryText.length-1) { //if the diary counter is equal to the length of diaryText array minus 1
        diaryCounter=0; //the diary counter is reset
        displayDiaryText=false; //the diary text is no longer displayed
        noMove=false; //Walter can move
      }
      if (displayYes==false && displayNo==false) //if neither arrow is displayed
        displayYes=true; //display the yes arrow

      delay(10); //causes the program to be delayed for 10 miliseconds
    }
  }

  void diaryKeyPressed() { //triggers the diary interactions related to keys being pressed
    if (key=='e' && increaseTransparency==false) { //if 'e' is pressed and the transition has not begun
      if (w.walterX>dBoundariesX[0] && w.walterX<dBoundariesX[0]+increaseBoundariesX[1] && w.walterY>dBoundariesY[0] && w.walterY<dBoundariesY[1] || w.walterX<dBoundariesX[1] && w.walterX>dBoundariesX[1]-increaseBoundariesX[1] && w.walterY>dBoundariesY[0] && w.walterY<dBoundariesY[1] || w.walterY>dBoundariesY[0] && w.walterY<dBoundariesY[0]+increaseBoundariesY[1] && w.walterX>dBoundariesX[0] && w.walterX<dBoundariesX[1] || w.walterY<dBoundariesY[1] && w.walterY>dBoundariesY[1]-increaseBoundariesY[1] && w.walterX>dBoundariesX[0] && w.walterX<dBoundariesX[1]) { //if Walter is near the diary
        displayDiaryText=true; //the diary text is to be displayed
        if (diaryCounter==diaryText.length-2) { //if the diary text counter is less than the length of diaryText array minus one
          if (displayNo) //if the no arrow is displayed
            diaryCounter++; //the diary text counter increases by 1
          if (displayYes) { //if the yes arrow is displayed
            increaseTransparency=true; //the transparency transition begins
            whiteTransition=true; //the white transparency transition begins
            diaryCounter++; //the diary counter increases by 1
          }
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
      noMove=true; //walter cannot move
      image(dText[doorCounter], textX[0], textY[0], textX[1], textY[1]); //displays the door text
      if (doorCounter<dText.length-2) //if the door counter is less than the length of dText array minus 2
        doorCounter++; //increase the door counter
      if (doorCounter==dText.length-1 || (aDoorDisplayCounter==2 && aDoorCounter==aDoorText.length-1)) { //if the door counter is equal to the length of dText array minus 1 or if the angry door display counter is equal to 2 and the angry door counter is equal to the length of aDoorText array minus 1
        doorCounter=0; //the door counter is reset
        displayDoorText=false; //the door text is no longer displayed
        noMove=false; //Walter can move
        aDoorDisplayCounter++; //the angry door text display counter is increased
      }
      if (aDoorDisplayCounter==2) { //if the angry door text display counter is equal to 2
        doorCounter=0; //the door counter is reset
        image(aDoorText[aDoorCounter], textX[0], textY[0], textX[1], textY[1]); //displays the angry door text
        if (aDoorCounter<aDoorText.length-2) //if the angry door text counter is less than the length of aDoorText array minus 2
          aDoorCounter++; //increase the angry door counter
      }
      delay(10); //causes the program to be delayed for 10 miliseconds
    }
  }

  void doorKeyPressed() { //triggers the door interactions related to keys being pressed
    if (key=='e') { //if 'e' is pressed
      if (w.walterY<=doorY && w.walterX>=doorX[0] && w.walterX<=doorX[0]+doorX[1]) { //if Walter is near the door
        displayDoorText=true; //the door text is to be displayed
        if (doorCounter<dText.length-1) //if the door counter is less than one less than the length of dText
          doorCounter++; //the door text counter increases by 1
        if (aDoorCounter<aDoorText.length-1) //if the angry door counter is less than one less than the length of aDoorText
          aDoorCounter++; //the angry door text counter increases by 1
      }
    }
  }
}
