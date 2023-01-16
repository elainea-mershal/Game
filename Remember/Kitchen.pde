class Kitchen {
  PImage kitchen; //image of the kitchen
  
  int walterPos1Y;
  int kitchenCounter;

  Kitchen() {
    kitchen=loadImage("kitchen.png");
    walterPos1Y=height*460/1080;
  }
  
  void display() {
    if(kitchenCounter==1)
    image(kitchen,0,0,width,height);
  }
  
  void scene1() {
    noMove=true;
    if(w.walterY>walterPos1Y) {
    w.wPressed=true;
    w.idle=false;
    w.walterY-=w.wSpeed/2; //Walter moves upwards
    }
    else {
      w.wPressed=false;
      w.idle=true;
    }
    if(w.walterY==walterPos1Y)
    w.wasdKey=2;
  }
  
  void come() {
    if(changeKitchen)
    w.walterY=height/3*2;
  }
}
