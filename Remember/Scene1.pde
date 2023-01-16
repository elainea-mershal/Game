class Scene1 {
  int walterY1; //Walter's first y position

  Scene1() {
    walterY1=height*460/1080;
  }

  void playScene1() { //plays the first scene
    noMove=true; //Walter cannot move
    if (w.walterY>walterY1) { //if Walter is lower than walterY1
      w.wPressed=true; //Walter is to move upwards
      w.idle=false; //Walter is not idle
      w.walterY-=w.wSpeed/2; //Walter moves upwards
    } else {
      w.wPressed=false; //Walter is no longer going to move up
      w.idle=true; //Walter is idle
    }
    if (w.walterY==walterY1) //if Walter is at walterY1
      w.wasdKey=2; //Walter faces left
  }
}
