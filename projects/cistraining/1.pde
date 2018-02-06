/* @pjs preload="0.jpg,1.jpg,2.jpg,3.jpg,4.jpg,5.jpg,6.jpg,7.jpg,8.jpg,9.jpg,10.jpg,11.jpg,12.jpg,13.jpg,14.jpg,15.jpg,16.jpg,17.jpg,18.jpg,19.jpg,20.jpg,21.jpg,22.jpg, 23.jpg, 24.jpg, 25.jpg, 26.jpg, 27.jpg, 28.jpg, 29.jpg, 30.jpg, 31.jpg, 32.jpg, 33.jpg, 34.jpg";*/

interface JavaScript{
}
void bindJavascript(Javascript js){
  javascript=js;
}

pic[] picture= new pic[35];
String[] PICTITLE= new String[35];
String[] text3= new String[15];
int alphagreen, alphared, counter;
int whichpic, whichwords;
JavaScript javascript;

void setup(){
  size(500,300);
  background(0);
  alphagreen=0;
  alphared=0;
  counter= 0;
  whichpic= int(random(0,34));
  whichwords= int(random(0,10));
  text3[0]= "neither";
  text3[1]= "your guess is wrong";
  text3[2]= "no way to know";
  text3[3]= "both";
  text3[4]= "it's complicated";
  text3[5]= "only they know";
  text3[6]= "rude to assume";
  text3[7]= "doesn't matter";
  text3[8]= "no assumption here";
  text3[9]= "gender is fake";
  text3[10]="what is 'man'";
  text3[11]="mind your business";
  text3[12]="why do you care";
  text3[13]="fuck the binary";
  text3[14]="abolish the binary";
  
  for(int i=0; i<35; i=i+1){
    PICTITLE[i]= i+".jpg";
  }
  for(int i=0; i<35; i=i+1){
    picture[i]= new pic(PICTITLE[i]);
  }
  
}

void draw(){
  picture[whichpic].makepic();
  counter=counter+1;
  
  fill(255);
  rect(60,210,100,50);
  rect(200,210,100,50);
  rect(340,210,100,50);
  textAlign(CENTER,CENTER);
  textSize(20);
  fill(0);
  text("MAN",110,235);
  text("WOMAN",250,235);
  textSize(10);
  text(text3[whichwords], 390, 235);
  
  fill(255,0,0,alphared);
  rect(0,0,width,height);
  
  fill(0,255,0,alphagreen);
  rect(0,0,width,height);
  
  if (mousePressed){
    counter=0;
    if((mouseY>210)&&(mouseY<260)){
       if((mouseX>60)&&(mouseX<160)){//first
          alphared=255;
        }
      if((mouseX>200)&&(mouseX<300)){//second
        alphared=255;
      }
      if((mouseX>340)&&(mouseX<440)){
        alphagreen=255;
        if(whichpic==34){
          whichpic=0;
        }else{
        whichpic=whichpic+1;
        }
        if(whichwords==14){
          whichwords=0;
        }else{
        whichwords=whichwords+1;
        }
        }
        }
  }
  if (counter==5){
   alphagreen=0;
   alphared=0;
  }
}//end of draw loop




class pic{
  PImage portrait;
  String name;
  
  pic(String _name){
    name= _name;
  }
  
  void makepic(){
    background(0);
    portrait=loadImage(name);
    imageMode(CENTER);
    portrait.resize(0,150);
    image(portrait,width/2,100);
  }
}
   