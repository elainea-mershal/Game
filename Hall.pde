class Hall {
  PImage hall; //image of the living room

  float[] boundariesX=new float[] {790, 1075}; //left and right hall boundaries
  float[] boundariesY=new float[] {200, 868}; //up and down hall boundaries
  float[] stairsX=new float[] {917, 940}; //left and right stair boundaries
  float[] doorY=new float[] {290, 405, 543, 642}; //upper and lower boundaries for the upper and lower doors

  Hall() {
    hall=loadImage("hall.png");
    for (int index=0; index<boundariesX.length; index++) { //index variable has an initial value of 0, must be less than the length of boundariesX array, and increases by increments of 1
      boundariesX[index]=map(boundariesX[index], 0, 1920, 0, width);
      boundariesY[index]=map(boundariesY[index], 0, 1080, 0, height);
      stairsX[index]=map(stairsX[index], 0, 1920, 0, width);
    }
    for (int index=0; index<doorY.length; index++) //index variable has an initial value of 0, must be less than the length of doorY array, and increases by increments of 1
      doorY[index]=map(doorY[index], 0, 1080, 0, height);
  }

  void display() { //displays the hall
    image(hall, 0, 0, width, height); //draws the hall background
  }

  void boundaries() { //sets movement boundaries for Walter in the hall
    if (w.walterX<boundariesX[0] && (w.walterY<doorY[0] || w.walterY>doorY[1]) && (w.walterY<doorY[2] || w.walterY>doorY[3])) //if Walter is outside of the left hall boundary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    if (w.walterX>boundariesX[1] && (w.walterY<doorY[0] || w.walterY>doorY[1]) && (w.walterY<doorY[2] || w.walterY>doorY[3])) //if Walter is outside of the right hall boundary
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    if (w.walterY<boundariesY[0]) //if Walter is outside of the upper hall boundary
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
    if (w.walterY>boundariesY[1] && (w.walterX<stairsX[0] || w.walterX>stairsX[1])) //if Walter is outside of the bottom hall boundary
      w.walterY-=w.wSpeedY; //Walter cannot move downwards
  }

  void come() { //changes Walter's position when he comes to the hall
    w.walterX=width/2-w.walterW/2; //Walter is in the middle of the hallway
    w.walterY=height/3*2; //Walter is just above the stairs
  }

  void leave() { //allows Walter to leave the hall
    if (w.walterY>boundariesY[1] || w.walterX<boundariesX[0] || w.walterX>boundariesX[1]) { //if Walter is leaving the hall
      noMove=true; //Walter cannot move
      increaseTransparency=true; //a transition begins
      blackTransition=true; //the black transition begins
    }

    if (w.walterY>=doorY[2] && w.walterX<boundariesX[0]) //if Walter is in the bottom half of the screen and is outside of the left hall boundary
      changeBR=true; //the screen is to be changed to the blank room

    if (w.walterY>=doorY[2] && w.walterX>boundariesX[1]) //if Walter is in the bottom half of the screen and is outside of the right hall boundary
      changeGB=true; //the screen is to be changed to Gregory's bedroom

    if (w.walterY<=doorY[1] && w.walterX<boundariesX[0]) // if Walter is in the top half of the screen and is outside of the left hall boundary
      changeMB=true; //the screen is to be changed to the master bedroom

    if (w.walterY<=doorY[1] && w.walterX>boundariesX[1]) //if Walter is in the top half of the screen and is outside fo the right hall boundary
      changeBath=true; //the screen is to be changed to the bathroom

    if (w.walterY>boundariesY[1]) //if Walter is outside of the bottom hall boundary
      changeLR=true; //the screen is to be changed to the living room
  }
}
