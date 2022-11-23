class HospitalRoom { //<>// //<>//
  int boundaryL=587; //left hospital room boundary for Walter
  int hrBoundaryR=1275; //right hospital room boundary for Walter
  int boundaryU=95; //up hospital room boundary for Walter
  int boundaryD=725; //down hospital room boundary for Walter

  int bedBoundaryLX=1150; //horizontal lower bed boundary for Walter
  int bedBoundaryLY=283; //vertical lower bed boundary for Walter
  int bedBoundaryUX=1145; //horizontal upper bed boundary for Walter
  int bedBoundaryUY=220; //vertical upper bed boundary

  int doorW=80; //width of the door
  int doorX=671; //x-coordinate for the door
  int doorY=245; //y-coordinate for the door
  int doorTextCounter;
  int daTextCounter;
  int diaryTextCounter;

  int diaryW=40; //width of the diary
  int diaryX=947; //x-coordinate of the diary
  int diaryY=519; //y-coordinate of the diary
  int dBoundaryL=895;
  int dBoundaryR=965;
  int dBoundaryU=384;
  int dBoundaryD=432;

  PImage hospitalRoom; //image of the hospital room
  PImage blanket; //image of the bed blanket

  PImage[]yes = new PImage[3];
  PImage[]no=new PImage[3];

  boolean displayDoorText;
  boolean displayDiaryText;
  boolean displayYes;
  boolean displayNo;
  boolean displayTransition=false;

  HospitalRoom() {
    hospitalRoom=loadImage("hospitalRoom.png");
    blanket=loadImage("blanket.png");

    for (int index=0; index<yes.length; index++) {
      yes[index]=loadImage(str(index)+"yes.png");
      no[index]=loadImage(str(index)+"no.png");
    }
  }

  void displayHR() { //displays the hospital room
    image(hospitalRoom, 0, 0); //draws the hospital room background
  }

  void brownNoise () { //brown noise to play in hospital room
    brownNoise.play(); //plays the noise for the hospital room
    brownNoise.loop(); //when the hospital room noise ends, it starts playing again
    brownNoise.amp(0.2); //lowers the volume of the hospital room noise to a quarter of its volume
  }

  void boundaries() { //sets movement boundaries for Walter in the hospital room
    if (w.walterX<boundaryL) //if Walter is outside of the left hospital room boundary
      w.walterX+=w.wSpeed; //Walter cannot move to the left
    if (w.walterX>hrBoundaryR) //if Walter is outside of the right hospital room boundary
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

  void diaryBoundaries() {
    if (w.walterX>dBoundaryL && w.walterX<dBoundaryL+5 && w.walterY>dBoundaryU && w.walterY<dBoundaryD)
      w.walterX-=w.wSpeed;
    if (w.walterX<dBoundaryR && w.walterX>dBoundaryR-5 && w.walterY>dBoundaryU && w.walterY<dBoundaryD)
      w.walterX+=w.wSpeed;
    if (w.walterY>dBoundaryU && w.walterY<dBoundaryU+5 && w.walterX>dBoundaryL && w.walterX<dBoundaryR)
      w.walterY-=w.wSpeed;
    if (w.walterY<dBoundaryD && w.walterY>dBoundaryD-5 && w.walterX>dBoundaryL && w.walterX<dBoundaryR)
      w.walterY+=w.wSpeed;
  }

  void diaryInteraction() {
    if (displayDiaryText) {
      if (displayYes)
        image(yes[frameCount%20/10], 1310, 625);
      else if (displayNo)
        image(no[frameCount%20/10], 1310, 625);
      else if (displayYes==false && displayNo==false)
        displayYes=true;
      if (diaryTextCounter==1) {
        diaryText.play();
        noMove=true;
        image(diaryText, 360, 800);
        diaryTextCounter++;
      } else if (diaryTextCounter==2) {
        image(diaryText, 360, 800);
        noMove=true;
      } else if (diaryTextCounter==3) {
        noMove=false;
        displayDiaryText=false;
        diaryTextCounter=0;
      }
    }
  }

  void doorInteraction() {
    if (displayDoorText) {
      if (doorTextCounter==1) {
        doorText.play();
        noMove=true;
        image(doorText, 360, 800);
        doorTextCounter++;
      } else if (doorTextCounter==2) {
        image(doorText, 360, 800);
        noMove=true;
      } else if (doorTextCounter==3) {
        noMove=false;
        displayDoorText=false;
        doorTextCounter=0;
      }
      if (daTextCounter==7) {
        doorAText.play();
        noMove=true;
        image(doorAText, 360, 800);
        doorTextCounter=0;
        daTextCounter++;
      } else if (daTextCounter==8) {
        image(doorAText, 360, 800);
        noMove=true;
        doorTextCounter=0;
      } else if (daTextCounter==9) {
        noMove=false;
        displayDoorText=false;
        doorTextCounter=0;
      }
    }
  }
  
  void transition() {
    if(displayTransition) {
    whiteFlash.play();
    image(whiteFlash,0,0);
    }
  }

  void hrKeyPressed() {
    if (key=='e') {
      if (w.walterY<=doorY && w.walterX>=doorX && w.walterX<=doorX+doorW) {
        displayDoorText=true;
        doorTextCounter++;
        daTextCounter++;
      }
      if (w.walterX>dBoundaryL && w.walterX<dBoundaryL+100 && w.walterY>dBoundaryU && w.walterY<dBoundaryD || w.walterX<dBoundaryR && w.walterX>dBoundaryR-100 && w.walterY>dBoundaryU && w.walterY<dBoundaryD || w.walterY>dBoundaryU && w.walterY<dBoundaryU+70 && w.walterX>dBoundaryL && w.walterX<dBoundaryR || w.walterY<dBoundaryD && w.walterY>dBoundaryD-70 && w.walterX>dBoundaryL && w.walterX<dBoundaryR) {
        displayDiaryText=true;
        if (diaryTextCounter<2 || displayNo)
          diaryTextCounter++;
          if(diaryTextCounter==2 && displayYes)
          displayTransition=true;
      }
    }
    if (displayDiaryText) {
      if (key=='w') {
        displayYes=true;
        displayNo=false;
      }
      if (key=='s') {
        displayYes=false;
        displayNo=true;
      }
    }
  }
}
