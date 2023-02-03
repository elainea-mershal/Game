class Scene3 {
  float walterY1=545; //Walter's first y position
  float walterX1=1170; //Walter's first x position
  float familyX1=1185; //Gregory and Lindsay's first x position
  float gregoryY1=810; //Gregory's first y position
  float lindsayY1=732; //Lindsay's first y position
  float familyX2=925; //Gregory and Lindsay's second x position
  float textY=140; //y position for the text

  int scene3Counter; //counter to display the third scene
  int walterCounter; //counter for Walter's movement
  int familyCounter; //counter for Gregory and Lindsay's movement
  int w1TextCounter, w2TextCounter, w3TextCounter, w4TextCounter, lr1TextCounter, lr2TextCounter, lr3TextCounter, lr4TextCounter; //counters to display the text

  PImage[]w1Text=new PImage[12]; //array to display Walter's first text
  PImage[]w2Text=new PImage[18]; //array to display Walter's second text
  PImage[]w3Text=new PImage[9]; //array to display Walter's third text
  PImage[]w4Text=new PImage[22]; //array to display Walter's fourth text
  PImage[]lr1Text=new PImage[24]; //array to display Lindsay's first text
  PImage[]lr2Text=new PImage[11]; //array to display Lindsay's second text
  PImage[]lr3Text=new PImage[53]; //array to display Lindsay's third text
  PImage[]lr4Text=new PImage[16]; //array to display Lindsay's fourth text

  Scene3() {
    for (int index=0; index<w1Text.length; index++) //index variable has an initial value of 0, must be less than the length of w1Text array, and increases by increments of 1
      w1Text[index]=loadImage(index+"w1Text.png");
    for (int index=0; index<lr1Text.length; index++) //index variable has an initial value of 0, must be less than the length of lr1Text array, and increases by increments of 1
      lr1Text[index]=loadImage(index+"lr1Text.png");
    for (int index=0; index<w2Text.length; index++) //index variable has an initial value of 0, must be less than the length of w2Text array, and increases by increments of 1
      w2Text[index]=loadImage(index+"w2Text.png");
    for (int index=0; index<lr2Text.length; index++) //index variable has an initial value of 0, must be less than the length of lr2Text array, and increases by increments of 1
      lr2Text[index]=loadImage(index+"lr2Text.png");
    for (int index=0; index<w3Text.length; index++) //index variable has an initial value of 0, must be less than the length of w3Text array, and increases by increments of 1
      w3Text[index]=loadImage(index+"w3Text.png");
    for (int index=0; index<lr3Text.length; index++) //index variable has an initial value of 0, must be less than the length of lr3Text array, and increases by increments of 1
      lr3Text[index]=loadImage(index+"lr3Text.png");
    for (int index=0; index<w4Text.length; index++) //index variable has an initial value of 0, must be less than the length of w4Text array, and increases by increments of 1
      w4Text[index]=loadImage(index+"w4Text.png");
    for (int index=0; index<lr4Text.length; index++) //index variable has an initial value of 0, must be less than the length of lr4Text array, and increases by increments of 1
      lr4Text[index]=loadImage(index+"lr4Text.png");

    walterY1=map(walterY1, 0, 1080, 0, height);
    walterX1=map(walterX1, 0, 1920, 0, width);
    familyX1=map(familyX1, 0, 1920, 0, width);
    gregoryY1=map(gregoryY1, 0, 1080, 0, height);
    lindsayY1=map(lindsayY1, 0, 1080, 0, height);
    familyX2=map(familyX2, 0, 1920, 0, width);
    textY=map(textY, 0, 1080, 0, height);
  }

  void playScene3() { //plays the third scene
    if (soundCounter<13) //if the sound counter is less than 13
      soundCounter++; //increase the sound counter
    noMove=true; //Walter cannot move
    if (scene3Counter==0) { //if the scene3Counter is equal to 0
      walterPosition1();
      g.gSitF=false; //Gregory is not sitting facing forward
      l.lSitR=false; //Lindsay is not sitting facing right
      l.lIdleR=true; //Lindsay is idle facing right
      g.gIdleR=true; //Gregory is idle facing right
      g.gregoryX=familyX1; //sets Gregory's x coordinate
      g.gregoryY=gregoryY1; //sets Gregory's y coordinate
      l.lindsayX=familyX1; //sets Lindsay's x coordinate
      l.lindsayY=lindsayY1; //sets Lindsay's y coordinate
    } else if (scene3Counter==1) { //if the scene3Counter is equal to 1
      l.lIdleR=false; //Lindsay is not idle facing right
      l.lIdleB=true; //Lindsay is idle facing back
      g.gIdleR=false; //Gregory is not idle facing right
      g.gIdleB=true; //Gregory is idle facing back
      walter1Text();
    } else if (scene3Counter==2) //if the scene3Counter is equal to 2
      lindsay1Text();
    else if (scene3Counter==3) //if the scene3Counter is equal to 3
      walter2Text();
    else if (scene3Counter==4) //if the scene3Counter is equal to 4
      lindsay2Text();
    else if (scene3Counter==5) //if the scene3Counter is equal to 5
      walter3Text();
    else if (scene3Counter==6) //if the scene3Counter is equal to 6
      lindsay3Text();
    else if (scene3Counter==7) //if the scene3Counter is equal to 7
      walter4Text();
    else if (scene3Counter==8) //if the scene3Counter is equal to 8
      lindsay4Text();
    else if (scene3Counter==9) //if the scene3Counter is equal to 9
      familyLeave();
  }

  void walter1Text() { //displays Walter's first text
    if (w1TextCounter<w1Text.length-1) //if Walter's first text counter is less than the length of w1Text array minus 1
      image(w1Text[w1TextCounter], hr.textX[0], textY, hr.textX[1], hr.textY[3]); //displays Walter's first text
    if (w1TextCounter<w1Text.length-2) //if Walter's first text counter is less than the length of w1Text array minus 2
      w1TextCounter++; //increase Walter's first text counter
    delay(10); //causes the program to be delayed for 10 miliseconds
  }

  void walter2Text() { //displays Walter's second text
    if (w2TextCounter<w2Text.length-1) //if Walter's second text counter is less than the length of w2Text array minus 1
      image(w2Text[w2TextCounter], hr.textX[0], textY, hr.textX[1], hr.textY[3]); //displays Walter's second text
    if (w2TextCounter<w2Text.length-2) //if Walter's second text counter is less than the length of w2Text array minus 2
      w2TextCounter++; //increase Walter's second text counter
    delay(10); //causes the program to be delayed for 10 miliseconds
  }

  void walter3Text() { //displays Walter's third text
    if (w3TextCounter<w3Text.length-1) //if Walter's third text counter is less than the length of w3Text array minus 1
      image(w3Text[w3TextCounter], hr.textX[0], textY, hr.textX[1], hr.textY[3]); //displays Walter's third text
    if (w3TextCounter<w3Text.length-2) //if Walter's third text counter is less than the length of w3Text array minus 2
      w3TextCounter++; //increase Walter's third text counter
    delay(10); //causes the program to be delayed for 10 miliseconds
  }

  void walter4Text() { //displays Walter's fourth text
    if (w4TextCounter<w4Text.length-1) //if Walter's fourth text counter is less than the length of w4Text array minus 1
      image(w4Text[w4TextCounter], hr.textX[0], textY, hr.textX[1], hr.textY[3]); //displays Walter's fourth text
    if (w4TextCounter<w4Text.length-2) //if Walter's fourth text counter is less than the length of w4Text array minus 2
      w4TextCounter++; //increase Walter's fourth text counter
    delay(10); //causes the program to be delayed for 10 miliseconds
  }

  void lindsay1Text() { //displays Lindsay's first text
    if (lr1TextCounter<lr1Text.length-1) //if Lindsay's first text counter is less than the length of lr1Text array minus 1
      image(lr1Text[lr1TextCounter], hr.textX[0], textY, hr.textX[1], hr.textY[3]); //displays Lindsay's first text
    if (lr1TextCounter<lr1Text.length-2) //if Lindsay's first text counter is less than the length of lr1Text array minus 2
      lr1TextCounter++; //increase Lindsay's first text counter
    delay(10); //causes the program to be delayed for 10 miliseconds
  }

  void lindsay2Text() { //displays Lindsay's second text
    if (lr2TextCounter<lr2Text.length-1) //if Lindsay's second text counter is less than the length of lr2Text array minus 1
      image(lr2Text[lr2TextCounter], hr.textX[0], textY, hr.textX[1], hr.textY[3]); //displays Lindsay's second text
    if (lr2TextCounter<lr2Text.length-2) //if Lindsay's second text counter is less than the length of lr2Text array minus 2
      lr2TextCounter++; //increase Lindsay's second text counter
    delay(10); //causes the program to be delayed for 10 miliseconds
  }

  void lindsay3Text() { //displays Lindsay's third text
    if (lr3TextCounter<lr3Text.length-1) //if Lindsay's third text counter is less than the length of lr3Text array minus 1
      image(lr3Text[lr3TextCounter], hr.textX[0], textY, hr.textX[1], hr.textY[3]); //displays Lindsay's third text
    if (lr3TextCounter<lr3Text.length-2) //if Lindsay's third text counter is less than the length of lr3Text array minus 2
      lr3TextCounter++; //increase Lindsay's third text counter
    delay(10); //causes the program to be delayed for 10 miliseconds
  }

  void lindsay4Text() { //displays Lindsay's fourth text
    if (lr4TextCounter<lr4Text.length-1) //if Lindsay's fourth text counter is less than the length of lr4Text array minus 1
      image(lr4Text[lr4TextCounter], hr.textX[0], textY, hr.textX[1], hr.textY[3]); //displays Lindsay's fourth text
    if (lr4TextCounter<lr4Text.length-2) //if Lindsay's fourth text counter is less than the length of lr4Text array minus 2
      lr4TextCounter++; //increase Lindsay's third text counter
    delay(10); //causes the program to be delayed for 10 miliseconds
  }

  void walterPosition1() { //changes Walter's position for the first time
    if (w.walterY<=walterY1 && walterCounter==0) { //if Walter is above walterY1
      w.sPressed=true; //Walter is walking downwards
      w.idle=false; //Walter is not idle
      w.walterY+=w.wSpeedY/3*2; //Walter moves downwards
    } else if (w.walterX>=walterX1 && walterCounter==1) { //if Walter is to the right of walterX1
      w.sPressed=false; //Walter is not walking downwards
      w.aPressed=true; //Walter is walking to the left
      w.walterX-=w.wSpeedX/3*2; //Walter moves to the left
    } else if (w.walterX<=walterX1 && walterCounter==2) { //if Walter is to the left of walterX1
      w.aPressed=false; //Walter is not walking to the right
      w.idle=true; //Walter is idle
      w.wasdKey=3; //Walter is facing forwards
      scene3Counter=1; //the scene3Counter is set to 1
    }

    if (w.walterY>walterY1 && walterCounter==0) //if Walter is below walterY1
      walterCounter=1; //set Walter's movement counter to 1
    else if (w.walterX<walterX1 && walterCounter==1) //if Walter is the to the left of walterX1
      walterCounter=2; //set Walter's movement counter to 2
  }

  void familyLeave() { //changes Gregory and Lindsay's positions to leave the house
    if (l.lindsayX>=familyX2 && familyCounter==0) { //if Lindsay is to the right of familyX2
      l.lIdleB=false; //Lindsay is not idle facing back
      l.lLeft=true; //Lindsay is walking to the left
      g.gIdleB=false; //Gregory is not idle facing back
      g.gLeft=true; //Gregory is walking to the left
    } else if (l.lindsayY<=lr.boundariesY[1] && familyCounter==1) { //if Lindsay is above the bottom living room boundary
      l.lLeft=false; //Lindsay is not walking to the left
      l.lDown=true; //Lindsay is walking downwards
      g.gLeft=false; //Gregory is not walking to the left
      g.gDown=true; //Gregory is walking downwards
    } else if (l.lindsayY>=lr.boundariesY[1] && familyCounter==2) { //if Lindsay is below the bootom living room boundary
      l.lDown=false; //Lindsay is not walking downwards
      g.gDown=false; //Gregory is not walking downwards
      increaseTransparency=true; //a transition begins
      whiteTransition=true; //the white transition begins
      hr.displayDiaryText=false; //the diary text is not displayed
    }
    if (l.lindsayX<=familyX2 && familyCounter==0) //if Lindsay is to the left of familyX2
      familyCounter=1; //set Lindsay & Gregory's movement counter to 1
    else if (l.lindsayY>=lr.boundariesY[2] && familyCounter==1) //if Lindsay is below the bottom living room boundary
      familyCounter=2; //set Lindsay & Gregory's movement counter to 2
  }

  void scene3KeyPressed() { //allows keys to be pressed to continue the scene
    if (key=='e') { //if 'e' is pressed
      if (w1TextCounter==w1Text.length-2) { //if Walter's first text counter is equal to w1Text array minus 2
        w1TextCounter++; //Walter's first text counter increases by 1
        scene3Counter=2; //set the scene counter to 2
      }
      if (lr1TextCounter==lr1Text.length-2) { //if Lindsay's first text counter is equal to lr1Text array minus 2
        lr1TextCounter++; //Lindsay's first text counter increases by 1
        scene3Counter=3; //set the scene counter to 3
      }
      if (w2TextCounter==w2Text.length-2) { //if Walter's second text counter is equal to w2Text array minus 2
        w2TextCounter++; //Walter's second text counter increases by 1
        scene3Counter=4; //set the scene counter to 4
      }
      if (lr2TextCounter==lr2Text.length-2) { //if Lindsay's second text counter is equal to lr2Text array minus 2
        lr2TextCounter++; //Lindsay's second text counter increases by 1
        scene3Counter=5; //set the scene counter to 5
      }
      if (w3TextCounter==w3Text.length-2) { //if Walter's third text counter is equal to w3Text array minus 2
        w3TextCounter++; //Walter's third text counter increases by 1
        scene3Counter=6; //set the scene counter to 6
      }
      if (lr3TextCounter==lr3Text.length-2) { //if Lindsay's third text counter is equal to lr3Text array minus 2
        lr3TextCounter++; //Lindsay's third text counter increases by 1
        scene3Counter=7; //set the scene counter to 7
      }
      if (w4TextCounter==w4Text.length-2) { //if Walter's fourth text counter is equal to w4Text array minus 2
        w4TextCounter++; //Walter's fourth text counter increases by 1
        scene3Counter=8; //set the scene counter to 8
      }
      if (lr4TextCounter==lr4Text.length-2) { //if Lindsay's fourth text counter is equal to lr4Text array minus 2
        lr4TextCounter++; //Lindsay's fourth text counter increases by 1
        scene3Counter=9; //set the scene counter to 9
      }
    }
  }
}
