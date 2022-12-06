class LivingRoom {
  PImage livingRoom; //image of the living room

  LivingRoom() {
    livingRoom = loadImage("theroom.png");
  }

  void displayLR() { //displays the living room
    image(livingRoom, 0, 0); //draws the living room background
  }
}
