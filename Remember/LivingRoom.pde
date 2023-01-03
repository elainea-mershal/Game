class LivingRoom {
  PImage livingRoom; //image of the living room
  PImage bookcase;
  PImage tv;
  PImage coffeeTable;

  int boundaryL=455;
  int boundaryR=1410;
  int boundaryU=200;
  int boundaryD=820;

  int fireBoundaryL=1165;
  int fireBoundaryR=1325;
  int fireBoundaryU=260;

  int couchBoundaryL=490;
  int couchBoundaryR=685;
  int couchBoundaryU=245;

  int lampBoundaryR=730;

  int ctableBoundaryL=511;
  int ctableBoundaryR=650;
  int ctableBoundaryU=340;
  int ctableBoundaryD=295;

  int tvBoundaryL=629;
  int tvBoundaryR=655;
  int tvBoundaryU=496;
  int tvBoundaryD=440;

  int outDoorL=895;
  int outDoorR=960;
  
  LivingRoom() {
    livingRoom=loadImage("livingRoom.png");
    bookcase=loadImage("bookcase.png");
    tv=loadImage("tv.png");
    coffeeTable=loadImage("coffeeTable.png");
  }

  void display() { //displays the living room
    image(livingRoom, 0, 0); //draws the living room background
  }

  void displayFurniture() {
    image(bookcase, 0, 0);
    image(tv, 0, 0);

    if (w.walterY<=ctableBoundaryD+5)
      image(coffeeTable, 0, 0);
  }

  void boundaries() {
    if (w.walterX<boundaryL)
      w.walterX+=w.wSpeed;
    if (w.walterX>boundaryR)
      w.walterX-=w.wSpeed;
    if (w.walterY<boundaryU)
      w.walterY+=w.wSpeed;
    if (w.walterY>boundaryD) {
      if (w.walterX<outDoorL || w.walterX>outDoorR)
       w.walterY-=w.wSpeed;
    }
  }

  void fireBoundaries() {
    if (w.walterX>fireBoundaryL && w.walterX<fireBoundaryL+5 && w.walterY<fireBoundaryU)
      w.walterX-=w.wSpeed;
    if (w.walterX<fireBoundaryR && w.walterX>fireBoundaryR-5 && w.walterY<fireBoundaryU)
      w.walterX+=w.wSpeed;
    if (w.walterY<fireBoundaryU && w.walterX>fireBoundaryL && w.walterX<fireBoundaryR)
      w.walterY+=w.wSpeed;
  }

  void couchBoundaries() {
    if (w.walterX>couchBoundaryL && w.walterX<couchBoundaryL+5 && w.walterY<couchBoundaryU)
      w.walterX-=w.wSpeed;
    if (w.walterX<lampBoundaryR && w.walterX>lampBoundaryR-5 && w.walterY<couchBoundaryU)
      w.walterX+=w.wSpeed;
    if (w.walterY<couchBoundaryU && w.walterX>couchBoundaryL && w.walterX<lampBoundaryR)
      w.walterY+=w.wSpeed;
  }

  void cTableBoundaries() {
    if (w.walterX<ctableBoundaryR && w.walterX>ctableBoundaryR-5 && w.walterY<ctableBoundaryU && w.walterY>ctableBoundaryD) //if Walter is at the left boundary of the coffee table
      w.walterX+=w.wSpeed; //Walter cannot move to the right
    if (w.walterX>ctableBoundaryL && w.walterX<ctableBoundaryL+5 && w.walterY<ctableBoundaryU && w.walterY>ctableBoundaryD) //if Walter is at the right boundary of the coffee table
      w.walterX-=w.wSpeed; //Walter cannot move to the left
    if (w.walterY>ctableBoundaryD && w.walterY<ctableBoundaryD+5 && w.walterX>ctableBoundaryL && w.walterX<ctableBoundaryR) //if Walter is at the upper boundary of the coffee table
      w.walterY-=w.wSpeed; //Walter cannot move down
    if (w.walterY<ctableBoundaryU && w.walterY>ctableBoundaryU-5 && w.walterX>ctableBoundaryL && w.walterX<ctableBoundaryR) //if Walter is at the lower boundary of the coffee table
      w.walterY+=w.wSpeed; //Walter cannot move up
  }
  
  void tvBoundary (){
    if (w.walterX < tvBoundaryR && w.walterX > tvBoundaryR-5 && w.walterY < tvBoundaryU && w.walterY > tvBoundaryD)
    w.walterX+=w.wSpeed;
    if(w.walterX > tvBoundaryL && w.walterX < tvBoundaryL + 5 && w.walterY < tvBoundaryU && w.walterY > tvBoundaryD)
    w.walterX-=w.wSpeed;
    if (w.walterY>tvBoundaryD && w.walterY<tvBoundaryD+5 && w.walterX>tvBoundaryL && w.walterX<tvBoundaryR) 
      w.walterY-=w.wSpeed; 
    if (w.walterY<tvBoundaryU && w.walterY>tvBoundaryU-5 && w.walterX>tvBoundaryL && w.walterX<tvBoundaryR) //if Walter is at the lower boundary of the coffee table
      w.walterY+=w.wSpeed; 
  }
    

    
  }

  void leave() {
    if (w.walterY>boundaryD) {
      noMove=true;
      increaseTransparency=true;
      blackTransition=true;
      newRoom=true;
    }
    if (decreaseTransparency && newRoom)
      displayOutside=true;
}
}
