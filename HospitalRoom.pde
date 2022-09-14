class HospitalRoom {
  PImage hospitalRoom; //image of the hospital room

  HospitalRoom() {
    hospitalRoom=loadImage("hospitalRoom.png");
  }

  void displayHR() {
    image(hospitalRoom, 0, 0); //draws the hospital room background
  }
}
