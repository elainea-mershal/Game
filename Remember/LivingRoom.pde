class LivingRoom {
  PImage livingRoom; //image of the living room
  PImage bookcase;
  PImage tv;
  PImage coffeeTable;
  PImage kidTable;
  PImage kidChairs;
  PImage seat;
  boolean goingInside;

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

  int tvBoundaryL=513;
  int tvBoundaryR=645;
  int tvBoundaryU=510;
  int tvBoundaryD=460;

  int ktableBoundaryL=693;
  int ktableBoundaryR=827;
  int ktableBoundaryU=715;
  int ktableBoundaryD=616;

  int kchairBoundaryL=640;
  int kchairBoundaryR=880;
  int kchairBoundaryU=690;
  int kchairBoundaryD=645;
  
  int bookcaseBoundaryL=1070;
  int bookcaseBoundaryR=1410;
  int bookcaseBoundaryD=800;

  int outDoorL=895;
  int outDoorR=960;

  LivingRoom() {
    livingRoom=loadImage("livingRoom.png");
    bookcase=loadImage("bookcase.png");
    tv=loadImage("tv.png");
    coffeeTable=loadImage("coffeeTable.png");
    kidTable=loadImage("kidTable.png");
    kidChairs=loadImage("kidChairs.png");
    seat=loadImage("seat.png");
  }

  void display() { //displays the living room
    image(livingRoom, 0, 0); //draws the living room background

    if (goingInside) {
      w.walterY = height/3*2;
      o.newPosition = false;
      goingInside = false;
    }
  }

  void displayFurniture() {
    image(bookcase, 0, 0);

    if (w.walterY<=ctableBoundaryD+5)
      image(coffeeTable, 0, 0);

    if (w.walterY<=tvBoundaryD+5)
      image(tv, 0, 0);

    if (w.walterY<=ktableBoundaryD+5)
      image(kidTable, 0, 0);

    if (w.walterY<=kchairBoundaryD+5)
      image(kidChairs, 0, 0);
      
      if(w.walterY<=seatBoundaryD+5)
      image(seat,0,0);
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

  void tvBoundaries() {
    if (w.walterX<tvBoundaryR && w.walterX>tvBoundaryR-5 && w.walterY<tvBoundaryU && w.walterY>tvBoundaryD)
      w.walterX+=w.wSpeed;
    if (w.walterX>tvBoundaryL && w.walterX<tvBoundaryL+5 && w.walterY<tvBoundaryU && w.walterY>tvBoundaryD)
      w.walterX-=w.wSpeed;
    if (w.walterY>tvBoundaryD && w.walterY<tvBoundaryD+5 && w.walterX>tvBoundaryL && w.walterX<tvBoundaryR)
      w.walterY-=w.wSpeed;
    if (w.walterY<tvBoundaryU && w.walterY>tvBoundaryU-5 && w.walterX>tvBoundaryL && w.walterX<tvBoundaryR)
      w.walterY+=w.wSpeed;
  }

  void ktableBoundaries() {
    if (w.walterX<ktableBoundaryR && w.walterX>ktableBoundaryR-5 && w.walterY<ktableBoundaryU && w.walterY>ktableBoundaryD)
      w.walterX+=w.wSpeed;
    if (w.walterX>ktableBoundaryL && w.walterX<ktableBoundaryL+5 && w.walterY<ktableBoundaryU && w.walterY>ktableBoundaryD)
      w.walterX-=w.wSpeed;
    if (w.walterY>ktableBoundaryD && w.walterY<ktableBoundaryD+5 && w.walterX>ktableBoundaryL && w.walterX<ktableBoundaryR)
      w.walterY-=w.wSpeed;
    if (w.walterY<ktableBoundaryU && w.walterY>ktableBoundaryU-5 && w.walterX>ktableBoundaryL && w.walterX<ktableBoundaryR)
      w.walterY+=w.wSpeed;
  }
  
  void kchairBoundaries() {
     if (w.walterX<kchairBoundaryR && w.walterX>kchairBoundaryR-5 && w.walterY<kchairBoundaryU && w.walterY>kchairBoundaryD)
      w.walterX+=w.wSpeed;
    if (w.walterX>kchairBoundaryL && w.walterX<kchairBoundaryL+5 && w.walterY<kchairBoundaryU && w.walterY>kchairBoundaryD)
      w.walterX-=w.wSpeed;
    if (w.walterY>kchairBoundaryD && w.walterY<kchairBoundaryD+5 && w.walterX>kchairBoundaryL && w.walterX<kchairBoundaryR)
      w.walterY-=w.wSpeed;
    if (w.walterY<kchairBoundaryU && w.walterY>kchairBoundaryU-5 && w.walterX>kchairBoundaryL && w.walterX<kchairBoundaryR)
      w.walterY+=w.wSpeed;
  }
  
  void bookcaseBoundaries() {
    if (w.walterX<bookcaseBoundaryR && w.walterX>bookcaseBoundaryR-5 && w.walterY>bookcaseBoundaryD)
      w.walterX+=w.wSpeed;
    if (w.walterX>bookcaseBoundaryL && w.walterX<bookcaseBoundaryL+5 && w.walterY>bookcaseBoundaryD)
      w.walterX-=w.wSpeed;
    if (w.walterY>bookcaseBoundaryD && w.walterY<bookcaseBoundaryD+5 && w.walterX>bookcaseBoundaryL && w.walterX<bookcaseBoundaryR)
      w.walterY-=w.wSpeed;
  }

  void leave() {
    if (w.walterY>boundaryD) {
      noMove=true;
      increaseTransparency=true;
      blackTransition=true;
    }
  }
}
