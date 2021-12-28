//front end vars
String pacDir="left";
String pacMDir="left";
boolean mouthOpen = true;
float pacX=14*pixelsPerTile, pacY=26*pixelsPerTile+pixelsPerTile/2; //15 & 27
int xTile, yTile;
float pacSpe=1.5;
int livesRem=2;
boolean[] fruitsShown = {false,false};
boolean showFruit = false;
boolean showFruitText = false;
int fruitScoreGain=0;
int highScore=0;
//back end vars
boolean lPress, rPress, uPress, dPress;
boolean canL, canR, canU, canD;
boolean gotExtraLife = false;
int fruitTimer=0;
int fruitTextTimer=0;
int dotsEaten=0;
int mouthTimer = 0;
int ghostsEaten = 0;
int[][] ghostEatText ={ //time, x, y
  {0,0,0},
  {0,0,0},
  {0,0,0},
  {0,0,0}
};

void drawPac(){
  fill(255,255,0);
  ellipse(pacX, pacY, pixelsPerTile*1.2, pixelsPerTile*1.2);
  
  float pacW = pixelsPerTile*1.2;
  
  if(pacDir=="none" || mode=="load" || freezeTimer!=0){ mouthOpen=true; }
  
  fill(0,0,0);
    if(pacMDir=="left" && mouthOpen==true){
      arc(pacX+3, pacY, pacW+8, pacW+2, 3*PI/4, 5*PI/4); }
    else if(pacMDir=="right" && mouthOpen==true){
      arc(pacX-3, pacY, pacW+8, pacW+2, 7*PI/4, 9*PI/4); }
    else if(pacMDir=="up" && mouthOpen==true){
       arc(pacX, pacY+3, pacW+2, pacW+8, 5*PI/4, 7*PI/4); }
    else if(pacMDir=="down" && mouthOpen==true){
      arc(pacX, pacY-3, pacW+2, pacW+8, PI/4, 3*PI/4); }
  
  mouthTimer++;
  if(mouthTimer>5){
    mouthTimer=0;
    if(mouthOpen==true){ mouthOpen=false; }
    else{ mouthOpen = true; }
  }
}

void updatePac(){
  //position stuff
  xTile = floor(pacX/pixelsPerTile);
  yTile = floor(pacY/pixelsPerTile);
    //correcting to path
  if(pacDir!="left" && pacDir!="right" && pacX%pixelsPerTile != pixelsPerTile*0.5){
    if(pacX%pixelsPerTile>pixelsPerTile*0.5){ pacX--; }
    if(pacX%pixelsPerTile<pixelsPerTile*0.5){ pacX++; }
  }
  if(pacDir!="up" && pacDir!="down" && pacX%pixelsPerTile != pixelsPerTile*0.5){
    if(pacY%pixelsPerTile>pixelsPerTile*0.5){ pacY--; }
    if(pacY%pixelsPerTile<pixelsPerTile*0.5){ pacY++; }
  }
  
  //check surrouding tiles
  if(yTile!=17 || (xTile>0 && xTile<27)){ //unless going through a tunnel
    if(tileMap[yTile][xTile-1]==0||tileMap[yTile][xTile-1]==2||tileMap[yTile][xTile-1]==3){ canL = true; }
    else{ canL = false; }
    if(tileMap[yTile][xTile+1]==0||tileMap[yTile][xTile+1]==2||tileMap[yTile][xTile+1]==3){ canR = true; }
    else{ canR = false; }
    if(tileMap[yTile-1][xTile]==0||tileMap[yTile-1][xTile]==2||tileMap[yTile-1][xTile]==3){ canU = true; }
    else{ canU = false; }
    if(tileMap[yTile+1][xTile]==0||tileMap[yTile+1][xTile]==2||tileMap[yTile+1][xTile]==3){ canD = true; }
    else{ canD = false; }
  }
  
  //change movement direction
  if(canL && lPress){ pacDir = "left"; pacMDir = "left"; }
  else if(canR && rPress){ pacDir = "right"; pacMDir = "right"; }
  else if(canU && uPress){ pacDir = "up"; pacMDir = "up"; }
  else if(canD && dPress){ pacDir = "down"; pacMDir = "down"; }
}

