class Scene1 {
  float walterX1=1215; //Walter's first x position
  float walterY1=380; //Walter's first y position
  float walterY2=635; //Walter's second y position
  float lindsayX1=1180; //Lindsay's first x position
  float lindsayY1=290; //Lindsay's first y position
  float lindsayY2=520; //Lindsay's second y position

  int l1TextCounter, l2TextCounter, l3TextCounter, g1TextCounter, wTextCounter; //counters to display text
  int knockCounter; //counter to play the knock
  int scene1Counter; //counter for the scene
  int lindsayCounter; //counter for Lindsay's movement
  int walterCounter; //counter for Walter's movement

  PImage[]l1Text=new PImage[24]; //array to display Lindsay's first text
  PImage[]l2Text=new PImage[29]; //array to dislplay Lindsay's second text
  PImage[]l3Text=new PImage[30]; //array to display Lindsay's third text
  PImage[]g1Text=new PImage[67]; //array to display Gregory's first text
  PImage[]wText=new PImage[5]; //array to display Walter's ... text

  Scene1() {
    for (int index=0; index<l1Text.length; index++) //index variable has an initial value of 0, must be less than the length of l1Text array, and increases by increments of 1
      l1Text[index]=loadImage(index+"l1Text.png");

    for (int index=0; index<l2Text.length; index++) //index variable has an initial value of 0, must be less than the length of l2Text array, and increases by increments of 1
      l2Text[index]=loadImage(index+"l2Text.png");

    for (int index=0; index<l3Text.length; index++) //index variable has an initial value of 0, must be less than the length of l3Text array, and increases by increments of 1 for (int index=0; index<l2Text.length; index++) { //index variable has an initial value of 0, must be less than the length of dText array, and increases by increments of 1
      l3Text[index]=loadImage(index+"l3Text.png");

    for (int index=0; index<g1Text.length; index++) //index variable has an initial value of 0, must be less than the length of g1Text array, and increases by increments of 1
      g1Text[index]=loadImage(index+"g1Text.png");

    for (int index=0; index<wText.length; index++) //index variable has an initial value of 0, must be less than the length of wText array, and increases by increments of 1
      wText[index]=loadImage(index+"wText.png");

    walterX1=map(walterX1, 0, 1920, 0, width);
    walterY1=map(walterY1, 0, 1080, 0, height);
    walterY2=map(walterY2, 0, 1080, 0, height);
    lindsayX1=map(lindsayX1, 0, 1920, 0, width);
    lindsayY1=map(lindsayY1, 0, 1080, 0, height);
    lindsayY2=map(lindsayY2, 0, 1080, 0, height);
  }

  void playScene1a() { //plays the first part of scene 1
    noMove=true; //Walter cannot move
    g.gSitF=true; //Gregory is sitting facing forward

    if (scene1Counter==0) { //if the scene counter is equal to 0
      walterPosition1();
      lindsayPosition1();
      if (w.walterY<=walterY1) //if Walter is at walterY1
        lindsay1Text();
    } else if (scene1Counter==1) //if the scene counter is equal to 1
      lindsayPosition2();
    else if (scene1Counter==2) //if the scene counter is equal to 2
      lindsay2Text();
    else if (scene1Counter==3) //if the sceneCounter is equal to 3
      walterPosition2();
    else if (scene1Counter==4) { //if the sceneCounter is equal to 4
      gregory1Text();
      image(w.walterSitB, 0, 0, width, height); //displays Walter sitting facing back
    } else if (scene1Counter==5) { //if the scene counter is equal to 5
      walterText();
      image(w.walterSitB, 0, 0, width, height); //displays Walter sitting facing back
    } else if (scene1Counter==6) { //if the scene counter is equal to 6
      lindsay3Text();
      image(w.walterSitB, 0, 0, width, height); //displays Walter sitting facing back
    } else if (scene1Counter==7) { //if the scene counter is equal to 7
      image(w.walterSitB, 0, 0, width, height); //displays Walter sitting facing back
      if (knockCounter==0) { //if the knock counter is equal to 0
        knock.amp(0.2); //changes the volume of the knock
        knock.play(); //play the knock sound
        knockCounter++; //increase the knock counter
      }
      increaseTransparency=true; //a transition begins
      whiteTransition=true; //the white transition begins
      hr.displayDiaryText=false; //the diary text is not displayed
    }
  }

