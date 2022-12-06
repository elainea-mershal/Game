class LivingRoom {
  PImage livingRoom;

  LivingRoom() {
    livingRoom = loadImage("theroom.png");
  }

  void displayLR() {
    image(livingRoom, 0, 0);
  }
}
