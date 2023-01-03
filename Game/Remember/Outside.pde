class Outside {
  PImage outside;
  boolean newPosition;

  int inDoorL=886;
  int inDoorR=970;

  Outside() {
    outside=loadImage("outside.png");
  }

  void display() {
    image(outside, 0, 0);

    if (newPosition==false) {
      w.walterX=width/2 - w.walterW/2;
      w.walterY=250;
      newPosition=true;
    }
  }

  void boundaries() {
    if (w.walterX<=0)
      w.walterX+=w.wSpeed;
    if (w.walterX+w.walterW>=width)
      w.walterX-=w.wSpeed;
    if (w.walterY<=0) {
      if (w.walterX<inDoorL || w.walterX>inDoorR)
        w.walterY+=w.wSpeed;
    }
    if (w.walterY+w.walterH>=height)
      w.walterY-=w.wSpeed;
  }

  void leave() {
    if (w.walterY<0) {
      noMove=true;
      increaseTransparency=true;
      blackTransition=true;
      //newRoom=false;
    }
   // if (decreaseTransparency && newRoom==false)
     // displayOutside=false;
  }
}
