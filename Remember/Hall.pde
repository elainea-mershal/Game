class Hall {
  PImage hall; //image of the living room

  int boundaryL;
  int boundaryR;
  int boundaryD;
  int boundaryU;
  
  int stairsL;
  int stairsR;

  Hall() {
    hall=loadImage("hall.png");

    boundaryR=width*1075/1920;
    boundaryL=width*790/1920;
    boundaryU=height*200/1080;
    boundaryD=height*868/1080;
    
    stairsL=width*918/1920;
    stairsR=width*1940/1920;
  }

  void display() { //displays the living room
    image(hall, 0, 0, width, height); //draws the hallway room background
  }

  void boundaries() {
    if (w.walterX<boundaryL)
      w.walterX+=w.wSpeed;
    if (w.walterX>boundaryR)
      w.walterX-=w.wSpeed;
    if (w.walterY<boundaryU)
      w.walterY+=w.wSpeed;
    if (w.walterY>boundaryD && (w.walterX<stairsL || w.walterX>stairsR))
      w.walterY-=w.wSpeed;
  }

  void come() {
    w.walterX=width/2-w.walterW/2;
    w.walterY=height/3*2;
  }

  void leave() {
    if (w.walterY>boundaryD) {
      changeLR=true;
      noMove=true; //Walter cannot move
      increaseTransparency=true; //a transition begins
      blackTransition=true; //the black transition begins
    }
  }
}
