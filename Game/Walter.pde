class Walter {
  PImage bwWalter;
  int walterSpeed=5;
  int walterX, walterY;
  int hrBoundaryL=587;
  int hrBoundaryR=1271;
  int hrBoundaryU=106;
  int hrBoundaryD=732;
  int bedBoundaryX=1145;
  int bedBoundaryY=300;
  int startPosX=1215;
  int startPosY=250;
  boolean wPressed, aPressed, sPressed, dPressed;
  boolean bedCollision;

  Walter() {
    bwWalter=loadImage("bwWalter.png");
    bwWalter.resize(64, 128);

    walterX=startPosX;
    walterY=startPosY;
  }

  void displayWalter() {
    image(bwWalter, walterX, walterY);
  }

  void hrBoundaries() {
    if (walterX<hrBoundaryL)
      walterX+=walterSpeed;
    if (walterX>hrBoundaryR)
      walterX-=walterSpeed;
    if (walterY<hrBoundaryU)
      walterY+=walterSpeed;
    if (walterY>hrBoundaryD)
      walterY-=walterSpeed;

    if (walterY==bedBoundaryY&&walterX>bedBoundaryX)
      walterY+=walterSpeed;
  }

  void walterMove() {
    if (wPressed)
      walterY-=walterSpeed;
    if (aPressed)
      walterX-=walterSpeed;
    if (sPressed)
      walterY+=walterSpeed;
    if (dPressed)
      walterX+=walterSpeed;
  }

  void walterKeyPressed() {
    if (key=='w')
      wPressed=true;
    if (key=='a')
      aPressed=true;
    if (key=='s')
      sPressed=true;
    if (key=='d')
      dPressed=true;
  }

  void walterKeyReleased() {
    if (key=='w')
      wPressed=false;
    if (key=='a')
      aPressed=false;
    if (key=='s')
      sPressed=false;
    if (key=='d')
      dPressed=false;
  }
}
