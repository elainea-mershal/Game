class LivingRoom {
  PImage livingRoom; //image of the living room
  PImage bookcase; //image of the bookcase
  PImage tv; //image of the TV
  PImage coffeeTable; //image of the coffee table
  PImage kidTable; //image of the kid table
  PImage kidChairs; //image of the kid chairs
  PImage seat; //image of the seat

  int boundaryL; //left living room boundary
  int boundaryR; //right living room boundary
  int boundaryU; //up living room boundary
  int boundaryD; //down living room boundary
  
  int hallBoundaryL; //left hall boundary
  int hallBoundaryR; //right hall boundary
  int hallBoundaryU; //up hall boundary
  int hallBoundaryD; //down hall Boundary

  int fireBoundaryL; //left fireplace boundary
  int fireBoundaryR; //right fireplace boundary
  int fireBoundaryU; //up fireplace boundary

  int couchBoundaryL; //left couch boundary
  int couchBoundaryR; //right couch boundary
  int couchBoundaryU; //up couch boundary

  int lampBoundaryR; //right lamp boundary

  int ctableBoundaryL; //left coffee table boundary
  int ctableBoundaryR; //right coffee table boundary
  int ctableBoundaryU; //up coffee table boundary
  int ctableBoundaryD; //down coffee table boundary

  int tvBoundaryL; //left TV boundary
  int tvBoundaryR; //right TV boundary
  int tvBoundaryU; //up TV boundary
  int tvBoundaryD; //down TV boundary

  int ktableBoundaryL; //left kid table boundary
  int ktableBoundaryR; //right kid table boundary
  int ktableBoundaryU; //up kid table boundary
  int ktableBoundaryD; //down kid table boundary

  int kchairBoundaryL; //left kid chair boundary
  int kchairBoundaryR; //right kid chair boundary
  int kchairBoundaryU; //up kid chair boundary
  int kchairBoundaryD; //down kid chair boundary

  int bookcaseBoundaryL; //left bookcase boundary
  int bookcaseBoundaryR; //right bookcase boundary
  int bookcaseBoundaryD; //down bookcase boundary

  int chairLBoundaryL; //left left chair boundary
  int chairLBoundaryR; //right left chair boundary
  int chairRBoundaryL; //left right chair boundary
  int chairRBoundaryR; //right right chair boundary
  int chairBoundaryU; //up chair boundary
  int chairBoundaryD; //down chair boundary

  int seatBoundaryL; //left seat boundary
  int seatBoundaryR; //right seat boundary
  int seatBoundaryU; //up seat boundary
  int seatBoundaryD; //down seat boundary

  int outDoorL; //left outside door boundary
  int outDoorR; //right outside door boundary

  int boundaryIncreaseX; //interval to increase x boundaries
  int boundaryIncreaseY; //interval to increase y boundaries

  boolean goIn; //boolean to determine if Walter is going inside

  LivingRoom() {
    livingRoom=loadImage("livingRoom.png");
    bookcase=loadImage("bookcase.png");
    tv=loadImage("tv.png");
    coffeeTable=loadImage("coffeeTable.png");
    kidTable=loadImage("kidTable.png");
    kidChairs=loadImage("kidChairs.png");
    seat=loadImage("seat.png");

    boundaryL=width*455/1920;
    boundaryR=width*1410/1920;
    boundaryU=height*200/1080;
    boundaryD=height*820/1080;
    
    hallBoundaryL=width*1620/1920;
    hallBoundaryR=width*1670/1920;
    hallBoundaryU=height*494/1080;
    hallBoundaryD=height*595/1080;

    fireBoundaryL=width*1165/1920;
    fireBoundaryR=width*1325/1920;
    fireBoundaryU=height*260/1080;

    couchBoundaryL=width*490/1920;
    couchBoundaryR=width*685/1920;
    couchBoundaryU=height*245/1080;

    lampBoundaryR=width*730/1920;

    ctableBoundaryL=width*511/1920;
    ctableBoundaryR=width*650/1920;
    ctableBoundaryU=height*340/1080;
    ctableBoundaryD=height*295/1080;

    tvBoundaryL=width*513/1920;
    tvBoundaryR=width*645/1920;
    tvBoundaryU=height*510/1080;
    tvBoundaryD=height*460/1080;

    ktableBoundaryL=width*693/1920;
    ktableBoundaryR=width*827/1920;
    ktableBoundaryU=height*715/1080;
    ktableBoundaryD=height*616/1080;

    kchairBoundaryL=width*640/1920;
    kchairBoundaryR=width*880/1920;
    kchairBoundaryU=height*690/1080;
    kchairBoundaryD=height*645/1080;

    bookcaseBoundaryL=width*1070/1920;
    bookcaseBoundaryR=width*1410/1920;
    bookcaseBoundaryD=height*800/1080;

    chairLBoundaryL=width*1090/1920;
    chairLBoundaryR=width*1152/1920;
    chairRBoundaryL=width*1332/1920;
    chairRBoundaryR=width*1396/1920;
    chairBoundaryU=height*266/1080;
    chairBoundaryD=height*321/1080;

    seatBoundaryL=width*1169/1920;
    seatBoundaryR=width*1325/1920;
    seatBoundaryU=height*362/1080;
    seatBoundaryD=height*415/1080;

    outDoorL=width*895/1920;
    outDoorR=width*960/1920;

    boundaryIncreaseX=width*5/1920;
    boundaryIncreaseY=height*5/1080;
  }

  void display() { //displays the living room
    image(livingRoom, 0, 0, width, height); //draws the living room background
  }

  void displayFurniture() { //displays the furniture on top of Walter
    image(bookcase, 0, 0, width, height); //display the bookcase

    if (w.walterY<=ctableBoundaryD+boundaryIncreaseY) //if Walter is above the coffee table
      image(coffeeTable, 0, 0, width, height); //display the coffee table

    if (w.walterY<=tvBoundaryD+boundaryIncreaseY) //if Walter is above the TV
      image(tv, 0, 0, width, height); //display the TV

    if (w.walterY<=ktableBoundaryD+boundaryIncreaseY)
      image(kidTable, 0, 0, width, height);

    if (w.walterY<=kchairBoundaryD+boundaryIncreaseY) //if Walter is above the kid chairs
      image(kidChairs, 0, 0, width, height); //display the kid chairs
  }

  void boundaries() { //sets movement boundaries for Walter in the living room
    if (w.walterX<boundaryL || (w.walterX<hallBoundaryL && w.walterX>boundaryR+boundaryIncreaseX && w.walterY<hallBoundaryU)) //if Walter is outside of the left living room boundary
      w.walterX+=w.wSpeed; //Walter cannot move to the left
    if ((w.walterX>boundaryR && w.walterX<hallBoundaryL && (w.walterY<hallBoundaryU || w.walterY>hallBoundaryD))|| w.walterX>hallBoundaryR) //if Walter is outside of the right living room boundary
      w.walterX-=w.wSpeed; //Walter cannot move to the right
    if (w.walterY<boundaryU || (w.walterY<hallBoundaryU && w.walterX<hallBoundaryL && w.walterX>boundaryR)) //if Walter is outside of the top living room boundary
      w.walterY+=w.wSpeed; //Walter cannot move upwards
    if ((w.walterY>boundaryD && (w.walterX<outDoorL || w.walterX>outDoorR)) || (w.walterY>hallBoundaryD-boundaryIncreaseY && w.walterX>boundaryR)) //if Walter is outside of the bottom living room boundary
        w.walterY-=w.wSpeed; //Walter cannot move downwards
    }
  }

  void fireBoundaries() { //sets movement boundaries for Walter around the fireplace
    if (w.walterX>fireBoundaryL && w.walterX<fireBoundaryL+boundaryIncreaseX && w.walterY<fireBoundaryU) //if Walter is at the left boundary of the fireplace
      w.walterX-=w.wSpeed; //Walter cannot move to the right
    if (w.walterX<fireBoundaryR && w.walterX>fireBoundaryR-boundaryIncreaseX && w.walterY<fireBoundaryU) //if Walter is at the right boundary of the fireplace
      w.walterX+=w.wSpeed; //Walter cannot move to the left
    if (w.walterY<fireBoundaryU && w.walterX>fireBoundaryL && w.walterX<fireBoundaryR) //if Walter is at the top boundary of the fireplace
      w.walterY+=w.wSpeed; //Walter cannot move upwards
  }

  void couchBoundaries() { //sets movement boundaries for Walter around the couch
    if (w.walterX>couchBoundaryL && w.walterX<couchBoundaryL+boundaryIncreaseX && w.walterY<couchBoundaryU) //if Walter is at the left boundary of the couch
      w.walterX-=w.wSpeed; //Walter cannot move to the right
    if (w.walterX<lampBoundaryR && w.walterX>lampBoundaryR-boundaryIncreaseX && w.walterY<couchBoundaryU) //if Walter is at the right boundary of the couch
      w.walterX+=w.wSpeed; //Walter cannot move to the left
    if (w.walterY<couchBoundaryU && w.walterX>couchBoundaryL && w.walterX<lampBoundaryR) //if Walter is at the top boundary of the chouch
      w.walterY+=w.wSpeed; //Walter cannot move upwards
  }

  void cTableBoundaries() { //sets movement boundaries for Walter around the coffee table
    if (w.walterX>ctableBoundaryL && w.walterX<ctableBoundaryL+boundaryIncreaseX && w.walterY<ctableBoundaryU && w.walterY>ctableBoundaryD) //if Walter is at the left boundary of the coffee table
      w.walterX-=w.wSpeed; //Walter cannot move to the right
    if (w.walterX<ctableBoundaryR && w.walterX>ctableBoundaryR-boundaryIncreaseX && w.walterY<ctableBoundaryU && w.walterY>ctableBoundaryD) //if Walter is at the right boundary of the coffee table
      w.walterX+=w.wSpeed; //Walter cannot move to the left
    if (w.walterY<ctableBoundaryU && w.walterY>ctableBoundaryU-boundaryIncreaseY && w.walterX>ctableBoundaryL && w.walterX<ctableBoundaryR) //if Walter is at the top boundary of the coffee table
      w.walterY+=w.wSpeed; //Walter cannot move up
    if (w.walterY>ctableBoundaryD && w.walterY<ctableBoundaryD+boundaryIncreaseY && w.walterX>ctableBoundaryL && w.walterX<ctableBoundaryR) //if Walter is at the bottom boundary of the coffee table
      w.walterY-=w.wSpeed; //Walter cannot move down
  }

  void tvBoundaries() { //sets movement boundaries for Walter around the TV
    if (w.walterX>tvBoundaryL && w.walterX<tvBoundaryL+boundaryIncreaseX && w.walterY<tvBoundaryU && w.walterY>tvBoundaryD) //if Walter is at the left boundary of the TV
      w.walterX-=w.wSpeed; //Walter cannot move to the right
    if (w.walterX<tvBoundaryR && w.walterX>tvBoundaryR-boundaryIncreaseX && w.walterY<tvBoundaryU && w.walterY>tvBoundaryD) //if Walter is at the right boundary of the TV
      w.walterX+=w.wSpeed; //Walter cannot move to the left
    if (w.walterY<tvBoundaryU && w.walterY>tvBoundaryU-boundaryIncreaseY && w.walterX>tvBoundaryL && w.walterX<tvBoundaryR) //if Walter is at the top boundary of the TV
      w.walterY+=w.wSpeed; //Walter cannot move upwards
    if (w.walterY>tvBoundaryD && w.walterY<tvBoundaryD+boundaryIncreaseY && w.walterX>tvBoundaryL && w.walterX<tvBoundaryR) //if Walter is at the bottom boundary of the TV
      w.walterY-=w.wSpeed; //Walter cannot move downwards
  }

  void ktableBoundaries() { //sets movement boundaries for Walter around the kid table
    if (w.walterX>ktableBoundaryL && w.walterX<ktableBoundaryL+boundaryIncreaseX && w.walterY<ktableBoundaryU && w.walterY>ktableBoundaryD) //if Walter is at the left boundary of the kid table
      w.walterX-=w.wSpeed; //Walter cannot move to the right
    if (w.walterX<ktableBoundaryR && w.walterX>ktableBoundaryR-boundaryIncreaseX && w.walterY<ktableBoundaryU && w.walterY>ktableBoundaryD) //if Walter is at the right boundary of the kid table
      w.walterX+=w.wSpeed; //Walter cannot move to the left
    if (w.walterY<ktableBoundaryU && w.walterY>ktableBoundaryU-boundaryIncreaseY && w.walterX>ktableBoundaryL && w.walterX<ktableBoundaryR) //if Walter is at the top boundary of the kid table
      w.walterY+=w.wSpeed; //Walter cannot move upwards
    if (w.walterY>ktableBoundaryD && w.walterY<ktableBoundaryD+boundaryIncreaseY && w.walterX>ktableBoundaryL && w.walterX<ktableBoundaryR) //if Walter is at the bottom boundary of the kid table
      w.walterY-=w.wSpeed; //Walter cannot move downwards
  }

  void kchairBoundaries() { //sets movement boundaries for Walter around the kid chairs
    if (w.walterX>kchairBoundaryL && w.walterX<kchairBoundaryL+boundaryIncreaseX && w.walterY<kchairBoundaryU && w.walterY>kchairBoundaryD) //if Walter is at the left boundary of the kid chairs
      w.walterX-=w.wSpeed; //Walter cannot move to the right
    if (w.walterX<kchairBoundaryR && w.walterX>kchairBoundaryR-boundaryIncreaseX && w.walterY<kchairBoundaryU && w.walterY>kchairBoundaryD) //if Walter is at the right boundary of the kid chairs
      w.walterX+=w.wSpeed; //Walter cannot move to the left
    if (w.walterY<kchairBoundaryU && w.walterY>kchairBoundaryU-boundaryIncreaseY && w.walterX>kchairBoundaryL && w.walterX<kchairBoundaryR) //if Walter is at the top boundary of the kid chairs
      w.walterY+=w.wSpeed; //Walter cannot move upwards
    if (w.walterY>kchairBoundaryD && w.walterY<kchairBoundaryD+boundaryIncreaseY && w.walterX>kchairBoundaryL && w.walterX<kchairBoundaryR) //if Walter is at the bottom boundary of the kid chairs
      w.walterY-=w.wSpeed; //Walter cannot move downwards
  }

  void bookcaseBoundaries() { //sets movement boundaries for Walter around the bookcase
    if (w.walterX>bookcaseBoundaryL && w.walterX<bookcaseBoundaryL+boundaryIncreaseX && w.walterY>bookcaseBoundaryD) //if Walter is at the left boundary of the bookcase
      w.walterX-=w.wSpeed; //Walter cannot move to the right
    if (w.walterX<bookcaseBoundaryR && w.walterX>bookcaseBoundaryR-boundaryIncreaseX && w.walterY>bookcaseBoundaryD) //if Walter is at the right boundary of the bookcase
      w.walterX+=w.wSpeed; //Walter cannot move to the left
    if (w.walterY>bookcaseBoundaryD && w.walterY<bookcaseBoundaryD+boundaryIncreaseY && w.walterX>bookcaseBoundaryL && w.walterX<bookcaseBoundaryR) //if Walter is at the bottom boundary of the bookcase
      w.walterY-=w.wSpeed; //Walter cannot move down
  }

  void chairLBoundaries () { //sets movement boundaries for Walter around the left chair
    if (w.walterX>chairLBoundaryL && w.walterX<chairLBoundaryL+boundaryIncreaseX && w.walterY>chairBoundaryU && w.walterY<chairBoundaryD) //if Walter is at the left boundary of the left chair
      w.walterX-=w.wSpeed; //Walter cannot move to the right
    if (w.walterX<chairLBoundaryR && w.walterX>chairLBoundaryR-boundaryIncreaseX && w.walterY>chairBoundaryU && w.walterY<chairBoundaryD) //if Walter is at the right boundary of the left chair
      w.walterX+=w.wSpeed; //Walter cannot move to the left
    if (w.walterY<chairBoundaryU && w.walterY>chairBoundaryU-boundaryIncreaseY && w.walterX>chairLBoundaryL && w.walterX<chairLBoundaryR) //if Walter is at the top boundary of the left chair
      w.walterY-=w.wSpeed; //Walter cannot move upwards
    if (w.walterY>chairBoundaryD && w.walterY<chairBoundaryD+boundaryIncreaseY && w.walterX>chairLBoundaryL && w.walterX<chairLBoundaryR) //if Walter is at the right boundary of the left chair
      w.walterY+=w.wSpeed; //Walter cannot move downwards
  }

  void chairRBoundaries() { //sets movement boundaries for Walter around the right chair
    if (w.walterX>chairRBoundaryL && w.walterX<chairRBoundaryL+boundaryIncreaseX && w.walterY>chairBoundaryU && w.walterY<chairBoundaryD) //if Walter is at the left boundary of the right chair
      w.walterX-=w.wSpeed; //Walter cannot move to the right
    if (w.walterX<chairRBoundaryR && w.walterX>chairRBoundaryR-boundaryIncreaseX && w.walterY>chairBoundaryU && w.walterY<chairBoundaryD) //if Walter is at the right boundary of the right chair
      w.walterX += w.wSpeed; //Walter cannot move to the left
    if (w.walterY<chairBoundaryU && w.walterY>chairBoundaryU-boundaryIncreaseY && w.walterX>chairRBoundaryL && w.walterX<chairRBoundaryR) //if Walter is at the top boundary of the right chair
      w.walterY-=w.wSpeed; //Walter cannot move upwards
    if (w.walterY>chairBoundaryD && w.walterY<chairBoundaryD+boundaryIncreaseY && w.walterX>chairRBoundaryL && w.walterX<chairRBoundaryR) //if Walter is at the bottom boundary of the right chair
      w.walterY+=w.wSpeed; //Walter cannot move downwards
  }

  void seatBoundaries() { //sets movement boundaries for Walter around the seat
    if (w.walterX>seatBoundaryL && w.walterX<seatBoundaryL+boundaryIncreaseX && w.walterY>seatBoundaryU && w.walterY<seatBoundaryD) //if Walter is at the left boundary of the seat
      w.walterX-=w.wSpeed; //Walter cannot move to the right
    if (w.walterX<seatBoundaryR && w.walterX>seatBoundaryR-boundaryIncreaseX && w.walterY>seatBoundaryU && w.walterY<seatBoundaryD) //if Walter is at the right boundary of the seat
      w.walterX+=w.wSpeed; //Walter cannot move to the left
    if (w.walterY<seatBoundaryU && w.walterY>seatBoundaryU-boundaryIncreaseY && w.walterX>seatBoundaryL && w.walterX<seatBoundaryR) //if Walter is at the top boundary of the seat
      w.walterY-=w.wSpeed; //Walter cannot move upwards
    if (w.walterY>seatBoundaryD && w.walterY<seatBoundaryD+boundaryIncreaseY && w.walterX>seatBoundaryL && w.walterX<seatBoundaryR) //if Walter is at the bottom boundary of the seat
      w.walterY+=w.wSpeed; //Walter cannot move downwards
  }

  void leave() { //allows Walter to leave the living room
    if (w.walterY>boundaryD) { //if Walter is below the bottom boundary of the living room
      noMove=true; //Walter cannot move
      increaseTransparency=true; //a transition begins
      blackTransition=true; //the black transition begins
    }
  }

  void come() { //allows Walter to return to the living room
    if (goIn) { //if Walter is going inside
      w.walterY = height/3*2; //Walter is just above the outside door
      o.goOut = false; //Walter is not going outside
      goIn = false; //Walter is no longer going inside
    }
  }
}
