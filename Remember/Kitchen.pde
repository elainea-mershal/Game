class Kitchen {
  PImage kitchen; //image of the kitchen
  PImage cleanKitchen; //image of the clean kitchen

  int kitchenCounter; //counter to display the kitchen

  Kitchen() {
    kitchen=loadImage("kitchen.png");
    cleanKitchen=loadImage("cleanKitchen.png");
  }

  void display() { //displays the kitchen
    if (kitchenCounter==1) //if the kitchen is displayed for the first time
      image(kitchen, 0, 0, width, height); //display the kitchen
    else
      image(cleanKitchen, 0, 0, width, height); //display the clean kitchen
  }

  void come() { //changes Walter's position when he comes the the kitchen
    if (changeKitchen) //if the screen is to be changed to the kitchen
      w.walterY=height/3*2; //Walter is just above the living room door
  }
}
