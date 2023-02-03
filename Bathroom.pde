class Bathroom {
  PImage bathroom; //image of the bathroom
  float[] boundariesX=new float[] {495, 1359}; //left and right bathroom boundaries
  float[] boundariesY=new float[] {305, 675}; //up and down bathroom boundaries
  float[] sinkBoundariesX=new float[] {714, 836}; //left and right sink boundaries
  float[] doorY=new float[] {409, 532}; //up and down door boundaries
  float sinkBoundaryY=340; //upper sink boundary

  Bathroom() {
    bathroom=loadImage("bathroom.png");

    for (int index=0; index<boundariesX.length; index++) { //index variable has an initial value of 0, must be less than the length of boundariesX array, and increases by increments of 1
      boundariesX[index]=map(boundariesX[index], 0, 1920, 0, width);
      boundariesY[index]=map(boundariesY[index], 0, 1080, 0, height);
      sinkBoundariesX[index]=map(sinkBoundariesX[index], 0, 1920, 0, width);
      doorY[index]=map(doorY[index], 0, 1080, 0, height);
    }
    sinkBoundaryY=map(sinkBoundaryY, 0, 1080, 0, height);
  }

  void display() { //displays the bathroom
    image(bathroom, 0, 0, width, height); //draws the bathroom background image
  }

  void boundaries() { //sets movement boundaries for Walter in the bathroom
    if (w.walterX<boundariesX[0] && (w.walterY<doorY[0] || w.walterY>doorY[1])) //if Walter is outside of the left bathroom boundary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    if (w.walterX>boundariesX[1]) //if Walter is outside of the right bathroom boundary
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    if (w.walterY<boundariesY[0]) //if walter is outside of the top bathroom boundary
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
    if (w.walterY>boundariesY[1]) //if Walter is outside of the bottom bathroom boundary
      w.walterY-=w.wSpeedY; //Walter cannot move downwards
  }

  void sinkBoundaries() { //sets movement boundaries around the sink
    if (w.walterX>sinkBoundariesX[0] && w.walterX<sinkBoundariesX[0]+hr.increaseBoundariesX[0] && w.walterY<sinkBoundaryY) //if Walter is at the left boundary of the sink
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<sinkBoundariesX[1] && w.walterX>sinkBoundariesX[1]-hr.increaseBoundariesX[0] && w.walterY<sinkBoundaryY) //if Walter is at the right boundary of the sink
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<sinkBoundaryY && w.walterX>sinkBoundariesX[0] && w.walterX<sinkBoundariesX[1]) //if Walter is at the top boundary of the sink
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
  }

  void leave() { //allows Walter to leave the bathroom
    if (w.walterX<boundariesX[0]) { //if Walter is outside of the left bathroom boundary
      changeHall=true; //the screen is to be changed to the hall
      noMove=true; //Walter cannot move
      increaseTransparency=true; //a transition begins
      blackTransition=true; //the black transition begins
    }
  }

  void come() { //allows Walter to go to the bathroom
    w.walterX=width*565/1920; //sets Walter's x position
    w.walterY=height*550/1080; //sets Walter's y position
  }
}
