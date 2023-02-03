class Backyard {
  PImage backyard; //image of the backyard

  float[] doorX=new float[] {882, 975}; //left and right door boundaries
  float fenceBoundaryU=195; //upper fence boundary

  Backyard() {
    backyard=loadImage("backyard.png");

    for (int index=0; index<doorX.length; index++) //index variable has an initial value of 0, must be less than the length of doorX array, and increases by increments of 1
      doorX[index]=map(doorX[index], 0, 1920, 0, width);

    fenceBoundaryU=map(fenceBoundaryU, 0, 1080, 0, height);
  }

  void display() { //displays the backyard
    image(backyard, 0, 0, width, height); //draws the backyard background
  }

  void boundaries() { //sets movement boundaries for Walter in the backyard
    if (w.walterX<=0) //if Walter is at the left boundary of the screen
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    if (w.walterX+w.walterW>=width) //if Walter is at the right boundary of the screen
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    if (w.walterY<=fenceBoundaryU) //if Walter is at the top boundary of the screen
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
    if (w.walterY+w.walterH>=height) { //if Walter is at the bottom boundary of the screen
      if (w.walterX<doorX[0] || w.walterX>doorX[1]) //if Walter is outside of the door boundaries
        w.walterY-=w.wSpeedY; //Walter cannot move downwards
    }
  }
  void leave() { //allows Walter to leave the backyard
    if (w.walterY>height-w.walterH) { //if Walter is below the bottom boundary of the screen
      changeKitchen=true; //the screen is to be changed to the kitchen
      noMove=true; //Walter cannot move
      increaseTransparency=true; //a transition begins
      blackTransition=true; //the black transition begins
    }
  }
  void come() { //changes Walter's position when he enters the backyard
    w.walterX=width/2-w.walterW; //Walter is in the middle of the screen
    w.walterY=height*830/1080; //Walter is just below the inside door
  }
}
