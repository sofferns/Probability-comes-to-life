
 int runs = 1600;
 int range = 1;
 float EX = (range)*0.5;
 int interval = 3;
 int res = 12;
 float sigma = range/sqrt(12);
 int min = 0;
 int max = 0;
 int last = 0;
 int minimum = 0;
 int maximum = 0;
 int size = round((runs*range)/(sqrt(runs)*sigma/res)) + 3;

  int amount;
  String exp = " מה שאתם רואים זו הדגמה של משפט הגבול המרכזי ";
 
 class game{
   
void calc(){}
void display(){}
void again(){}

}
class tile{
color standart;
boolean blue;
boolean path = false;
int across = 0;
tile down;
tile left;
tile right;
  tile(){
  float det = random(0,1);
  if(det >= 0.625){
    blue = false;
    standart = color(100);
  }
  else  {
 standart = color(255,165,0);
 blue = true;
  }
}

}
class group{
  
  
  
  
}

class steps extends game{
tile tab[][] = new tile[200][200];
int s = 0;
int paths = 0;
int rock = 0;
int water = 0;
void Draw(int i,int j){
  strokeWeight(1);
  stroke(tab[i][j].standart);
fill(tab[i][j].standart);
rect(i*height/200 + (width - height)/2,j*height/200,height/200,height/200);
}



void calcB(){

for(int x = 0; x < 40000; x++){

     if(tab[x%200][int(x/200)].blue == true){
                  if(int(x/200) < 199 && tab[x%200][int(x/200)+1].blue == true){
     tab[x%200][int(x/200)].down = tab[x%200][int(x/200)+1];

     }
          if(x%200 > 0 && tab[(x-1)%200][int(x/200)].blue == true){
   tab[x%200][int(x/200)].left = tab[(x-1)%200][int(x/200)];
   }
             if(x%200 < 199 && tab[(x+1)%200][int(x/200)].blue == true){
   tab[x%200][int(x/200)].right = tab[(x+1)%200][int(x/200)];
   }
   tab[x%200][int(x/200)].across =int(x/200);
    
   if(tab[x%200][int(x/200)].across == 0){
    tab[x%200][int(x/200)].path = true;

}
}

}
}

void display(){
  fill(0);
  text("סלע: "+ rock,width - 100, 50);
  text("אדמה: "+ paths,width - 100, 100);
  text("מים: "+ water,width - 100, 150);
      for(int y = 0 ; y < s ; y++){
if(tab[y%200][int(y/200)].path == true){
  tab[y%200][int(y/200)].standart = color(0,100,255);
    if(tab[y%200][int(y/200)].down!=null &&tab[y%200][int(y/200)].path == true){
  tab[y%200][int(y/200)].down.path = true;
  tab[y%200][int(y/200)].down.standart =tab[y%200][int(y/200)].standart;
  }
  if(tab[y%200][int(y/200)].left!=null &&tab[y%200][int(y/200)].path == true){
  tab[y%200][int(y/200)].left.path = true;
  tab[y%200][int(y/200)].left.standart =tab[y%200][int(y/200)].standart;
  }
    if(tab[y%200][int(y/200)].right!=null &&tab[y%200][int(y/200)].path == true){
  tab[y%200][int(y/200)].right.path = true;
  tab[y%200][int(y/200)].right.standart =tab[y%200][int(y/200)].standart;
  }
}
      }
for(int z = 0; z < s; z++){
Draw(z%200,int(z/200));
  }
}

void again(){
  s = 0;
  rock = 0;
  paths = 0;
  water = 0;
for(int i= 0; i < 200; i++){
  for(int j= 0; j < 200; j++){
    tab[i][j] = new tile();
  }
}
this.calcB();
}
void calc(){
  if(s <= 39999){
      if(tab[s%200][int(s/200)].blue == false){
    rock = rock + 1;
    
  }
    if(s%200 > 0 && tab[(s-1)%200][int((s-1)/200)].blue == false){
    rock = rock + 1;
  }
        if(tab[s%200][int(s/200)].path == true){
    water = water + 1;
  }
    if(s%200 > 0 && tab[(s-1)%200][int((s-1)/200)].path == true){
    water = water + 1;
  }
  paths = s + 2 - rock - water;
    s = s + 2;

  }
}
}

  
 class Rwalk extends game{
   int step = 0;
   int walk = 0;
   int fc = 1;
   float move = 0;
   float pos = width/2 - width/128;
   boolean draw = true;
   float Rate = frameRate/16;
   int steps = 0;
 void again(){
   steps = 0;
   walk = 0;
   fc = 1;
   pos = width/2 - width/128;
   draw = true;
 }
 void display(){
  fill(0);
  text("מספר צעדים : " + steps , width - 100, 50); 
  text("תוחלת מספר צעדים : 1024 , סטיית תקן 835.68", width - 100, 700);
  textSize(12);
  for(int i = -32; i < 33; i++){
  text(i, width/2 - width/128 + i * (width/64), height/2 - width/128 + 40);    
    
  }
  stroke(0);
strokeWeight(2);
  line(0,height/2 - width/128 + 27,width,height/2 - width/128 + 25);
  textSize(32);
   if(draw){
 if( fc >= Rate ){
 steps = steps + 1;
 fc = 1;
 walk = walk + step;
 move = 0;
 pos = width/2 - width/128 + walk * (width/64); 
 draw = pos > - width/128 && pos < width - width/128;
 step = 2 *int (random(2)) -1;
 }
if(step == 1 ){
stroke(0);
strokeWeight(5);
line(width/2,height/8,width/2+100,height/8);
triangle(width/2+100,height/8-5,width/2+100,height/8+5,width/2+100+8.66,height/8);
move = move + width/(64*Rate);  
}
if(step == -1){
stroke(0);
strokeWeight(5);
line(width/2,height/8,width/2-100,height/8);
triangle(width/2-100,height/8-5,width/2-100,height/8+5,width/2-100-8.66,height/8);
move = move - width/(64*Rate);  
}
  fc = fc + 1;
   }
   else{
       fill(0,0,255);
   text("סוף", width/2 + 32, 100);  
     
   }
  fill(255, 0 , 0);
  stroke(0);
  strokeWeight(2);
  rect(pos + move, height/2 - width/128, width/64, width/64); ;
 }
 }
 

 class diagram {
 public
 
 diagram next;
 float sum = 0;

diagram(){
 sum = 0;
 for(int i = 1 ; i <= runs ; i++ ){
   float ran =random(0,range);
   sum = sum + ran;
   }
   sum = sum - runs*EX;
   sum = sum / ((sqrt(runs)*sigma)/res);
 
         
 }
void addnext(int times,int d[]){
  diagram curr = this;
  amount = times;
for(int i = 1; i < amount; i++){
     curr.next = new diagram();
   
   if(d[0] > floor(curr.sum + 0.5)){
   d[0] = floor(curr.sum + 0.5);
   }
    if(d[1] < floor(curr.sum + 0.5)){
   d[1] = floor(curr.sum + 0.5); 
    }
curr = curr.next;
}
}

  void ToArray(diagram[] arr){
    diagram curr = this;
    for(int i = 0; i < amount ; i++){
arr[i] = curr;
if(curr.next != null){
curr= curr.next;
}
    }
 }
 }
