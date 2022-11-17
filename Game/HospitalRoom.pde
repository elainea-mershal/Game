class HospitalRoom {
  PImage hospitalRoom; //image of the hospital room

  HospitalRoom() {
    hospitalRoom=loadImage("hospitalRoom.png");
  }

  void displayHR() {
    image(hospitalRoom, 0, 0); //draws the hospital room background
  }

  void brownNoise () {
    hrNoise.play(); //plays the noise for the hospital room
    hrNoise.loop(); //when the hospital room noise ends, it starts playing again
    hrNoise.amp(0.25); //lowers the volume of the hospital room noise to a quarter of its volume
  }
}
