class Outside {
  PImage outside; //image of the outside

  int inDoorL; //left inside door boundary
  int inDoorR; //right inside door boundary

  boolean goOut; //boolean to determine if Walter is going outside

  Outside() {
    outside=loadImage("goOut.png");

    inDoorL=width*886/1920;
    inDoorR=width*970/1920;
  }

  void display() { //displays the outside
    image(outside, 0, 0, width, height); //displays the outside
  }

  void boundaries() { //sets movement boundaries for Walter outside
    if (w.walterX<=0) //if Walter is at the left boundary of the screen
      w.walterX+=w.wSpeed; //Walter cannot move to the left
    if (w.walterX+w.walterW>=width) //if Walter is at the right boundary of the screen
      w.walterX-=w.wSpeed; //Walter cannot move to the right
    if (w.walterY<=0) { //if Walter is at the top boundary of the screen
      if (w.walterX<inDoorL || w.walterX>inDoorR) //if Walter is outside of the inside door boundaries
        w.walterY+=w.wSpeed; //Walter cannot move upwards
    }
    if (w.walterY+w.walterH>=height) //if Walter is at the bottom boundary of the screen
      w.walterY-=w.wSpeed; //Walter cannot move downwards
  }

  void leave() { //allows Walter to leave the outside
    if (w.walterY<0) { //if Walter is above the top boundary of the screen
      noMove=true; //Walter cannot move
      increaseTransparency=true; //a transition begins
      blackTransition=true; //the black transition begins
    }
  }

  void come() { //allows Walter to go outside
    if (goOut==false) { //if Walter is not outside
      w.walterX=width/2-w.walterW/2; //Walter is in the middle of the screen
      w.walterY=height*250/1080; //Walter is just below the inside door
      goOut=true; //Walter is outside
    }
  }
}
