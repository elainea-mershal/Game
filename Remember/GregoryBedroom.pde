class GregoryBedroom {
  PImage gregoryBedroom; //image of Gregry's bedroom
  PImage couch; //image of Gregory's couch

  float[] boundariesX=new float[] {615, 1236}; //left and right boundaries for Gregory's bedroom
  float[] boundariesY=new float[] {245, 695}; //up and down boundaries for Gregory's bedroom
  float[] bedBoundariesX=new float[] {860, 1005}; //left and right bed boundaries
  float[] bearBoundariesX=new float[] {966, 1120}; //left and right bear boundaries
  float[] couchBoundariesY=new float[] {530, 632}; //up and down couch boundaries
  float[] doorY=new float[] {423, 579}; //up and down door boundaries

  float bedBoundaryY=358; //upper bed boundary
  float bearBoundaryY=296; //upper bear boundary
  float couchBoundaryX=1160; //right couch boundary
  float bookcaseBoundaryX=725; //left bookcase boundary
  float bookcaseBoundaryY=273; //upper bookcase boundary

  GregoryBedroom() {
    gregoryBedroom=loadImage("gregoryBedroom.png");
    couch=loadImage("couch.png");

    for (int index=0; index<boundariesX.length; index++) { //index variable has an initial value of 0, must be less than the length of boundariesX array, and increases by increments of 1
      boundariesX[index]=map(boundariesX[index], 0, 1920, 0, width);
      boundariesY[index]=map(boundariesY[index], 0, 1080, 0, height);
      bedBoundariesX[index]=map(bedBoundariesX[index], 0, 1920, 0, width);
      bearBoundariesX[index]=map(bearBoundariesX[index], 0, 1920, 0, width);
      couchBoundariesY[index]=map(boundariesY[index], 0, 1080, 0, height);
      doorY[index]=map(doorY[index], 0, 1080, 0, height);
    }

    bedBoundaryY=map(bedBoundaryY, 0, 1080, 0, height);
    bearBoundaryY=map(bearBoundaryY, 0, 1080, 0, height);
    couchBoundaryX=map(couchBoundaryX, 0, 1920, 0, width);
    bookcaseBoundaryX=map(bookcaseBoundaryX, 0, 1920, 0, width);
    bookcaseBoundaryY=map(bookcaseBoundaryY, 0, 1080, 0, height);
  }

  void display() { //displays Gregory's bedroom
    image(gregoryBedroom, 0, 0, width, height); //draws Gregory's bedroom background
  }

  void displayFurniture() {
    if (w.walterY<=couchBoundariesY[0]+hr.increaseBoundariesY[0]) //if Walter is above the couch
      image(couch, 0, 0, width, height); //display the ccouch
  }

  void boundaries() {
    if (w.walterX<boundariesX[0] && (w.walterY<doorY[0] || w.walterY>doorY[1])) //if Walter is outside of the left Gregory bedroom boundary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    if (w.walterX>boundariesX[1]) //if Walter is outside of the right Gregory bedroom boundary
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    if (w.walterY<boundariesY[0]) //if walter is outside of the top Gregory bedroom boundary
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
    if (w.walterY>boundariesY[1]) //if Walter is outside of the Gregory bedroom boundary
      w.walterY-=w.wSpeedY; //Walter cannot move downwards
  }

  void bedBoundaries() {
    if (w.walterX>bedBoundariesX[0] && w.walterX<bedBoundariesX[0]+hr.increaseBoundariesX[0] && w.walterY<bedBoundaryY) //if Walter is at the left boundary of the bed
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<bedBoundariesX[1] && w.walterX>bedBoundariesX[1]-hr.increaseBoundariesX[0] && w.walterY<bedBoundaryY) //if Walter is at the right boundary of the bed
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<bedBoundaryY && w.walterX>bedBoundariesX[0] && w.walterX<bedBoundariesX[1]) //if Walter is at the top boundary of the bed
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
  }

  void bearBoundaries() {
    if (w.walterX>bearBoundariesX[0] && w.walterX<bearBoundariesX[0]+hr.increaseBoundariesX[0] && w.walterY<bearBoundaryY) //if Walter is at the left boundary of the bed
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<bearBoundariesX[1] && w.walterX>bearBoundariesX[1]-hr.increaseBoundariesX[0] && w.walterY<bearBoundaryY) //if Walter is at the right boundary of the bed
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<bearBoundaryY && w.walterX>bearBoundariesX[0] && w.walterX<bearBoundariesX[1]) //if Walter is at the top boundary of the bed
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
  }

  void couchBoundaries() {
    if (w.walterX>couchBoundaryX && w.walterX<couchBoundaryX+hr.increaseBoundariesX[0] && w.walterY<couchBoundariesY[1] && w.walterY>couchBoundariesY[0]) //if Walter is at the left boundary of the couch
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterY<couchBoundariesY[1] && w.walterY>couchBoundariesY[1]-hr.increaseBoundariesY[0] && w.walterX>couchBoundaryX) //if Walter is at the top boundary of the couch
      w.walterY+=w.wSpeedY; //Walter cannot move up
    else if (w.walterY>couchBoundariesY[0] && w.walterY<couchBoundariesY[0]+hr.increaseBoundariesY[0] && w.walterX>couchBoundaryX) //if Walter is at the bottom boundary of the couch
      w.walterY-=w.wSpeedY; //Walter cannot move down
  }

  void bookcaseBoundaries() {
    if (w.walterX<bookcaseBoundaryX && w.walterX>bookcaseBoundaryX-hr.increaseBoundariesX[0] && w.walterY<bookcaseBoundaryY) //if Walter is at the left boundary of the bookcase
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<bookcaseBoundaryY && w.walterX<bookcaseBoundaryX) //if Walter is at the top boundary of the bookcase
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
  }

  void leave() { //allows Walter to leave Gregory's bedroom
    if (w.walterX<boundariesX[0]) { //if Walter is outside of the left Gregory bedroom boundary
      changeHall=true; //the screen is to be changed to the hall
      noMove=true; //Walter cannot move
      increaseTransparency=true; //a transition begins
      blackTransition=true; //the black transition begins
    }
  }

  void come() { //allows Walter to enter Gregory's bedroom
    w.walterX=width*700/1920; //sets Walter's x position
    w.walterY=height*508/1080; //sets Walter's y position
  }
}