class columns extends game{
 boolean add = true;
 int Size;
 float gova[];
 int move;
 int moveY = height - height/10;
 diagram used;
 diagram arr2[];
 boolean cr = true;
 int rounds = 18000;
 int devs[];
  int samples = 0;

 void create(){
 used = null;
 devs = new int[2];
 used = new diagram();
 used.addnext(rounds,devs);
 arr2 = new diagram[rounds];
 used.ToArray(arr2);
 Size = 2*max(abs(devs[0]) , abs(devs[1])) + 1;
gova = new float[Size];
move = (width/2 -(this.Size/2)*15); 
}
 void play(){
     fill(255,150,0);
     text("דגימות: "+samples,width/4, 100);
     stroke(0);
     strokeWeight(2);
     line(width - textWidth(exp) - 118,109,width - 75 , 109);
     noStroke();
     text(exp, width - 100, 100);
     
  }
  void graph(){
    
     noFill();
     strokeWeight(2);
     stroke(255,0,0);
    beginShape();
     for(int x = move ; x <= (this.Size-1)*15 + 10 + move ; x++){
     int dev = max(abs(devs[0]),abs(devs[1]));
     float gauss = map(x , move , (this.Size-1)*15 + 10 + move , -dev , dev); 
     float calc  = 299*exp(-sq(gauss)/(2*sq(res)));
     float screen = map(calc,0,299, moveY , moveY - 299);
     vertex(x,screen);
       }
       endShape();
  }
  void calc(){
 float fix = 0;
 if(cr){
 this.create();
 this.cr =false;
 
 }
 if(add){
if (samples > rounds - 1){
     add = false;
 }
       if(add){
     fix = arr2[samples].sum + 0.5;
   gova[this.Size/2 + floor(fix)] = gova[this.Size/2 + floor(fix)] + 0.5;
samples = samples + 1;

   }
}  
  }
  void display(){
    if(this.cr == false){
    if(add == false){
    this.graph();
  } //<>//
for(int j = 0; j < this.Size; j++){
              fill(100,255,100);
              noStroke();
      rect(15*j + move ,  moveY , 10 , - gova[j] );    
        } 
          this.play();
    }
    }
    void again(){
     this.cr =true;
     this.gova = null;
     this.samples = 0;
     this.add = true;
    }
}

class choice {
game Games[];
game chosen;
int Play = -1;
choice() {
Games = new game [3];
Games[0] = new columns();
Games[1] = new Rwalk();
Games[2] = new steps();
}

void toPlay(){
   fill(0);
  text(" פעמון גאוס " , width/2 + 77, 310);
  text(" הילוך מקרי " , width/2 + 77, 410);
  text(" חלחול " , width/2 + 47, 510);
  noFill();
  stroke(0);
  strokeWeight(2);
  rect(width/2 - 120, 268, 240, 64);
  rect(width/2 - 120, 368, 240, 64);
  rect(width/2 - 120, 468, 240, 64);
  if(mousePressed && mouseButton == LEFT && mouseX > width/2 - 120 && mouseX < width/2 + 120 && mouseY > 268 && mouseY < 332){
   chosen = Games[0];
   chosen.again();
   this.Play = 0;
  }
  if(mousePressed && mouseButton == LEFT && mouseX > width/2 - 120 && mouseX < width/2 + 120 && mouseY > 368 && mouseY < 432){
chosen = Games[1];
chosen.again();
this.Play = 1;
}
  if(mousePressed && mouseButton == LEFT && mouseX > width/2 - 120 && mouseX < width/2 + 120 && mouseY > 468 && mouseY < 532){
chosen = Games[2];
chosen.again();
this.Play = 2;
}


}
void Switch() {
  if(mouseButton == RIGHT){
    this.Play = -1;
   
    
  }
  
  
}
}
