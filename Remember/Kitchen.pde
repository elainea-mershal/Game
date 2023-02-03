class Kitchen {
  PImage kitchen; //image of the kitchen
  PImage cleanKitchen; //image of the clean kitchen

  float[] boundariesX=new float[] {455, 1410}; //left and right kitchen boundaries
  float[] boundariesY=new float[] {200, 820}; //up and down kitchen boundaries
  float[] bDoorX=new float[] {1137, 1161}; //left and right backyard door boundaries
  float[] lrDoorX=new float[] {910, 946}; //left and right living room door boundaries
  float[] counterX=new float[]  {845, 550, 845, 775}; //left and right counter boundaries
  float[] counterY=new float[] {380, 495, 285, 440}; //up and down counter boundaries
  float[] cupboardX=new float[] {876, 490}; //left and right cupboard boundaries
  float[] cupboardY=new float[] {230, 550}; //up and down cupbouard boundaries
  float[] cabinetX=new float[] {1056, 900}; //left and right cabinet boundaries
  float[] cabinetY=new float [] {245, 0}; //up and down cabinet boundaries
  float[] plantShelfX=new float [] {1410, 1270}; //left and right plant boundaries
  float[] plantShelfY=new float [] {225, 0}; //up and down plant boundaries
  float[] tableX=new float [] {1336, 1190}; //left and right table boundaries
  float[] tableY= new float [] {468, 570}; //up and down table boundaries
  float[] chairsX= new float [] {1300, 1220, 1250, 1140, 1300, 1223, 1390, 1260}; //left and right chair boundaries
  float[] chairsY= new float [] {383, 497, 485, 560, 536, 637, 485, 555}; //up and down chair boundaries

  int kitchenCounter; //counter to display the kitchen

  Kitchen() {
    kitchen=loadImage("kitchen.png");
    cleanKitchen=loadImage("cleanKitchen.png");

    for (int index=0; index<boundariesX.length; index++) { //index variable has an initial value of 0, must be less than the length of boundariesX array, and increases by increments of 1
      boundariesX[index]=map(boundariesX[index], 0, 1920, 0, width);
      boundariesY[index]=map(boundariesY[index], 0, 1080, 0, height);
      bDoorX[index]=map(bDoorX[index], 0, 1920, 0, width);
      lrDoorX[index]=map(lrDoorX[index], 0, 1920, 0, width);
      cupboardX[index]=map(cupboardX[index], 0, 1920, 0, width);
      cupboardY[index]=map(cupboardY[index], 0, 1080, 0, height);
      cabinetX[index]=map(cabinetX[index], 0, 1920, 0, width);
      cabinetY[index]=map(cabinetY[index], 0, 1080, 0, height);
      plantShelfX[index]=map(plantShelfX[index], 0, 1920, 0, width);
      plantShelfY[index]=map(plantShelfY[index], 0, 1080, 0, height);
    }

    for (int index=0; index<counterX.length; index++) { //index variable has an initial value of 0, must be less than the length of counterX array, and increases by increments of 1
      counterX[index]=map(counterX[index], 0, 1920, 0, width);
      counterY[index]=map(counterY[index], 0, 1080, 0, height);
    }

    for (int index=0; index<chairsX.length; index++) { //index variable has an initial value of 0, must be less than the length of chairsX array, and increases by increments of 1
      chairsX[index]=map(chairsX[index], 0, 1920, 0, width);
      chairsY[index]=map(chairsY[index], 0, 1080, 0, height);
    }
  }

  void display() { //displays the kitchen
    if (kitchenCounter==1) //if the kitchen is displayed for the first time
      image(kitchen, 0, 0, width, height); //display the kitchen
    else
      image(cleanKitchen, 0, 0, width, height); //display the clean kitchen
  }

  void boundaries() { //sets movement boundaries for Walter in the kitchen
    if (w.walterX<boundariesX[0]) //if Walter is outside of the left kitchen boundary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    if (w.walterX>boundariesX[1]) //if Walter is outside of the right kitchen boundary
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    if (w.walterY<boundariesY[0]) { //if walter is outside of the top kitchen boundary
      if (w.walterX<bDoorX[0] || w.walterX>bDoorX[1]) //if Walter is outside of the backyard door boundaries
        w.walterY+=w.wSpeedY; //Walter cannot move upwards
    }
    if (w.walterY>boundariesY[1]) { //if Walter is outside of the bottom kitchen boundary
      if (w.walterX<lrDoorX[0] || w.walterX>lrDoorX[1]) //if Walter is outside of the living room door boundaries
        w.walterY-=w.wSpeedY; //Walter cannot move downwards
    }
  }

  void counterBoundaries() { //sets movement boundaries around the counter
    if (w.walterY>counterY[1] && w.walterY<counterY[1]+hr.increaseBoundariesY[0] && w.walterX>counterX[1] && w.walterX<counterX[0]) //if Walter is at the lower counter boundary
      w.walterY+=w.wSpeedY; //Walter cannot move up
    else if (w.walterY<counterY[0] && w.walterY>counterY[0]-hr.increaseBoundariesY[0] && w.walterX>counterX[1] && w.walterX<counterX[0]) //if Walter is at the upper counter boundary
      w.walterY-=w.wSpeedY; //Walter cannot move down
    else if (w.walterX>counterX[1]-hr.increaseBoundariesX[0] && w.walterX<counterX[1] && w.walterY<counterY[1] && w.walterY>counterY[0]) //if Walter is at the left counter boundary
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<counterX[0]+hr.increaseBoundariesX[0] && w.walterX>counterX[0] && w.walterY<counterY[1] && w.walterY>counterY[0]) //if Walter is at the right counter boundary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterX>counterX[3]-hr.increaseBoundariesX[0] && w.walterX<counterX[3] && w.walterY<counterY[3] && w.walterY>counterY[2]) //if Walter is at the left counter boudary
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX<counterX[2]+hr.increaseBoundariesX[0] && w.walterX>counterX[2] && w.walterY<counterY[3] && w.walterY>counterY[2]) //if Walter is at the right counter boundary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<counterY[2] && w.walterY>counterY[2]-hr.increaseBoundariesY[0] && w.walterX>counterX[3] && w.walterX<counterX[2]) //if Walter is at the upper counter boundary
      w.walterY-=w.wSpeedY; //Walter cannot move down
  }

  void cupboardBoundaries() { //sets movement boundaries around the cupboard
    if (w.walterY<cupboardY[0] && w.walterX>0 && w.walterX<cupboardX[0]) //if Walter is at the lower cupboard boundary
      w.walterY+=w.wSpeedY; //Walter cannot move up
    else if (w.walterX<cupboardX[0]+hr.increaseBoundariesX[0] && w.walterX>cupboardX[0] && w.walterY<cupboardY[0]) //if Walter is at the right cupboard boundary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterX<cupboardX[1]+hr.increaseBoundariesX[0] && w.walterX>cupboardX[1] && w.walterY<cupboardY[1]) //if Walter is at the right cupboard boundary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<cupboardY[1] && w.walterY>cupboardY[1]-hr.increaseBoundariesY[0] && w.walterX>0 && w.walterX<cupboardX[1]) //if Walter is at the lower cupboard boundary
      w.walterY+=w.wSpeedY; //Walter cannot move up
  }

  void tableBoundaries() { //sets movement boundaries around the table
    if (w.walterY<tableY[1] && w.walterY>tableY[1]-hr.increaseBoundariesY[0] && w.walterX>tableX[1] && w.walterX<tableX[0]) //if Walter is at the lower table boundary
      w.walterY+=w.wSpeedY; //Walter cannot move up
    else if (w.walterY<tableY[0] && w.walterY>tableY[0]-hr.increaseBoundariesY[0] && w.walterX>tableX[1] && w.walterX<tableX[0]) //if Walter is at the upper table boundary
      w.walterY-=w.wSpeedY; //Walter cannot move down
    else if (w.walterX<tableX[0]+hr.increaseBoundariesX[0] && w.walterX>tableX[0] && w.walterY<tableY[1] && w.walterY>tableY[0]) //if Walter is at the right table boundary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterX>tableX[1]-hr.increaseBoundariesX[0] && w.walterX<tableX[1] && w.walterY<tableY[1] && w.walterY>tableY[0]) //if Walter is at the left table boundary
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
  }

  void chairBoundaries() { //sets movement boundaries around the chairs
    if (w.walterY<chairsY[3] && w.walterY>chairsY[3]-hr.increaseBoundariesY[0] && w.walterX>chairsX[3] && w.walterX<chairsX[2]) //if Walter is at a lower chair boundary
      w.walterY+=w.wSpeedY; //Walter cannot move up
    else if (w.walterY<chairsY[5] && w.walterY>chairsY[5]-hr.increaseBoundariesY[0] && w.walterX>chairsX[5] && w.walterX<chairsX[4]) //if Walter is at a lower chair boundary
      w.walterY+=w.wSpeedY; //Walter cannot move up
    else if (w.walterY<chairsY[7] && w.walterY>chairsY[7]-hr.increaseBoundariesY[0] && w.walterX>chairsX[7] && w.walterX<chairsX[6]) //if Walter is at a lower chair boundary
      w.walterY+=w.wSpeedY; //Walter cannot move up
    else if (w.walterY<chairsY[0] && w.walterY>chairsY[0]-hr.increaseBoundariesY[0] && w.walterX>chairsX[1] && w.walterX<chairsX[0]) //if Walter is at an upper chair boundary
      w.walterY-=w.wSpeedY; //Walter cannot move down
    else if (w.walterY<chairsY[2] && w.walterY>chairsY[2]-hr.increaseBoundariesY[0] && w.walterX>chairsX[3] && w.walterX<chairsX[2]) //if Walter is at an upper chair boundary
      w.walterY-=w.wSpeedY; //Walter cannot move down
    else if (w.walterY<chairsY[6] && w.walterY>chairsY[6]-hr.increaseBoundariesY[0] && w.walterX>chairsX[7] && w.walterX<chairsX[6]) //if Walter is at a lower chair boudnary
      w.walterY-=w.wSpeedY; //Walter cannot move down
    else if (w.walterX<chairsX[0]+hr.increaseBoundariesX[0] && w.walterX>chairsX[0] && w.walterY<chairsY[1] && w.walterY>chairsY[0]) //if Walter is at a right chair boundary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterX<chairsX[4]+hr.increaseBoundariesX[0] && w.walterX>chairsX[4] && w.walterY<chairsY[5] && w.walterY>chairsY[4]) //if Walter is at a right chair boundary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterX<chairsX[6]+hr.increaseBoundariesX[0] && w.walterX>chairsX[6] && w.walterY<chairsY[7] && w.walterY>chairsY[6]) //if Walter is at a right chair boundary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterX>chairsX[1]-hr.increaseBoundariesX[0] && w.walterX<chairsX[1] && w.walterY<chairsY[1] && w.walterY>chairsY[0]) //if Walter is at a left chair boundary
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX>chairsX[3]-hr.increaseBoundariesX[0] && w.walterX<chairsX[3] && w.walterY<chairsY[3] && w.walterY>chairsY[2]) //if Walter is at a left chair boundary
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterX>chairsX[5]-hr.increaseBoundariesX[0] && w.walterX<chairsX[5] && w.walterY<chairsY[5] && w.walterY>chairsY[4]) //if Walter is at a left chair boundary
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
  }

  void miscellaneousBoundaries() { //sets movement boundaries around various other objects
    if (w.walterX<cabinetX[0]+hr.increaseBoundariesX[0] && w.walterX>cabinetX[0] && w.walterY<cabinetY[0]) //if Walter is at the right cabinet boundary
      w.walterX+=w.wSpeedX; //Walter cannot move to the left
    else if (w.walterY<cabinetY[0] && w.walterY>cabinetY[0]-hr.increaseBoundariesY[0] && w.walterX>cabinetX[1] && w.walterX<cabinetX[0]) //if Walter is at the lower cabinet boundary
      w.walterY+=w.wSpeedY; //Walter cannot move up
    else if (w.walterX>cabinetX[1]-hr.increaseBoundariesX[0] && w.walterX<cabinetX[1] && w.walterY<cabinetY[0] && w.walterY>cabinetY[1]) //if Walter is at the left cabinet boundary
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
    else if (w.walterY<plantShelfY[0] && w.walterY>plantShelfY[0]-hr.increaseBoundariesY[0] && w.walterX>plantShelfX[1] && w.walterX<plantShelfX[0]) //if Walte ris at the lower plant shelf boundary
      w.walterY+=w.wSpeedY; //Walter cannot move up
    else if (w.walterX>plantShelfX[1]-hr.increaseBoundariesX[0] && w.walterX<plantShelfX[1] && w.walterY<plantShelfY[0] && w.walterY>plantShelfY[1]) //if Walter is at the left plant shelf boundary
      w.walterX-=w.wSpeedX; //Walter cannot move to the right
  }

  void leave() { //allows Walter to leave the kitchen
    if (w.walterY<boundariesY[0] || w.walterY>boundariesY[1]) { //if Walter is above the top boundary or below the bottom boundary
      noMove=true; //Walter cannot move
      increaseTransparency=true; //a transition begins
      blackTransition=true; //the black transition begins
    }
    if (w.walterY<boundariesY[0]) //if Walter is above the top boundary
      changeBackyard=true; //the screen is to be changed to the backyard

    if (w.walterY>boundariesY[1]) //if Walter is below the bottom boundary
      changeLR=true; //the screen is to be changed to the living room
  }

  void come() { //changes Walter's position when he comes the the kitchen
    w.walterX=width/2-w.walterW; //Walter is in the middle of the screen
    w.walterY=height/3*2; //Walter is just above the living room door
  }
}