void movePac(){
  if(freezeTimer==0){
    if(pacDir=="left"){ pacX-=pacSpe; }
    else if(pacDir=="right"){ pacX+=pacSpe; }
    else if(pacDir=="up"){ pacY-=pacSpe; }
    else if(pacDir=="down"){ pacY+=pacSpe; }
  }
  
  //stop pacman
  if(yTile!=17 || (xTile>0 && xTile<27)){ //unless going in tunnel
    if(pacDir=="left" && tileMap[yTile][xTile-1]==1 && pacX%pixelsPerTile<pixelsPerTile*0.6){
      pacDir="none"; }
    else if(pacDir=="right" && tileMap[yTile][xTile+1]==1 && pacX%pixelsPerTile>pixelsPerTile*0.4){
      pacDir="none"; }
    else if(pacDir=="up" && tileMap[yTile-1][xTile]==1  && pacY%pixelsPerTile<pixelsPerTile*0.6){
      pacDir="none"; }
    else if(pacDir=="down" && tileMap[yTile+1][xTile]==1 && pacY%pixelsPerTile>pixelsPerTile*0.4){
      pacDir="none"; }
  }
  
  //tunnel
  if(xTile==-1 && pacDir=="left"){
    pacX=width+pixelsPerTile;
  }
  else if(xTile==28 && pacDir=="right"){
    pacX=-pixelsPerTile;
  }
}

void pacEat(){
  if(xTile>0 && xTile<27){
    if(dotMap[yTile][xTile]==1){
      score+=10;
      dotsEaten+=1;
      dotMap[yTile][xTile] = 0;
        //ghost release
      Pinky.relDots--;
      Inky.relDots--;
      Clyde.relDots--;
        //move back 1 frame
      if(pacDir=="left"){ pacX+=pacSpe; }
      else if(pacDir=="right"){ pacX-=pacSpe; }
      else if(pacDir=="up"){ pacY+=pacSpe; }
      else if(pacDir=="down"){ pacY-=pacSpe; }
    }
    if(dotMap[yTile][xTile]==2){
      score+=50;
      dotsEaten+=1;
      dotMap[yTile][xTile]=0;
        //ghost release
      Pinky.relDots--;
      Inky.relDots--;
      Clyde.relDots--;
        //energizer stuff
      energizerEaten();
    }
  }
  if(dotsEaten==70 && fruitsShown[0]==false){
    showFruit = true;
  } else if(dotsEaten==170 && fruitsShown[1]==false){
    showFruit = true;
  }
  if(dotsEaten>=244){
    mode = "finished";
  }
}

void showFruit(){
  if(level==1){
    fruitScoreGain=100;
    drawCherry(14*pixelsPerTile,20.5*pixelsPerTile,1.5);
  } else if(level==2){
    fruitScoreGain=300;
    drawStrawberry(14*pixelsPerTile,20.5*pixelsPerTile,1.5);
  } else if(level==3 || level==4){
    fruitScoreGain=500;
    drawOrange(14*pixelsPerTile,20.5*pixelsPerTile,1.5);
  } else if(level==5 || level==6){
    fruitScoreGain=700;
    drawApple(14*pixelsPerTile,20.5*pixelsPerTile,1.5);
  } else if(level==7 || level==8){
    fruitScoreGain=1000;
    drawGrapes(14*pixelsPerTile,20.5*pixelsPerTile,1.5);
  } else if(level==9 || level==10){
    fruitScoreGain=2000;
    drawGalaxian(14*pixelsPerTile,20.5*pixelsPerTile,1.5);
  } else if(level==11 || level==12){
    fruitScoreGain=3000;
    drawBell(14*pixelsPerTile,20.5*pixelsPerTile,1.5);
  } else if(level>=13){
    fruitScoreGain=5000;
    drawKey(14*pixelsPerTile,20.5*pixelsPerTile,1.5);
  }
  fruitTimer++;
  if(fruitTimer>540){
    showFruit=false;
    fruitTimer=0;
  }
  if(pacX>13*pixelsPerTile && pacX<14*pixelsPerTile && pacY>20*pixelsPerTile && pacY<21*pixelsPerTile){
    showFruit=false;
    showFruitText=true;
    fruitTimer=0;
    score+=fruitScoreGain;
  }
}
void showFruitText(){
  fill(0,0,255);
  textAlign(CENTER,CENTER);
  textSize(10);
  text(fruitScoreGain,14*pixelsPerTile,20.5*pixelsPerTile);
  
  fruitTextTimer++;
  if(fruitTextTimer>120){
    showFruitText=false;
    fruitTextTimer=0;
  }
}
