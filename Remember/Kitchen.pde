class Kitchen {
  PImage kitchen; //image of the kitchen

  Kitchen() {
    kitchen=loadImage("kitchen.png");
  }
  
  void display() {
    image(kitchen,0,0,width,height);
  }
}
