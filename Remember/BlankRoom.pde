class BlankRoom {
  PImage blankRoom; //image of the blank room

  float[]doorY=new float[] {320, 480}; //upper and lower door boundaries

  BlankRoom() {
    blankRoom=loadImage("blankRoom.png");
  }

  void display() { //displays the blank room
    image(blankRoom, 0, 0, width, height); //draws the outside background

    for (int index=0; index<doorY.length; index++) //index variable has an initial value of 0, must be less than the length of doorY array, and increases by increments of 1
      doorY[index]=map(doorY[index], 0, 1080, 0, height);
  }

  void boundaries() { //sets movement boundaries for Walter in the blank room
    if (w.walterX<=0) //if Walter is at the left boundary of the screen
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    if (w.walterX+w.walterW>=width && (w.walterY<doorY[0] || w.walterY>doorY[1])) //if Walter is at the right boundary of the screen
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    if (w.walterY<=0) //if Walter is at the top boundary of the screen
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
    if (w.walterY+w.walterH>=height) //if Walter is at the bottom boundary of the screen
      w.walterY-=w.wSpeedY; //Walter cannot move downwards
  }

  void leave() { //allows Walter to leave the blank room
    if (w.walterX>width-w.walterW) { //if Walter is outside of the right of the screen
      changeHall=true; //the screen is to be changed to the hall
      noMove=true; //Walter cannot move
      increaseTransparency=true; //a transition begins
      blackTransition=true; //the black transition begins
    }
  }

  void come() { //allows Walter to go to the blank room
    w.walterX=width*1670/1920; //Walter is just to the right of the door
    w.walterY=height/2-w.walterH/2; //Walter is in the middle of the screen
  }
}
