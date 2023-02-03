class Outside {
  PImage outside; //image of the outside

  float[] doorX=new float[] {886, 970}; // left and right door boundaries

  Outside() {
    outside=loadImage("outside.png");

    for (int index=0; index<doorX.length; index++) //index variable has an initial value of 0, must be less than the length of doorX array, and increases by increments of 1
      doorX[index]=map(doorX[index], 0, 1920, 0, width);
  }

  void display() { //displays the outside
    image(outside, 0, 0, width, height); //draws the outside background
  }

  void boundaries() { //sets movement boundaries for Walter outside
    if (w.walterX<=0) //if Walter is at the left boundary of the screen
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    if (w.walterX+w.walterW>=width) //if Walter is at the right boundary of the screen
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    if (w.walterY<=0) { //if Walter is at the top boundary of the screen
      if (w.walterX<doorX[0] || w.walterX>doorX[1]) //if Walter is outside of the inside door boundaries
        w.walterY+=w.wSpeedY; //Walter cannot move upwards
    }
    if (w.walterY+w.walterH>=height) //if Walter is at the bottom boundary of the screen
      w.walterY-=w.wSpeedY; //Walter cannot move downwards
  }

  void leave() { //allows Walter to leave the outside
    if (w.walterY<0) { //if Walter is above the top boundary of the screen
      changeLR=true; //the screen is to be changed to the living room
      noMove=true; //Walter cannot move
      increaseTransparency=true; //a transition begins
      blackTransition=true; //the black transition begins
    }
  }

  void come() { //changes Walter's position when he goes outside
    w.walterY=height*250/1080; //Walter is just below the inside door
  }
}
