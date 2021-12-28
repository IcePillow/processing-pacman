int loadTimer = 0;
String[] fruitBar = {};
float[] curSpeeds = {0,0,0,0};

void runLoad(){
  if(loadTimer<1){
    level+=1;
    //pacman
      pacDir="left";
      pacMDir="left";
      dotsEaten=0;
      pacX=14*pixelsPerTile;
      pacY=26*pixelsPerTile+pixelsPerTile/2;
    //dots
      dotMap = new int[templateDots.length][templateDots[0].length];
      for(int i=0; i<templateDots.length; i++){
        for(int j=0; j<templateDots[i].length; j++){
          dotMap[i][j] = templateDots[i][j];
        }
      }
    //fruit
      fruitsShown[0]=false;
      fruitsShown[1]=false;
      showFruit=false;
      showFruitText=false;
      fruitTimer=0;
      fruitTextTimer=0;
      //fruit bar
        if(level==1){ fruitBar = append(fruitBar, "cherry"); }
        else if(level==2){ fruitBar = append(fruitBar, "strawberry"); }
        else if(level==3 || level==4){ fruitBar = append(fruitBar, "orange"); }
        else if(level==5 || level==6){ fruitBar = append(fruitBar, "apple"); }
        else if(level==7 || level==8){ fruitBar = append(fruitBar, "grapes"); }
        else if(level==9 || level==10){ fruitBar = append(fruitBar, "galaxian"); }
        else if(level==11 || level==12){ fruitBar = append(fruitBar, "bell"); }
        else if(level==13 || level==14){ fruitBar = append(fruitBar, "key"); }
        
        if(fruitBar.length>=8){
          fruitBar=subset(fruitBar, 1);
        }
    //ghosts
       //positions
         Blinky.xpos=14*pixelsPerTile;
         Blinky.ypos=14.5*pixelsPerTile;
         Pinky.xpos=14*pixelsPerTile;
         Pinky.ypos=17.5*pixelsPerTile;
         Inky.xpos=12.5*pixelsPerTile;
         Inky.ypos=17.5*pixelsPerTile;
         Clyde.xpos=15.5*pixelsPerTile;
         Clyde.ypos=17.5*pixelsPerTile;
       //modes and dirs
         Blinky.mMode="standard";
         Blinky.dir="left";
         Pinky.mMode="house";
         Pinky.dir="up";
         Inky.mMode="house";
         Inky.dir="down";
         Clyde.mMode="house";
         Clyde.dir="down";
       //speeds
         if(level==1){
           curSpeeds[0]=maxSpeed*moveSpe[0][0];
           curSpeeds[1]=maxSpeed*moveSpe[0][1];
           curSpeeds[2]=maxSpeed*moveSpe[0][2];
           curSpeeds[3]=maxSpeed*moveSpe[0][3];
        }
         else if(level<=4){
           curSpeeds[0]=maxSpeed*moveSpe[1][0];
           curSpeeds[1]=maxSpeed*moveSpe[1][1];
           curSpeeds[2]=maxSpeed*moveSpe[1][2];
           curSpeeds[3]=maxSpeed*moveSpe[1][3];
         }
         else if(level<=20){
           curSpeeds[0]=maxSpeed*moveSpe[2][0];
           curSpeeds[1]=maxSpeed*moveSpe[2][1];
           curSpeeds[2]=maxSpeed*moveSpe[2][2];
           curSpeeds[3]=maxSpeed*moveSpe[2][3];
         }
         else{
           curSpeeds[0]=maxSpeed*moveSpe[3][0];
           curSpeeds[1]=maxSpeed*moveSpe[3][1];
           curSpeeds[2]=maxSpeed*moveSpe[3][2];
           curSpeeds[3]=maxSpeed*moveSpe[3][3];
         }
         pacSpe=curSpeeds[0];
       //release dots
         if(level==1){
           Pinky.relDots = releaseDots[1][0];
           Inky.relDots = releaseDots[1][1];
           Clyde.relDots = releaseDots[1][2];
         }
         else if(level==2){
           Pinky.relDots = releaseDots[2][0];
           Inky.relDots = releaseDots[2][1];
           Clyde.relDots = releaseDots[2][2];
         }
         else if(level>=3){
           Pinky.relDots = releaseDots[3][0];
           Inky.relDots = releaseDots[3][1];
           Clyde.relDots = releaseDots[3][2];
         }
       //timer release counter
         Pinky.relTimer = Pinky.relDots*40;
         Inky.relTimer = Inky.relDots*35;
         Clyde.relTimer = Clyde.relDots*30;
       //frightened
         frightTimer=-1;
         freezeTimer = 0;
       //scatter chase
         gcsMode = "scatter";
         gcsStage = 0;
         gcsTimer = 0;
       
  } else if(loadTimer>120){
    loadTimer = -1;
    mode = "play";
  }
  loadTimer++;
  
  //draw stuff
  background(0,0,0);
  drawMaze();
  drawDots();
  fill(255,255,0);
  ellipse(pacX, pacY, 1.2*pixelsPerTile, 1.2*pixelsPerTile);
    //ghosts
  Blinky.gDraw();
  Pinky.gDraw();
  Inky.gDraw();
  Clyde.gDraw();

  textAlign(CENTER,CENTER);
  textSize(14);
  fill(255,255,0);
  text("Ready!", width/2, pixelsPerTile*20.5);
  drawExtra();
}

