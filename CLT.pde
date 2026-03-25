
choice set;
PFont hebrew;
void setup(){
  fullScreen();
  hebrew = createFont("Arial",32);
  textFont(hebrew);
  textAlign(RIGHT);
  set = new choice();
  thread("updateLogic");


}
void updateLogic(){

while(true){
  set.Switch();
    if(set.Play == 0){
set.chosen.calc();  
  }
  delay(1);  
}

  }

void draw(){
background(255);
if(set.Play == -1){
  set.toPlay();
}
if(set.Play > -1){
set.chosen.display();
  }
}
