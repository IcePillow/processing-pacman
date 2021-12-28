String gcsMode = "scatter"; //scatter or chase mode
int gcsStage = 0;
int gcsTimer = 0;
int frightTimer = -1;

class Ghost{
  float xpos=0, ypos=0, spe;
  int xtile, ytile;
  String name, mMode="scatter", dir="left";
  color col;
  boolean gFlash=false;
  boolean gWiggly=false;
  int[] tarTile = {0,0}; //y,x
  int relDots = 0;
  int relTimer = 0;
  
  Ghost(String n, color c){
    name = n;
    col = c;
  }
  void gDraw(){
    if(dir=="left"){ drawGhost(xpos, ypos, 1.5, col, "left", mMode, gFlash,gWiggly); }
    else if(dir=="right"){ drawGhost(xpos, ypos, 1.5, col, "right", mMode, gFlash,gWiggly); }
    else if(dir=="up"){ drawGhost(xpos, ypos, 1.5, col, "up", mMode, gFlash,gWiggly); }
    else if(dir=="down"){ drawGhost(xpos, ypos, 1.5, col, "down", mMode, gFlash,gWiggly); }
  }
  void gUpdate(){
    //speed changes
    if(xtile>0 && xtile<27){
      if(tileMap[ytile][xtile]==2 && mMode=="attract"){ }
      else if(tileMap[ytile][xtile]==2){ spe = curSpeeds[3]; }
      else if(mMode=="frightened"){ spe = curSpeeds[2]; }
      else if(mMode=="return"){ spe=1.5*curSpeeds[1]; }
      else if(mMode!="attract") { spe = curSpeeds[1]; }
    }
    //wiggle
    if(rollingTimer%(framesPerWiggle*2+1)>framesPerWiggle&&freezeTimer==0){ gWiggly=true; }
    else { gWiggly=false; }
    //frightened flashing
    if(frightTimer<120 && mMode=="frightened"&&freezeTimer==0){
      if(frightTimer%20>10){ gFlash=true; }
      else{ gFlash=false; }
    } else{ gFlash=false; }
    //leave the house
    if(mMode=="house" && (relDots<1 || relTimer<=0)){ mMode = "exit"; }
    if(relTimer>0){ relTimer--; }
    //enter the house
    if(ytile==14 && abs(14*pixelsPerTile-xpos)<=2*spe && mMode=="return"){ mMode = "enter"; }
    //tiles
    xtile = floor(xpos/pixelsPerTile);
    ytile = floor(ypos/pixelsPerTile);
    if(name=="blinky"){ tarTile = blinkyTar(); }
    else if(name=="pinky"){ tarTile = pinkyTar(); }
    else if(name=="inky"){ tarTile = inkyTar(); }
    else if(name=="clyde"){ tarTile = clydeTar(); }
    //eating
    if(xtile==xTile && ytile==yTile && mode!="attract"){
      gEat();
    }
  }
  void gMove(){
    //basic movement
    if(freezeTimer==0 || mMode=="return" || mMode=="enter"){ //if frozen don't move
      if(mMode=="standard"||mMode=="frightened"||mMode=="return"||mMode=="attract"){
        if(dir=="left"){ xpos-=spe; }
        else if(dir=="right"){ xpos+=spe; }
        else if(dir=="up"){ ypos-=spe; }
        else if(dir=="down"){ ypos+=spe; }
      }
      else if(mMode=="house"){ //bouncing in house
        if(dir=="up"){ ypos-=4*spe/5; }
        else if(dir=="down"){ ypos+=4*spe/5; }
        if(ytile==16){ dir="down"; }
        else if(ytile==18){ dir="up"; }
      }
      else if(mMode=="exit"){ //leaving the house
        if(xpos<13.9*pixelsPerTile){ xpos+=2*spe/3; dir="right"; }
        else if(xpos>14.1*pixelsPerTile){ xpos-=2*spe/3; dir="left"; }
        else if(xpos>=13.9*pixelsPerTile && xpos<=14.1*pixelsPerTile){ xpos = 14*pixelsPerTile; dir="left"; }
        if(xpos==14*pixelsPerTile && ypos>14.5*pixelsPerTile){
          ypos-=2*spe/3;
          dir="up";
        }
        else if(ypos<=14.5*pixelsPerTile){
          mMode = "standard";
          dir = "left";
          ypos = 14.5*pixelsPerTile;
        }
      }
      else if(mMode=="enter"){
        if(ytile==14){ //correct x up top
          xpos=14*pixelsPerTile;
        }
        if(ypos<17.5*pixelsPerTile){
          ypos+=2*spe/3;
          dir = "down";
        } else if(ypos>=17.5*pixelsPerTile){
          ypos=17.5*pixelsPerTile;
          if(name=="blinky" || name=="pinky"){
            mMode = "exit";
            dir = "up";
          }
          else if(name=="inky"){
            if(xpos>12.5*pixelsPerTile){ xpos-=2*spe/3; dir="left"; }
            else if(xpos<=12.5*pixelsPerTile){ xpos=12.5*pixelsPerTile; dir="up"; mMode="exit"; }
          }
          else if(name=="clyde"){
            if(xpos<15.5*pixelsPerTile){ xpos+=2*spe/3; dir="right"; }
            else if(xpos>=15.5*pixelsPerTile){ xpos=15.5*pixelsPerTile; dir="up"; mMode="exit"; }
          }
        }
      }
    }
    //tunnel
    if(xtile<0&&dir=="left"){ xpos=width+pixelsPerTile; }
    else if(xtile>27&&dir=="right"){ xpos=-pixelsPerTile; }
    //turn detection
    if(xtile>0 && xtile<27){
      if(tileMap[ytile][xtile]==3){
        if( abs(xpos%pixelsPerTile-pixelsPerTile/2)<spe/2 &&(this.dir=="left"||this.dir=="right")){
          xpos = xtile*pixelsPerTile+pixelsPerTile/2;
          gTurn("");
        }
        else if( abs(ypos%pixelsPerTile-pixelsPerTile/2)<spe/2 &&(this.dir=="up"||this.dir=="down")){
          ypos = ytile*pixelsPerTile+pixelsPerTile/2;
          gTurn("");
        }
      }
    }
  }
  void gTurn(String ban){
    int[] target = new int[2];
    if(name=="blinky"){ target = blinkyTar(); }
    else if(name=="pinky"){ target = pinkyTar(); }
    else if(name=="inky"){ target = inkyTar(); }
    else if(name=="clyde"){ target = clydeTar(); }
    
    //calculate distances
    float[] distToDest = new float[4]; //left, right, up, down
    distToDest[0] = sqrt( sq(ytile-target[0])+sq(xtile-1-target[1]) );
    distToDest[1] = sqrt( sq(ytile-target[0])+sq(xtile+1-target[1]) );
    distToDest[2] = sqrt( sq(ytile-1-target[0])+sq(xtile-target[1]) );
    distToDest[3] = sqrt( sq(ytile+1-target[0])+sq(xtile-target[1]) );
    
    //change distances to 100 if path blocked or going opposite way
    if( tileMap[ytile][xtile-1]==1 || dir=="right" ){ distToDest[0] = 100; }
    if( tileMap[ytile][xtile+1]==1 || dir=="left" ){ distToDest[1] = 100; }
    if( tileMap[ytile-1][xtile]==1 || dir=="down" ){ distToDest[2] = 100; }
    if( tileMap[ytile+1][xtile]==1 || dir=="up" ){ distToDest[3] = 100; }
    
    //bans
    if(ban=="left"){  distToDest[0] = 100; }
    else if(ban=="right"){  distToDest[1] = 100; }
    else if(ban=="up"){  distToDest[2] = 100; }
    else if(ban=="down"){  distToDest[2] = 100; }
    
    //stop them going up in 4 spots
    if( (dir=="left"||dir=="right") && ( (xtile==12&&ytile==14)||(xtile==15&&ytile==14) ) && mMode!="frightened" ){
      distToDest[2] = 100;
    } else if( (dir=="left"||dir=="right") && ( (xtile==12&&ytile==26)||(xtile==15&&ytile==26) ) && mMode!="frightened" ){
      distToDest[2] = 100;
    }
      //have blinky go left on second turn
    if(name=="blinky"&&dir=="down"&&mMode=="standard"&&gcsMode=="scatter"&&ytile==17&&xtile==9){
      distToDest[3]=100;
    }
    
    //find smallest 'distance'
    if(distToDest[0]<=distToDest[1] && distToDest[0]<=distToDest[2] && distToDest[0]<=distToDest[3]){
      dir = "left";
    }
    if(distToDest[1]<=distToDest[0] && distToDest[1]<=distToDest[2] && distToDest[1]<=distToDest[3]){
      dir = "right";
    }
    if(distToDest[2]<=distToDest[0] && distToDest[2]<=distToDest[1] && distToDest[2]<=distToDest[3]){
      dir = "up";
    }
    if(distToDest[3]<=distToDest[0] && distToDest[3]<=distToDest[1] && distToDest[3]<=distToDest[2]){
      dir = "down";
    }
  }
  
