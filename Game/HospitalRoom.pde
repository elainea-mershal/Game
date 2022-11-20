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
  int dTextCounter;
  int daTextCounter;

  int diaryW=40; //width of the diary
  int diaryX=947; //x-coordinate of the diary
  int diaryY=519; //y-coordinate of the diary

  PImage hospitalRoom; //image of the hospital room
  PImage blanket; //image of the bed blanket

  boolean displayDText;

  HospitalRoom() {
    hospitalRoom=loadImage("hospitalRoom.png");
    blanket=loadImage("blanket.png");
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

  void doorInteraction() {
    if (displayDText) {
      if (dTextCounter==1) {
        doorText.play();
        noMove=true;
        image(doorText, 360, 800);
        dTextCounter++;
      } else if (dTextCounter==2) {
        image(doorText, 360, 800);
        noMove=true;
      } else if (dTextCounter==3) {
        noMove=false;
        displayDText=false;
        dTextCounter=0;
      }
      if (daTextCounter==7) {
        doorAText.play();
        noMove=true;
        image(doorAText, 360, 800);
        dTextCounter=0;
        daTextCounter++;
      } else if (daTextCounter==8) {
        image(doorAText, 360, 800);
        noMove=true;
        dTextCounter=0;
      } else if (daTextCounter==9) {
        noMove=false;
        displayDText=false;
        dTextCounter=0;
      }
    }
  }

  void hrKeyPressed() {
    if (key=='e') {
      if (w.walterY<=doorY && w.walterX>=doorX && w.walterX<=doorX+doorW) {
        displayDText=true;
        dTextCounter++;
        daTextCounter++;
      }
    }
  }
}
