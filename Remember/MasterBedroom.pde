class MasterBedroom {
  PImage masterBedroom; //image of the master bedroom
  PImage masterCover; //image of the cover in the master bedroom
  PImage dressers; //image of the dressers

  float[] bedBoundariesX=new float[] {823, 1031}; //left and right bed boundaries
  float[] sTableBoundariesX=new float[] {770, 1087}; //left and right side table boundaries
  float[] bookcaseBoundariesX=new float[] {476, 729, 1133, 1385}; //left and right bookcase boundaries for the left and right bookcases
  float[] dresserBoundariesX=new float[] {485, 1375}; //right boundary for the left dresser and left boundary for the right dresser
  float[] dresserBoundariesY=new float[] {250, 365}; //upper and lower dresser boundaries
  float[] doorY=new float[] {480, 616}; //upper and lower door boundaries
  float bedBoundaryY=285; //upper bed boundary
  float sTableBoundaryY=243; //upper side tables boundary
  float bookcaseBoundaryY=227; //upper bookcase boundary

  boolean sleepLeft; //boolean for if Walter is sleeping on the left side of the bed
  boolean sleepRight; //boolean for if Walter is sleeping on the right side of the bed

  MasterBedroom() {
    masterBedroom=loadImage("masterBedroom.png");
    masterCover=loadImage("masterCover.png");
    dressers=loadImage("dressers.png");

    for (int index=0; index<bedBoundariesX.length; index++) { //index variable has an initial value of 0, must be less than the length of boundariesX array, and increases by increments of 1
      bedBoundariesX[index]=map(bedBoundariesX[index], 0, 1920, 0, width);
      sTableBoundariesX[index]=map(sTableBoundariesX[index], 0, 1920, 0, width);
      dresserBoundariesX[index]=map(dresserBoundariesX[index], 0, 1920, 0, width);
      dresserBoundariesY[index]=map(dresserBoundariesY[index], 0, 1080, 0, height);
      doorY[index]=map(doorY[index], 0, 1080, 0, height);
    }
    for (int index=0; index<bookcaseBoundariesX.length; index++) //index variable has an initial value of 0, must be less than the length of bookcaseBoundariesX array, and increases by increments of 1
      bookcaseBoundariesX[index]=map(bookcaseBoundariesX[index], 0, 1920, 0, width);

    bedBoundaryY=map(bedBoundaryY, 0, 1080, 0, height);
    sTableBoundaryY=map(sTableBoundaryY, 0, 1080, 0, height);
    bookcaseBoundaryY=map(bookcaseBoundaryY, 0, 1080, 0, height);
  }

  void display() { //displays the master bedroom
    image(masterBedroom, 0, 0, width, height); //draws the background image of the master bedroom
  }

  void displayFurniture() { //displays the master bedroom furniture on top of Walter
    if (w.walterY<=dresserBoundariesY[0]+hr.increaseBoundariesY[0]) //if Walter is above the dressers
      image(dressers, 0, 0, width, height); //display the dressers
  }

  void boundaries() { //sets movement boundaries for Walter in the master bedroom
    if (w.walterX<lr.boundariesX[0]) //if Walter is outside of the left master bedroom boundary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    if (w.walterX>lr.boundariesX[1] && (w.walterY<doorY[0] || w.walterY>doorY[1])) //if Walter is outside of the right master bedroom boundary
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    if (w.walterY<lr.boundariesY[0]) //if Walter is outside of the upper master bedroom boundary
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
    if (w.walterY>lr.boundariesY[1]) //if Walter is outside of the lower master bedroom boundary
      w.walterY-=w.wSpeedY; //Walter cannot move downwards
  }

  void bedBoundaries() { //allows Walter to sleep in the bed
    if (w.walterX>bedBoundariesX[0] && w.walterX<bedBoundariesX[1] && w.walterY<bedBoundaryY) //if Walter is at the bottom bed boundary
      w.walterY+=w.wSpeedY; //Walter cannot move upwards

    if (w.walterX>bedBoundariesX[0] && w.walterX<bedBoundariesX[0]+hr.increaseBoundariesX[1] && w.walterY<bedBoundaryY) { //if Walter is in the left side of the bed
      image(masterCover, 0, 0, width, height); //Walter is covered by the blanket
      if (key!='a') //if 'a' is not being pressed
        w.sleepMBL=true; //Walter is sleeping in the left side of the master bed
      else if (noMove==false) //if Walter can move
        w.sleepMBL=false; //Walter is not sleeping in the left side
    }

    if (w.walterX<bedBoundariesX[1] && w.walterX>bedBoundariesX[1]-hr.increaseBoundariesX[1] && w.walterY<bedBoundaryY) { //if Walter is in the right side of the bed
      image(masterCover, 0, 0, width, height); //Walter is covered by the blanket
      if (key!='d') //if 'd' is not being pressed
        w.sleepMBR=true; //Walter is sleeping in the right side of the master bed
      else if (noMove==false) //if Walter can move
        w.sleepMBR=false; //Walter is not sleeping in the right side of the master bed
    }
  }

  void sTableBoundaries() { //sets movement boundaries for Walter around the side tables
    if (w.walterX>sTableBoundariesX[0] && w.walterX<sTableBoundariesX[0]+hr.increaseBoundariesX[0] && w.walterY<sTableBoundaryY) //if Walter is at the left boundary of the side tables
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<sTableBoundariesX[1] && w.walterX>sTableBoundariesX[1]-hr.increaseBoundariesX[0] && w.walterY<sTableBoundaryY) //if Walter is at the right boundary of the side tables
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<sTableBoundaryY && w.walterX>sTableBoundariesX[0] && w.walterX<sTableBoundariesX[1]) //if Walter is at the top boundary of the side tables
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
  }

  void bookcaseBoundaries() { //sets movement boundaries for Walter around the bookcase
    if ((w.walterX>bookcaseBoundariesX[0] && w.walterX<bookcaseBoundariesX[0]+hr.increaseBoundariesX[0] && w.walterY<sTableBoundaryY) || (w.walterX>bookcaseBoundariesX[2] && w.walterX<bookcaseBoundariesX[2]+hr.increaseBoundariesX[0] && w.walterY<sTableBoundaryY)) //if Walter is at the left boundary of either of the bookcases
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if ((w.walterX<bookcaseBoundariesX[1] && w.walterX>bookcaseBoundariesX[1]-hr.increaseBoundariesX[0] && w.walterY<bookcaseBoundaryY) || (w.walterX<bookcaseBoundariesX[3] && w.walterX>bookcaseBoundariesX[3]-hr.increaseBoundariesX[0] && w.walterY<bookcaseBoundaryY)) //if Walter is at the right boundary of either of the bookcases
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if ((w.walterY<bookcaseBoundaryY && w.walterX>bookcaseBoundariesX[0] && w.walterX<bookcaseBoundariesX[1]) || (w.walterY<bookcaseBoundaryY && w.walterX>bookcaseBoundariesX[2] && w.walterX<bookcaseBoundariesX[3])) //if Walter is at the top boundary of either of the bookcases
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
  }

  void dresserBoundaries() { //sets movement boundaries for Walter around the dressers
    if (w.walterX>dresserBoundariesX[1] && w.walterX<dresserBoundariesX[1]+hr.increaseBoundariesX[0] && w.walterY<dresserBoundariesY[1] && w.walterY>dresserBoundariesY[0]) //if Walter is at the left boundary of the right dresser
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<dresserBoundariesX[0] && w.walterX>dresserBoundariesX[0]-hr.increaseBoundariesX[0] && w.walterY<dresserBoundariesY[1] && w.walterY>dresserBoundariesY[0]) //if Walter is at the right boundary of the left dresser
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if ((w.walterY<dresserBoundariesY[1] && w.walterY>dresserBoundariesY[1]-hr.increaseBoundariesY[0] && w.walterX<dresserBoundariesX[0]) || (w.walterY<dresserBoundariesY[1] && w.walterY>dresserBoundariesY[1]-hr.increaseBoundariesY[0] && w.walterX>dresserBoundariesX[1])) //if Walter is at the top boundary of either of the dressers
      w.walterY+=w.wSpeedY; //Walter cannot move up
    else if ((w.walterY>dresserBoundariesY[0] && w.walterY<dresserBoundariesY[0]+hr.increaseBoundariesY[0] && w.walterX<dresserBoundariesX[0]) || (w.walterY>dresserBoundariesY[0] && w.walterY<dresserBoundariesY[0]+hr.increaseBoundariesY[0] && w.walterX>dresserBoundariesX[1])) //if Walter is at the bottom boundary of either of the dressers
      w.walterY-=w.wSpeedY; //Walter cannot move down
  }

  void leave() { //allows Walter to leave the master bedroom
    if (w.walterX>lr.boundariesX[1]) { //if Walter is outside of the right boundary of the master bedroom
      changeHall=true; //the screen is to be changed to the hall
      noMove=true; //Walter cannot move
      increaseTransparency=true; //a transition begins
      blackTransition=true; //the black transition begins
    }
  }

  void come() { //allows Walter to go to the master bedroom
    w.walterX=width*1280/1920; //Walter is just to the right of the door
    w.walterY=height*535/1080; //Walter is in the middle of the door
  }
}