  void gReverse(){
    if(dir=="left"){ dir="right"; }
    else if(dir=="right"){ dir="left"; }
    else if(dir=="up"){ dir="down"; }
    else if(dir=="down"){ dir="up"; }
  }
  
  void gEat(){
    if(mMode=="frightened"){
      mMode="return";
      ghostsEaten+=1;
      ghostEatText[ghostsEaten-1][0]=120;
      ghostEatText[ghostsEaten-1][1]=xtile;
      ghostEatText[ghostsEaten-1][2]=ytile;
      score+=pow(2,ghostsEaten)*100;
      freezeTimer=freezeTimeLength;
    }
    else if(mMode!="return" && mMode!="exit" && peaceMode==false){
      mode = "death reset";
    }
  }
  
}

void energizerEaten(){
  if(Blinky.mMode=="standard"){
    Blinky.mMode = "frightened";
    Blinky.gReverse();
  }
  if(Pinky.mMode=="standard"){
    Pinky.mMode = "frightened";
    Pinky.gReverse();
  }
  if(Inky.mMode=="standard"){
    Inky.mMode = "frightened";
    Inky.gReverse();
  }
  if(Clyde.mMode=="standard"){
      Clyde.mMode = "frightened";
      Clyde.gReverse();
  }
  
  ghostsEaten=0;
  
  if(level<=20){
      frightTimer=frightTime[level-1]*60;
  } else{
    frightTimer=0; 
  }
}

