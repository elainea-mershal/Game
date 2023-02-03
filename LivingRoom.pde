class LivingRoom {
  PImage livingRoom; //image of the living room
  PImage tree; //image of the christmas tree
  PImage bookcase; //image of the bookcase
  PImage tv; //image of the TV
  PImage coffeeTable; //image of the coffee table
  PImage kidTable; //image of the kid table
  PImage kidChairs; //image of the kid chairs
  PImage chairs; //image of the chairs
  PImage seat; //image of the seat

  float[] boundariesX=new float[] {455, 1410, 1620, 1670}; //left and right living room and hall boundaries
  float[] boundariesY=new float[] {200, 820, 494, 595, 336}; //up and down living room, hall, and hall cutoff boundaries
  float[] furnitureBoundariesX=new float[] {1165, 1325, 490, 730, 511, 650, 513, 645, 693, 827, 638, 880, 1070, 1410, 1075, 1157, 1325, 1405, 1155, 1335}; //left and right boundaries for the fire, couch, coffee table, tv, kid table, kid chairs, bookcase, left chair, right chair, and seat
  float[] furnitureBoundariesY=new float[] {340, 295, 510, 460, 715, 616, 690, 645, 290, 330, 380, 420}; //up and down boundaries for the coffee table, tv, kid table, kid chairs, chairs, and seat
  float[] oDoorX=new float[] {895, 960}; //left and right outside door boundaries
  float[] kDoorX=new float[] {910, 946}; //left and right kitchen door boundaries

  float fireBoundaryU=260; //up fireplace boundary
  float couchBoundaryU=245; //up couch boundary
  float bookcaseBoundaryD=800; //down bookcase boundary

  LivingRoom() {
    livingRoom=loadImage("livingRoom.png");
    tree=loadImage("tree.png");
    bookcase=loadImage("bookcase.png");
    tv=loadImage("tv.png");
    coffeeTable=loadImage("coffeeTable.png");
    kidTable=loadImage("kidTable.png");
    kidChairs=loadImage("kidChairs.png");
    chairs=loadImage("chairs.png");
    seat=loadImage("seat.png");

    for (int index=0; index<boundariesX.length; index++) //index variable has an initial value of 0, must be less than the length of boundariesX array, and increases by increments of 1
      boundariesX[index]=map(boundariesX[index], 0, 1920, 0, width);

    for (int index=0; index<boundariesY.length; index++) //index variable has an initial value of 0, must be less than the length of boundariesY array, and increases by increments of 1
      boundariesY[index]=map(boundariesY[index], 0, 1080, 0, height);

    for (int index=0; index<furnitureBoundariesX.length; index++) //index variable has an initial value of 0, must be less than the length of boundariesX array, and increases by increments of 1
      furnitureBoundariesX[index]=map(furnitureBoundariesX[index], 0, 1920, 0, width);

    for (int index=0; index<oDoorX.length; index++) { //index variable has an initial value of 0, must be less than the length of oDoorX array, and increases by increments of 1
      oDoorX[index]=map(oDoorX[index], 0, 1920, 0, width);
      kDoorX[index]=map(kDoorX[index], 0, 1920, 0, width);
    }

    fireBoundaryU=map(fireBoundaryU, 0, 1080, 0, height);
    couchBoundaryU=map(couchBoundaryU, 0, 1080, 0, height);
    bookcaseBoundaryD=map(bookcaseBoundaryD, 0, 1080, 0, height);
    hr.increaseBoundariesX[0]=map(hr.increaseBoundariesX[0], 0, 1920, 0, width);
    hr.increaseBoundariesY[0]=map(hr.increaseBoundariesY[0], 0, 1080, 0, height);
  }

  void display() { //displays the living room
    image(livingRoom, 0, 0, width, height); //draws the living room background
  }

  void displayFurniture() { //displays the furniture on top of Walter
    if (roomCounter==6) //if Walter is in the living room for the third time
      image(tree, 0, 0, width, height); //display the christmas tree
    else
      image(bookcase, 0, 0, width, height); //display the bookcase

    if (w.walterY<=furnitureBoundariesY[1]+hr.increaseBoundariesY[0]) //if Walter is above the coffee table
      image(coffeeTable, 0, 0, width, height); //display the coffee table

    if (w.walterY<=furnitureBoundariesY[3]+hr.increaseBoundariesY[0]) //if Walter is above the TV
      image(tv, 0, 0, width, height); //display the TV

    if (w.walterY<=furnitureBoundariesY[5]+hr.increaseBoundariesY[0]) //if Walter is above the kid table
      image(kidTable, 0, 0, width, height); //display the kid table

    if (w.walterY<=furnitureBoundariesY[7]+hr.increaseBoundariesY[0]) //if Walter is above the kid chairs
      image(kidChairs, 0, 0, width, height); //display the kid chairs

    if (w.walterY<=furnitureBoundariesY[9]+hr.increaseBoundariesY[0]) //if Walter is above the chairs
      image(chairs, 0, 0, width, height); //display the chairs

    if (w.walterY<=furnitureBoundariesY[11]+hr.increaseBoundariesY[0]) //if Waletr is above the seat
      image(seat, 0, 0, width, height); //display the seat
  }

  void boundaries() { //sets movement boundaries for Walter in the living room
    if (w.walterX<boundariesX[0] || (w.walterX<boundariesX[2] && w.walterX>boundariesX[1]+hr.increaseBoundariesX[0] && w.walterY<boundariesY[2])) //if Walter is outside of the left living room boundary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    if ((w.walterX>boundariesX[1] && w.walterX<boundariesX[2] && (w.walterY<boundariesY[2] || w.walterY>boundariesY[3]))|| w.walterX>boundariesX[3]) //if Walter is outside of the right living room boundary
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    if (w.walterY<boundariesY[0] && (w.walterX<kDoorX[0] || w.walterX>kDoorX[1]) || (w.walterY<boundariesY[2] && w.walterX<boundariesX[2] && w.walterX>boundariesX[1])) //if Walter is outside of the top living room boundary
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
    if ((w.walterY>boundariesY[1] && (w.walterX<oDoorX[0] || w.walterX>oDoorX[1])) || (w.walterY>boundariesY[3]-hr.increaseBoundariesY[0] && w.walterX>boundariesX[1])) //if Walter is outside of the bottom living room boundary
      w.walterY-=w.wSpeedY; //Walter cannot move downwards
  }

  void fireBoundaries() { //sets movement boundaries for Walter around the fireplace
    if (w.walterX>furnitureBoundariesX[0] && w.walterX<furnitureBoundariesX[0]+hr.increaseBoundariesX[0] && w.walterY<fireBoundaryU) //if Walter is at the left boundary of the fireplace
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<furnitureBoundariesX[1] && w.walterX>furnitureBoundariesX[1]-hr.increaseBoundariesX[0] && w.walterY<fireBoundaryU) //if Walter is at the right boundary of the fireplace
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<fireBoundaryU && w.walterX>furnitureBoundariesX[0] && w.walterX<furnitureBoundariesX[1]) //if Walter is at the top boundary of the fireplace
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
  }

  void couchBoundaries() { //sets movement boundaries for Walter around the couch
    if (w.walterX>furnitureBoundariesX[2] && w.walterX<furnitureBoundariesX[2]+hr.increaseBoundariesX[0] && w.walterY<couchBoundaryU) //if Walter is at the left boundary of the couch
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<furnitureBoundariesX[3] && w.walterX>furnitureBoundariesX[3]-hr.increaseBoundariesX[0] && w.walterY<couchBoundaryU) //if Walter is at the right boundary of the couch
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<couchBoundaryU && w.walterX>furnitureBoundariesX[2] && w.walterX<furnitureBoundariesX[3]) //if Walter is at the top boundary of the couch
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
  }

  void cTableBoundaries() { //sets movement boundaries for Walter around the coffee table
    if (w.walterX>furnitureBoundariesX[4] && w.walterX<furnitureBoundariesX[4]+hr.increaseBoundariesX[0] && w.walterY<furnitureBoundariesY[0] && w.walterY>furnitureBoundariesY[1]) //if Walter is at the left boundary of the coffee table
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<furnitureBoundariesX[5] && w.walterX>furnitureBoundariesX[5]-hr.increaseBoundariesX[0] && w.walterY<furnitureBoundariesY[0] && w.walterY>furnitureBoundariesY[1]) //if Walter is at the right boundary of the coffee table
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<furnitureBoundariesY[0] && w.walterY>furnitureBoundariesY[0]-hr.increaseBoundariesY[0] && w.walterX>furnitureBoundariesX[4] && w.walterX<furnitureBoundariesX[5]) //if Walter is at the top boundary of the coffee table
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
    else if (w.walterY>furnitureBoundariesY[1] && w.walterY<furnitureBoundariesY[1]+hr.increaseBoundariesY[0] && w.walterX>furnitureBoundariesX[4] && w.walterX<furnitureBoundariesX[5]) //if Walter is at the bottom boundary of the coffee table
      w.walterY-=w.wSpeedY; //Walter cannot move downwards
  }

  void tvBoundaries() { //sets movement boundaries for Walter around the TV
    if (w.walterX>furnitureBoundariesX[6] && w.walterX<furnitureBoundariesX[6]+hr.increaseBoundariesX[0] && w.walterY<furnitureBoundariesY[2] && w.walterY>furnitureBoundariesY[3]) //if Walter is at the left boundary of the TV
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<furnitureBoundariesX[7] && w.walterX>furnitureBoundariesX[7]-hr.increaseBoundariesX[0] && w.walterY<furnitureBoundariesY[2] && w.walterY>furnitureBoundariesY[3]) //if Walter is at the right boundary of the TV
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<furnitureBoundariesY[2] && w.walterY>furnitureBoundariesY[2]-hr.increaseBoundariesY[0] && w.walterX>furnitureBoundariesX[6] && w.walterX<furnitureBoundariesX[7]) //if Walter is at the top boundary of the TV
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
    else if (w.walterY>furnitureBoundariesY[3] && w.walterY<furnitureBoundariesY[3]+hr.increaseBoundariesY[0] && w.walterX>furnitureBoundariesX[6] && w.walterX<furnitureBoundariesX[7]) //if Walter is at the bottom boundary of the TV
      w.walterY-=w.wSpeedY; //Walter cannot move downwards
  }

  void kTableBoundaries() { //sets movement boundaries for Walter around the kid table
    if (w.walterX>furnitureBoundariesX[8] && w.walterX<furnitureBoundariesX[8]+hr.increaseBoundariesX[0] && w.walterY<furnitureBoundariesY[4] && w.walterY>furnitureBoundariesY[5]) //if Walter is at the left boundary of the kid table
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<furnitureBoundariesX[9] && w.walterX>furnitureBoundariesX[9]-hr.increaseBoundariesX[0] && w.walterY<furnitureBoundariesY[4] && w.walterY>furnitureBoundariesY[5]) //if Walter is at the right boundary of the kid table
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<furnitureBoundariesY[4] && w.walterY>furnitureBoundariesY[4]-hr.increaseBoundariesY[0] && w.walterX>furnitureBoundariesX[8] && w.walterX<furnitureBoundariesX[9]) //if Walter is at the top boundary of the kid table
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
    else if (w.walterY>furnitureBoundariesY[5] && w.walterY<furnitureBoundariesY[5]+hr.increaseBoundariesY[0] && w.walterX>furnitureBoundariesX[8] && w.walterX<furnitureBoundariesX[9]) //if Walter is at the bottom boundary of the kid table
      w.walterY-=w.wSpeedY; //Walter cannot move downwards
  }

  void kchairBoundaries() { //sets movement boundaries for Walter around the kid chairs
    if (w.walterX>furnitureBoundariesX[10] && w.walterX<furnitureBoundariesX[10]+hr.increaseBoundariesX[0] && w.walterY<furnitureBoundariesY[6] && w.walterY>furnitureBoundariesY[7]) //if Walter is at the left boundary of the kid chairs
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<furnitureBoundariesX[11] && w.walterX>furnitureBoundariesX[11]-hr.increaseBoundariesX[0] && w.walterY<furnitureBoundariesY[6] && w.walterY>furnitureBoundariesY[7]) //if Walter is at the right boundary of the kid chairs
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<furnitureBoundariesY[6] && w.walterY>furnitureBoundariesY[6]-hr.increaseBoundariesY[0] && w.walterX>furnitureBoundariesX[10] && w.walterX<furnitureBoundariesX[11]) //if Walter is at the top boundary of the kid chairs
      w.walterY+=w.wSpeedY; //Walter cannot move upwards
    else if (w.walterY>furnitureBoundariesY[7] && w.walterY<furnitureBoundariesY[7]+hr.increaseBoundariesY[0] && w.walterX>furnitureBoundariesX[10] && w.walterX<furnitureBoundariesX[11]) //if Walter is at the bottom boundary of the kid chairs
      w.walterY-=w.wSpeedY; //Walter cannot move downwards
  }

  void bookcaseBoundaries() { //sets movement boundaries for Walter around the bookcase
    if (w.walterX>furnitureBoundariesX[12] && w.walterX<furnitureBoundariesX[12]+hr.increaseBoundariesX[0] && w.walterY>bookcaseBoundaryD) //if Walter is at the left boundary of the bookcase
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    if (w.walterX<furnitureBoundariesX[13] && w.walterX>furnitureBoundariesX[13]-hr.increaseBoundariesX[0] && w.walterY>bookcaseBoundaryD) //if Walter is at the right boundary of the bookcase
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    if (w.walterY>bookcaseBoundaryD && w.walterY<bookcaseBoundaryD+hr.increaseBoundariesY[0] && w.walterX>furnitureBoundariesX[12] && w.walterX<furnitureBoundariesX[13]) //if Walter is at the bottom boundary of the bookcase
      w.walterY-=w.wSpeedY; //Walter cannot move downwards
  }

  void chairLBoundaries () { //sets movement boundaries for Walter around the left chair
    if (w.walterX>furnitureBoundariesX[14] && w.walterX<furnitureBoundariesX[14]+hr.increaseBoundariesX[0] && w.walterY>furnitureBoundariesY[8] && w.walterY<furnitureBoundariesY[9]) //if Walter is at the left boundary of the left chair
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<furnitureBoundariesX[15] && w.walterX>furnitureBoundariesX[15]-hr.increaseBoundariesX[0] && w.walterY>furnitureBoundariesY[8] && w.walterY<furnitureBoundariesY[9]) //if Walter is at the right boundary of the left chair
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<furnitureBoundariesY[8] && w.walterY>furnitureBoundariesY[8]-hr.increaseBoundariesY[0] && w.walterX>furnitureBoundariesX[14] && w.walterX<furnitureBoundariesX[15]) //if Walter is at the top boundary of the left chair
      w.walterY-=w.wSpeedY; //Walter cannot move upwards
    else if (w.walterY>furnitureBoundariesY[9] && w.walterY<furnitureBoundariesY[9]+hr.increaseBoundariesY[0] && w.walterX>furnitureBoundariesX[14] && w.walterX<furnitureBoundariesX[15]) //if Walter is at the right boundary of the left chair
      w.walterY+=w.wSpeedY; //Walter cannot move downwards
  }

  void chairRBoundaries() { //sets movement boundaries for Walter around the right chair
    if (w.walterX>furnitureBoundariesX[16] && w.walterX<furnitureBoundariesX[16]+hr.increaseBoundariesX[0] && w.walterY>furnitureBoundariesY[8] && w.walterY<furnitureBoundariesY[9]) //if Walter is at the left boundary of the right chair
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<furnitureBoundariesX[17] && w.walterX>furnitureBoundariesX[17]-hr.increaseBoundariesX[0] && w.walterY>furnitureBoundariesY[8] && w.walterY<furnitureBoundariesY[9]) //if Walter is at the right boundary of the right chair
      w.walterX += w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<furnitureBoundariesY[8] && w.walterY>furnitureBoundariesY[8]-hr.increaseBoundariesY[0] && w.walterX>furnitureBoundariesX[16] && w.walterX<furnitureBoundariesX[17]) //if Walter is at the top boundary of the right chair
      w.walterY-=w.wSpeedY; //Walter cannot move upwards
    else if (w.walterY>furnitureBoundariesY[9] && w.walterY<furnitureBoundariesY[9]+hr.increaseBoundariesY[0] && w.walterX>furnitureBoundariesX[16] && w.walterX<furnitureBoundariesX[17]) //if Walter is at the bottom boundary of the right chair
      w.walterY+=w.wSpeedY; //Walter cannot move downwards
  }

  void seatBoundaries() { //sets movement boundaries for Walter around the seat
    if (w.walterX>furnitureBoundariesX[18] && w.walterX<furnitureBoundariesX[18]+hr.increaseBoundariesX[0] && w.walterY>furnitureBoundariesY[10] && w.walterY<furnitureBoundariesY[11]) //if Walter is at the left boundary of the seat
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<furnitureBoundariesX[19] && w.walterX>furnitureBoundariesX[19]-hr.increaseBoundariesX[0] && w.walterY>furnitureBoundariesY[10] && w.walterY<furnitureBoundariesY[11]) //if Walter is at the right boundary of the seat
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<furnitureBoundariesY[10] && w.walterY>furnitureBoundariesY[10]-hr.increaseBoundariesY[0] && w.walterX>furnitureBoundariesX[18] && w.walterX<furnitureBoundariesX[19]) //if Walter is at the top boundary of the seat
      w.walterY-=w.wSpeedY; //Walter cannot move upwards
    else if (w.walterY>furnitureBoundariesY[10] && w.walterY<furnitureBoundariesY[11]+hr.increaseBoundariesY[0] && w.walterX>furnitureBoundariesX[18] && w.walterX<furnitureBoundariesX[19]) //if Walter is at the bottom boundary of the seat
      w.walterY+=w.wSpeedY; //Walter cannot move downwards
  }

  void chairSit() { //allows Walter to sit in the two chairs by the fireplace
    if ((w.walterX>furnitureBoundariesX[16]-hr.increaseBoundariesX[0]*2 && w.walterX<furnitureBoundariesX[17]+hr.increaseBoundariesX[0]*2 && w.walterY>furnitureBoundariesY[8]-hr.increaseBoundariesY[0]*2 && w.walterY<furnitureBoundariesY[9]+hr.increaseBoundariesY[0]*2) || (w.walterX>furnitureBoundariesX[14]-hr.increaseBoundariesX[0]*2 && w.walterX < furnitureBoundariesX[15]+hr.increaseBoundariesX[0]*2 && w.walterY>furnitureBoundariesY[8]-hr.increaseBoundariesY[0]*2 && w.walterY<furnitureBoundariesY[9]+hr.increaseBoundariesY[0]*2)) { //if Walter is beside either of the chairs
      if (key=='e') { //if 'e' is pressed
        w.sit=true; //Walter is sitting
        if (w.walterX>furnitureBoundariesX[15]+hr.increaseBoundariesX[0]*2) //if Walter is to the left of
          image(w.walterSitL1, 0, 0, width, height); //displays Walter sitting facing left
        else
          image(w.walterSitR1, 0, 0, width, height); //displays Walter sitting facing right
      } else
        w.sit=false; //Walter is not sitting
    }
  }

  void leave() { //allows Walter to leave the living room
    if (w.walterY>boundariesY[1] || w.walterY<boundariesY[0] || (w.walterX>boundariesX[2] && w.walterX<boundariesX[3] && w.walterY<boundariesY[4])) { //if Walter is below the bottom boundary or above the top boundary of the living room
      noMove=true; //Walter cannot move
      increaseTransparency=true; //a transition begins
      blackTransition=true; //the black transition begins
    }
    if (w.walterY>boundariesY[1]) //if Walter is outside of the bottom living room boundary
      changeOutside=true; //the screen is to be changed to the outside

    if (w.walterY<boundariesY[0]) //if Walter is outside of the upper living room boundary
      changeKitchen=true; //the screen is to be changed to the kitchen

    if ( w.walterX>boundariesX[2] && w.walterX<boundariesX[3] && w.walterY<boundariesY[4]) //if Walter is above the hall boundary
      changeHall=true; //the screen is to be changed to the hall
  }

  void come() { //allows Walter to return to the living room
    if (displayOutside) //if the outside is displayed
      w.walterY = height/3*2; //Walter is just above the outside door

    if (displayHall) { //if the outside is displayed
      w.walterX=width*1645/1920; //Walter is in the stairway
      w.walterY=height*480/1080; //Walter is just below the top of the stairs
    }

    if (displayKitchen) //if the kitchen is displayed
      w.walterY=height*300/1080; //Walter is just below the door to the kitchen
  }
}