int deathTimer = 0;
float pacDeathAn = 0;
void deathReset(){
  if(deathTimer==10){
    background(0,0,0);
    drawMaze();
    drawDots();
    drawExtra();
    fill(255,255,0);
    arc(pacX, pacY, pixelsPerTile*1.2,pixelsPerTile*1.2,7*PI/4+pacDeathAn,13*PI/4-pacDeathAn);
    pacDeathAn+=PI/100;
    if(pacDeathAn>=3*PI/4){
      deathTimer++;
      pacDeathAn=0;
    }
  } else if(deathTimer>=11 && deathTimer<30){
    background(0,0,0);
    drawMaze();
    drawDots();
    drawExtra();
    strokeWeight(2);
    stroke(255,255,0);
    line(pacX,pacY-4,pacX,pacY-6);
    line(pacX+2*sqrt(2),pacY-2*sqrt(2),pacX+3*sqrt(2),pacY-3*sqrt(2));
    line(pacX+4,pacY,pacX+6,pacY);
    line(pacX+2*sqrt(2),pacY+2*sqrt(2),pacX+3*sqrt(2),pacY+3*sqrt(2));
    line(pacX,pacY+4,pacX,pacY+6);
    line(pacX-2*sqrt(2),pacY+2*sqrt(2),pacX-3*sqrt(2),pacY+3*sqrt(2));
    line(pacX-4,pacY,pacX-6,pacY);
    line(pacX-2*sqrt(2),pacY-2*sqrt(2),pacX-3*sqrt(2),pacY-3*sqrt(2));
    deathTimer++;
  } else if(deathTimer==31){
    if(livesRem==0){
      mode = "title";
      deathTimer=0;
      fullReset();
    } else{
      deathTimer++;
      livesRem-=1;
      //pacman
        pacDir="left";
        pacMDir="left";
        pacX=14*pixelsPerTile;
        pacY=26*pixelsPerTile+pixelsPerTile/2;
      //ghosts
         //position
           Blinky.xpos=14*pixelsPerTile;
           Blinky.ypos=14.5*pixelsPerTile;
           Pinky.xpos=14*pixelsPerTile;
           Pinky.ypos=17.5*pixelsPerTile;
           Inky.xpos=12.5*pixelsPerTile;
           Inky.ypos=17.5*pixelsPerTile;
           Clyde.xpos=15.5*pixelsPerTile;
           Clyde.ypos=17.5*pixelsPerTile;
         //modes and dirs
           Blinky.mMode="standard";
           Blinky.dir="left";
           Pinky.mMode="house";
           Pinky.dir="up";
           Inky.mMode="house";
           Inky.dir="down";
           Clyde.mMode="house";
           Clyde.dir="down";
         //dot releaese counter
           Pinky.relDots = releaseDots[0][0];
           Inky.relDots = releaseDots[0][1];
           Clyde.relDots = releaseDots[0][2];
         //timer release counter
           Pinky.relTimer = releaseDots[0][0]*40;
           Inky.relTimer = releaseDots[0][1]*35;
           Clyde.relTimer = releaseDots[0][2]*30;
         //frightened
           frightTimer=-1;
      //title
        titleEnergizer = false;
        titleTimer = 0;
    }
  } else if(deathTimer>=31){
    background(0,0,0);
    drawMaze();
    drawDots();
    if(deathTimer>80){
      mode="load";
      loadTimer=1;
      deathTimer=0;
    }
    deathTimer++;
  }
  else{
    deathTimer++;
  }
}