void standardGhost(){
  gcsTimer++;
  
  float[] cycle={8};
  if(level==1){ cycle=modeTimers[0]; }
  else if(level<5){ cycle=modeTimers[1]; }
  else if(level>=5){ cycle=modeTimers[2]; }
  
  int switchTime=0;
  for(int i=0; i<gcsStage+1; i++){
    switchTime+=cycle[i]*60;
  }
  
  if(gcsTimer>switchTime){
    gcsStage+=1;
    if(gcsMode=="chase"){
      gcsMode = "scatter";
    } else if(gcsMode=="scatter"){
      gcsMode = "chase";
    }
    Blinky.gReverse();
    Pinky.gReverse();
    Inky.gReverse();
    Clyde.gReverse();
  }
}

void undoFrighten(){
  if(Blinky.mMode!="house"&&Blinky.mMode!="exit"&&Blinky.mMode!="return"&&Blinky.mMode!="enter"){ Blinky.mMode = "standard"; }
  if(Pinky.mMode!="house"&&Pinky.mMode!="exit"&&Pinky.mMode!="return"&&Pinky.mMode!="enter"){ Pinky.mMode = "standard"; }
  if(Inky.mMode!="house"&&Inky.mMode!="exit"&&Inky.mMode!="return"&&Inky.mMode!="enter"){ Inky.mMode = "standard"; }
  if(Clyde.mMode!="house"&&Clyde.mMode!="exit"&&Clyde.mMode!="return"&&Clyde.mMode!="enter"){ Clyde.mMode = "standard"; }
}