  void lindsay1Text() { //displays Lindsays first text
    if (l1TextCounter<l1Text.length-1) //if Lindsay's first text counter is less than the length of l1Text array minus 1
      image(l1Text[l1TextCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays Lindsay's first text
    if (l1TextCounter<l1Text.length-2) //if Lindsay's first text counteris less than the length of l1Text array minus 2
      l1TextCounter++; //increase Lindsay's first text counter
    delay(10); //causes the program to be delayed for 10 miliseconds
  }

  void lindsay2Text() { //displays Lindsay's second text
    if (l2TextCounter<l2Text.length-1) //if Lindsay's second text counter is less than the length of l2Text array minus 1
      image(l2Text[l2TextCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays Lindsay's second text
    if (l2TextCounter<l2Text.length-2) //if Lindsay's second text counter is less than the length of l2Text array minus 2
      l2TextCounter++; //increase Lindsay's second text counter
    delay(10); //causes the program to be delayed for 10 miliseconds
  }

  void lindsay3Text() { //displays Lindsay's third text
    if (l3TextCounter<l3Text.length-1) //if Lindsay's third text counter is less than the length of l3Text array minus 1
      image(l3Text[l3TextCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays Lindsay's third text
    if (l3TextCounter<l3Text.length-2) //if Lindsay's third text counter is less than the length of l3Text array minus 2
      l3TextCounter++; //increase Lindsay's third text counter
    delay(10); //causes the program to be delayed for 10 miliseconds
  }

  void gregory1Text() { //displays Gregory's first text
    if (g1TextCounter<g1Text.length-1) //if Gregory's first text counter is less than the length of g1Text array minus 1
      image(g1Text[g1TextCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays Gregory's first text
    if (g1TextCounter<g1Text.length-2) //if Gregory's first text counter is less than the length of g1Text array minus 2
      g1TextCounter++; //increase Gregory's first text counter
    delay(10); //causes the program to be delayed for 10 miliseconds
  }

  void walterText() { //display Walter's ... text
    if (wTextCounter<wText.length-1) //if Walter's text counter is less than the length of wText array minus 1
      image(wText[wTextCounter], hr.textX[0], hr.textY[2], hr.textX[1], hr.textY[3]); //displays Walter's ... text
    if (wTextCounter<wText.length-2) //if Walter's text counter is less than the length of wText array minus 2
      wTextCounter++; //increase Walter's text counter
    delay(10); //causes the program to be delayed for 10 miliseconds
  }

  void walterPosition1() { //changes Walter's position for the first time
    if (w.walterY>walterY1) { //if Walter is lower than walterY1
      w.wPressed=true; //Walter is to move upwards
      w.idle=false; //Walter is not idle
      w.walterY-=w.wSpeedY/3*2; //Walter moves upwards
    } else {
      w.wPressed=false; //Walter is no longer going to move up
      w.idle=true; //Walter is idle
    }
    if (w.walterY<=walterY1) //if Walter is at walterY1
      w.wasdKey=2; //Walter faces left
  }

  void walterPosition2() { //changes Walter's position for the second time
    if (w.walterY<=walterY2 && walterCounter==0) { //if Walter is lower than walterY2
      w.sPressed=true; //Walter is to move downwards
      w.idle=false; //Walter is not idle
      w.walterY+=w.wSpeedY/3*2; //Walter moves downwards
    } else if (w.walterX<=walterX1 && walterCounter==1) { //if Walter is to the left of walterX1
      w.dPressed=true; //Walter is to move to the right
      w.walterX+=w.wSpeedX/3*2; //Walter moves to the right
    } else if (w.walterX>=walterX1 && walterCounter==2) { //if Walter is to the right of walterX1
      image(w.walterSitB, 0, 0, width, height); //displays Walter sitting facing back
      w.dPressed=false; //Walter is no longer moving to the right
      w.sit=true; //Walter is sitting
      scene1Counter=4; //sets the scene counter to 4
    }

    if (w.walterY>walterY2 && walterCounter==0) //if Walter is below walterY2
      walterCounter=1; //set Walter's movement counter to 1
    if (w.walterX>walterX1 && walterCounter==1) //if Walter is the to the right of walterX1
      walterCounter=2; //set Walter's movement counter to 2
  }

  void lindsayPosition1() { //changes Lindsay's position for the first time
    if (w.walterY>walterY1) //if Walter is below walterY1
      l.lIdleR=true; //Lindsay is idle facing right
  }

  void lindsayPosition2() { //changes Lindsay's position for the second time
    if (l.lindsayY>=lindsayY1 && lindsayCounter==0) { //if Lindsay is below lindsayY1
      l.lUp=true; //Lindsay moves upwards
      l.lIdleR=false; //Lindsay is not idle
    } else if (l.lindsayX<=lindsayX1 && lindsayCounter==1) { //if Lindsay is to the left of lindsayX1
      l.lRight=true; //Lindsay moves to the right
      l.lUp=false; //Lindsay is not moving upwards
    } else if (l.lindsayY<=lindsayY2 && lindsayCounter==2) { //if Lindsay is above lindsayY2
      l.lDown=true; //Lindsay moves downwards
      l.lRight=false; //Lindsay is not moving to the right
    } else if (l.lindsayY>=lindsayY2 && lindsayCounter==3) { //if Linday is below lindsayY2
      l.lSitR=true; //Lindsay is sitting facing right
      l.lDown=false; //Lindsay is not moving downwards
      scene1Counter=2; //sets the scene counter to 2
    }

    if (l.lindsayY<lindsayY1 && lindsayCounter==0) //if Lindsay is above lindsayY1
      lindsayCounter=1; //set Lindsay's movement counter to 1
    else if (l.lindsayX>lindsayX1 && lindsayCounter==1) //if Lindsay is to the right of lindsayX1
      lindsayCounter=2; //set Lindsay's movement counter to 2
    else if (l.lindsayY>lindsayY2 && lindsayCounter==2)  //if Lindsay is below lindsayY2
      lindsayCounter=3; //set Lindsay's movement counter to 3
  }

  void scene1KeyPressed() { //allows keys to be pressed to continue the scene
    if (key=='e') { //if 'e' is pressed
      if (l1TextCounter==l1Text.length-2) { //if Lindsay's first text counter is equal to l1Text array minus 2
        l1TextCounter++; //Lindsay's first text counter increases by 1
        scene1Counter=1; //set the scene counter to 1
      }
      if (l2TextCounter==l2Text.length-2) { //if Lindsay's second text counter is equal to l2Text array minus 2
        l2TextCounter++; //Lindsay's second text counter increases by 1
        scene1Counter=3; //set the scene counter to 3
      }
      if (g1TextCounter==g1Text.length-2) { //if Gregory's first text counter is equal to g1Text array minus 2
        g1TextCounter++; //Gregory's first text counter increases by 1
        scene1Counter=5; //set the scene counter to 5
      }
      if (wTextCounter==wText.length-2) { //if Walter's text counter is equal to wText array minus 2
        wTextCounter++; //Walter's text counter increases by 1
        scene1Counter=6; //set the scene counter to 6
      }
      if (l3TextCounter==l3Text.length-2) { //if Lindsay's third text counter is equal to l3Text array minus 2
        l3TextCounter++; //Lindsay's third text counter increases by 1
        scene1Counter=7; //set the scene counter to 7
      }
    }
  }
}
