class Scene2 {
  boolean textBuffer; //boolean to prevent text skipping
  boolean gregoryBackyard; //boolean for if Gregory is in the backyard

  PImage[]wfirstText = new PImage[41]; //images for Walter's first dialogue
  PImage[]wsecondText = new PImage[8]; //images for Walter's second dialogue
  PImage baseball; //image for the baseball that Gregory throws

  int byProgress; //counter for cutscene progression

  float rotation; //variable used to spin the baseball
  float bbX, bbY; //X and Y coordinates for the baseball
  float bbheightchange=6; //variable for controlling the height of the baseball
  float aCounter; //counter for Gregory's walking animation

  Scene2() {
    baseball = loadImage("baseball.png");
    for (int index=0; index<wfirstText.length; index++) //index variable has an initial value of 0, must be less than the length of firstText array, and increases by increments of 1
      wfirstText[index]=loadImage(index+"wOutText1.png");
    for (int index=0; index<wsecondText.length; index++) //index variable has an initial value of 0, must be less than the length of secondText array, and increases by increments of 1
      wsecondText[index]=loadImage(index+"wOutText2.png");

    bbheightchange=map(bbheightchange, 0, 1080, 0, height);
    bbX=map(bbX, 0, 1920, 0, width);
    bbY=map(bbY, 0, 1080, 0, height);

    bbX=g.gregBYX+g.gregoryW/4;
    bbY=g.gregBYY+g.gregoryH/2;
  }

  void playScene2a() { //plays the second scene
    int indexW=floor(aCounter)%g.spritesR.length;  //index variable to use each image in Walter's walking sprite sheets

    noMove=true; //Walter cannot move
    if (key=='e' && keyPressed==true && textBuffer==false) { //if e is pressed and a section of the cutscene where e is supposed to be pressed in playing
      byProgress++; //progresses the cutscene
      g.gCounter=0; //resets typewriter effect on textboxes
      textBuffer=true; //the cutscene has been updated
    }
    if (gregoryBackyard==true && byProgress<8) //if Gregory is in the backyard
      image(g.gregoryGlove, g.gregBYX, g.gregBYY, g.gregoryW, g.gregoryH); //displays Gregory wearing his glove
    else if (gregoryBackyard==true && byProgress<9)
      image(g.gregoryThrow, g.gregBYX, g.gregBYY, g.gregoryW, g.gregoryH);
    if (byProgress==0) {
      if (w.walterY>width/4*3) { //if walter is not on the edge of the deck
        w.walterY -= w.wSpeedY; //walter is walking upwards
        w.idle=false; //Walter is moving
        w.wPressed=true; //Walter is moving upwards
      } else
        byProgress++;
    }
    if (byProgress==1) {
      image(g.firstText[g.gCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays Gregory's first dialogue
      if (g.gCounter<g.firstText.length-2) //if the text counter is less than the length of firstText array minus 2
        g.gCounter++; //increase the text counter
      else
        textBuffer=false; //the cutscene is finished updating
    }
    if (byProgress==2) {
      if (w.walterY>g.gregBYY-w.walterH/2) { //if Walter is below gregory on the screen
        w.walterY-=w.wSpeedY; //walter is moving upwards
        w.walterX+=w.wSpeedX; //walter is moving to the left
      } else {
        w.wasdKey=2; //walter is facing left
        byProgress++; //progresses the cutscene
      }
    }
    if (byProgress==3) {
      image(wfirstText[g.gCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays Walters's first dialogue
      if (g.gCounter<wfirstText.length-2) //if the text counter is less than the length of wfirstText array minus 2
        g.gCounter++; //increase the text counter
      else
        textBuffer=false; //the cutscene is finished updating
    }
    if (byProgress==4) {
      image(g.secondText[g.gCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays Gregory's second dialogue
      if (g.gCounter<g.secondText.length-2) //if the text counter is less than the length of secondText array minus 2
        g.gCounter++; //increase the text counter
      else
        textBuffer=false; //the cutscene is finished updating
    }
    if (byProgress==5) {
      image(wsecondText[g.gCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays Walter's second dialogue
      if (g.gCounter<wsecondText.length-2) //if the text counter is less than the length of secondText array minus 2
        g.gCounter++; //increase the text counter
      else
        textBuffer=false; //the cutscene is finished updating
    }
    if (byProgress==6) {
      image(g.thirdText[g.gCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays Gregory's third dialogue
      if (g.gCounter<g.thirdText.length-2) //if the text counter is less than the length of thirdText array minus 2
        g.gCounter++; //increase the text counter
      else
        textBuffer=false; //the cutscene is finished updating
    }
    if (byProgress==7) {
      if (bbX < width+w.walterW*2) {
        bbX+=w.wSpeedX*3; //the baseball is moving to the right
        bbY-=bbheightchange; //the baseball is moving up, and then back down
        bbheightchange=bbheightchange-0.05; //how far up the baseball goes decreases overtime, eventually going downwards
        pushMatrix(); //starts a pushmatrix to spin the baseball
        imageMode(CENTER); //spins the ball from its center
        translate(bbX, bbY); //maintains the baseball at it's intended location
        rotate(rotation+=0.25); //rotates the baseball at a speed of 0.25
        image(baseball, 0, 0); //player vehicle image to be rotated, replaces the normal player image while spinning is active
        imageMode(CORNER);
        popMatrix(); //ends pushmatrix affecting code above
      } else
        byProgress++; //progresses the cutscene
    }
    if (byProgress==8) {
      image(g.fourthText[g.gCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays Gregory's fourth dialogue
      if (g.gCounter<g.fourthText.length-2) //if the text counter is less than the length of fourthText array minus 2
        g.gCounter++; //increase the text counter
      else
        textBuffer=false; //the cutscene is finished updating
    }
    if (byProgress==9) {
      image(g.spritesR[indexW], g.gregBYX, g.gregBYY, g.gregoryW, g.gregoryH); //displays gregory walking to the right
      aCounter+=w.aSpeedW*2; //sets the speed for Gregory's walking animation (every line of this exact code does, must be done after every sprite image))
      g.gregBYX+=w.wSpeedX*2; //sets the speed for Gregory
      if (g.gregBYX>w.walterX+w.walterW*2) //if Gregory has passed Walter
        w.wasdKey=4; //Walter is facing left
      if (g.gregBYX>width+w.walterW*3) // if Gregory has left the screen
        byProgress++; //progresses the cutscene
    }
    if (byProgress==10) {
      increaseTransparency=true; //a transition begins
      whiteTransition=true; //the white transition begins
      hr.displayDiaryText=false; //the diary text is not displayed
    }
  }
}