int[] blinkyTar(){
  int[] tarTile = {0,0}; //y,x
  if(Blinky.mMode=="return"){
    tarTile[0]=14;
    tarTile[1]=14;
  } else if(Blinky.mMode=="frightened"||Blinky.mMode=="attract"){
    tarTile[0]=int(random(0,35));
    tarTile[1]=int(random(0,27));
  } else if(gcsMode=="scatter"){
    tarTile[0]=0;
    tarTile[1]=27;
  } else if(gcsMode=="chase"){
    tarTile[0]=yTile;
    tarTile[1]=xTile;
  }
  return tarTile;
}
int[] pinkyTar(){
  int[] tarTile = {0,0}; //y,x
  if(Pinky.mMode=="return"){
    tarTile[0]=14;
    tarTile[1]=14;
  } else if(Pinky.mMode=="frightened"||Pinky.mMode=="attract"){
    tarTile[0]=int(random(0,35));
    tarTile[1]=int(random(0,27));
  } else if(gcsMode=="scatter"){
    tarTile[0]=0;
    tarTile[1]=0;
  } else if(gcsMode=="chase"){
    if(pacMDir=="left"){ tarTile[0]=yTile; tarTile[1]=xTile-4; }
    else if(pacMDir=="right"){ tarTile[0]=yTile; tarTile[1]=xTile+4; }
    else if(pacMDir=="up"){ tarTile[0]=yTile-4; tarTile[1]=xTile; }
    else if(pacMDir=="down"){ tarTile[0]=yTile+4; tarTile[1]=xTile; }
  }
  return tarTile;
}
int[] inkyTar(){
  int[] tarTile = {0,0}; //y,x
  if(Inky.mMode=="return"){
    tarTile[0]=14;
    tarTile[1]=14;
  } else if(Inky.mMode=="frightened"||Inky.mMode=="attract"){
    tarTile[0]=int(random(0,35));
    tarTile[1]=int(random(0,27));
  } else if(gcsMode=="scatter"){
    tarTile[0]=35;
    tarTile[1]=27;
  } else if(gcsMode=="chase"){
    int[] blVec = {yTile-Blinky.ytile, xTile-Blinky.xtile}; //y,x
    if(pacMDir=="left"){ blVec[1] = xTile-Blinky.xtile-2; }
    else if(pacMDir=="right"){ blVec[1] = xTile-Blinky.xtile+2; }
    else if(pacMDir=="up"){ blVec[0] = yTile-Blinky.ytile-2; }
    else if(pacMDir=="down"){ blVec[0] = yTile-Blinky.ytile+2; }
    
    tarTile[0] = Blinky.ytile+2*blVec[0];
    tarTile[1] = Blinky.xtile+2*blVec[1];
  }
  
  return tarTile;
}
int[] clydeTar(){
  int[] tarTile = {0,0}; //y,x
  if(Clyde.mMode=="return"){
    tarTile[0]=14;
    tarTile[1]=14;
  } else if(Clyde.mMode=="frightened"||Clyde.mMode=="attract"){
    tarTile[0]=int(random(0,35));
    tarTile[1]=int(random(0,27));
  } else if(gcsMode=="scatter"){
    tarTile[0]=35;
    tarTile[1]=0;
  } else if(gcsMode=="chase"){
    float distToPac = sqrt( sq(Clyde.xtile-xTile)+sq(Clyde.ytile-yTile) );
    
    if(distToPac<8){
      tarTile[0]=35;
      tarTile[1]=0;
    } else if(distToPac>8){
      tarTile[0]=yTile;
      tarTile[1]=xTile;
    }
  }
  return tarTile;
}
