class Hall {
  PImage hall; //image of the living room

  int boundaryL; //left hall boundary
  int boundaryR; //right hall boundary
  int boundaryU; //up hall boundary
  int boundaryD; //down hall boundary

  int stairsL; //left stairs boundary
  int stairsR; //right stairs boundary

  Hall() {
    hall=loadImage("hall.png");

    boundaryR=width*1075/1920;
    boundaryL=width*790/1920;
    boundaryU=height*200/1080;
    boundaryD=height*868/1080;

    stairsL=width*918/1920;
    stairsR=width*1940/1920;
  }

  void display() { //displays the hall
    image(hall, 0, 0, width, height); //draws the hall background
  }

  void boundaries() { //sets movement boundaries for Walter in the hall
    if (w.walterX<boundaryL) //if Walter is outside of the left hall boundary
      w.walterX+=w.wSpeed; //Walter cannot move to the left
    if (w.walterX>boundaryR) //if Walter is outside of the right hall boundary
      w.walterX-=w.wSpeed; //Walter cannot move to the right
    if (w.walterY<boundaryU) //if Walter is outside of the upper hall boundary
      w.walterY+=w.wSpeed; //Walter cannot move upwards
    if (w.walterY>boundaryD && (w.walterX<stairsL || w.walterX>stairsR)) //if Walter is outside of the bottom hall boundary
      w.walterY-=w.wSpeed; //Walter cannot move downwards
  }

  void come() { //changes Walter's position when he comes to the hall
    w.walterX=width/2-w.walterW/2; //Walter is in the middle of the hallway
    w.walterY=height/3*2; //Walter is just above the stairs
  }

  void leave() { //allows Walter to leave the hall
    if (w.walterY>boundaryD) { //if Walter is outside of the bottom hall boundary
      changeLR=true; //the screen is to be changed to the living room
      noMove=true; //Walter cannot move
      increaseTransparency=true; //a transition begins
      blackTransition=true; //the black transition begins
    }
  }
}