int finishedTimer = 0;
void runFinished(){
  //pacman
    pacDir = "none";
  //maze
    finishedTimer++;
    if(finishedTimer%30<15){ mazeWhite = false; }
    else if(finishedTimer%30>15){ mazeWhite = true; }
    
    //transition to cut scenes or load mode
      if(finishedTimer>120){
        if(level==2){ mode="scene 1"; sceneDest="load"; }
        else if(level==5){ mode="scene 2"; sceneDest="load"; }
        else if(level==9 || level==13 || level==17){  mode="scene 3"; sceneDest="load"; }
        else{ mode = "load"; }
        finishedTimer = 0;
        loadTimer = 0;
      }
  //draw stuff
    background(0,0,0);
    drawMaze();
    drawDots();
    fill(255,255,0);
    ellipse(pacX, pacY, 1.2*pixelsPerTile, 1.2*pixelsPerTile);
}

int attractTimer = 0;
void runAttract(){
  //beginning pos
  if(attractTimer==0){
    Blinky.xpos=15.5*pixelsPerTile; Blinky.ypos=6.5*pixelsPerTile;
    Blinky.dir="down"; Blinky.mMode="attract"; Blinky.spe=1.4;
    Pinky.xpos=3.5*pixelsPerTile; Pinky.ypos=4.5*pixelsPerTile;
    Pinky.dir="right"; Pinky.mMode="attract"; Pinky.spe=1.4;
    Inky.xpos=21.5*pixelsPerTile; Inky.ypos=24.5*pixelsPerTile;
    Inky.dir="up"; Inky.mMode="attract"; Inky.spe=1.4;
    Clyde.xpos=11.5*pixelsPerTile; Clyde.ypos=23.5*pixelsPerTile;
    Clyde.dir="right"; Clyde.mMode="attract"; Clyde.spe=1.4;
  }
  attractTimer++;
  //move & update ghosts
    Blinky.gMove(); Blinky.gUpdate();
    Pinky.gMove(); Pinky.gUpdate();
    Inky.gMove(); Inky.gUpdate();
    Clyde.gMove(); Clyde.gUpdate();
  //credit check
    if(credits>0){
      mode="title";
      titleTimer=600;
    }
  //draw things
    background(0,0,0);
    drawMaze();
    drawDots();
    //entities
      Blinky.gDraw();
      Pinky.gDraw();
      Inky.gDraw();
      Clyde.gDraw();
    //text
      textAlign(CENTER,CENTER);
      textSize(16);
      fill(255,0,0);
      text("Game Over",width/2,pixelsPerTile*20.5);
      fill(255,255,255);
      text("Credit " + credits,width/6,height-16);
      textSize(20);
      fill(255,255,255);
      text("Press TAB", 4*width/5,height-16);
      //tips
        fill(255,255,0);
        textSize(10);
        text(topTips[topTipInd],width/2,36);
}
