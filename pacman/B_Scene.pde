String sceneDest = "load";

float s1pacX = width+20;
boolean s1mouth = false;
int s1mouthTime = 0;
float s1ghX = width+100;
boolean s1reverse = false;

void runScene1(){
  //initial values
  if(s1mouthTime<1){
    s1pacX=width+20;
    s1ghX=width+100;
  }
  //move pac/blinky
  if(s1pacX>-100 && s1reverse==false){ s1pacX-=1.9; }
  if(s1pacX>-100 && s1reverse==false){ s1ghX-=2.02; }
  if(s1pacX<=-100){ s1reverse=true; }
  if(s1reverse==true){ s1ghX+=1.6; }
  if(s1reverse==true&&s1ghX>0.2*width){ s1pacX+=2.1; }  
  //draw characters
  background(0,0,0);
  if(s1reverse==false){
    if(rollingTimer%(framesPerWiggle*2+1)>framesPerWiggle){ drawGhost(s1ghX,height/2,2,color(255,0,0),"left","standard",false,true); }
    else{ drawGhost(s1ghX,height/2,2,color(255,0,0),"left","standard",false,false); }
  }
  else if(s1reverse==true){
   if(rollingTimer%(framesPerWiggle*2+1)>framesPerWiggle){ drawGhost(s1ghX,height/2,2,color(255,0,0),"right","frightened",false,false); }
   else{ drawGhost(s1ghX,height/2,2,color(255,0,0),"right","frightened",false,true); }
  }
  if(s1reverse==false){
    fill(255,255,0);
    ellipse(s1pacX,height/2,28,28);
    fill(0,0,0);
    if(rollingTimer%(framesPerWiggle*2+1)>framesPerWiggle){ arc(s1pacX+4,height/2,38,34,3*PI/4,5*PI/4); }
  } else if(s1reverse==true){
    fill(255,255,0);
    ellipse(s1pacX,height/2-10,48,48);
    fill(0,0,0);
    if(rollingTimer%(framesPerWiggle*2+1)>framesPerWiggle){ arc(s1pacX-4,height/2-10,58,54,-PI/4,PI/4); }
  }
  s1mouthTime++;
  if(s1mouthTime>13){
    s1mouthTime=1;
  }
  //end cut scene
  if(s1pacX>width+100 && s1reverse==true){
    mode=sceneDest;
    s1reverse=false;
    s1mouthTime=0;
    s1pacX=width+20;
    s1ghX=width+100;
  }
}

float s2pacX = 0;
float s2ghX = 0;
int s2mouthTime = 0;
int s2timer = 0;
void runScene2(){
  //beggining conditions
    if(s2mouthTime<1){
      s2pacX=width+50;
      s2ghX=width+50;
    }
  //move them
    s2pacX-=2;
    if(s2pacX<0.6*width && s2ghX>width/2-10){ s2ghX-=1.8; }
    else if(s2pacX<=0.7*width){
      s2timer++;
      if(s2timer>20&&s2timer<78){ s2ghX-=0.4; }
    }
  //draw things
    background(0,0,0);
    fill(255,255,255);
    rect(width/2-1,height/2+8,3,12 ); //little line
  //pacman
    fill(255,255,0);
    ellipse(s2pacX,height/2,28,28);
    fill(0,0,0);
    if(s2mouthTime>7){ arc(s2pacX+4,height/2,38,34,3*PI/4,5*PI/4); }
    s2mouthTime++;
    if(s2mouthTime>13){
      s2mouthTime=1;
    }
  //blinky
    if(s2timer<160){
      if(rollingTimer%(framesPerWiggle*2+1)>framesPerWiggle){ drawGhost(s2ghX,height/2,2,color(255,0,0),"left","standard",false,true); }
      else{ drawGhost(s2ghX,height/2,2,color(255,0,0),"left","standard",false,false); }
      fill(255,0,0);
      if(s2ghX<=width/2){
        rect(s2ghX+10,height/2+8,width/2-(s2ghX+10)+1,8);
        for(int i=2; i<int( width/2+2-(s2ghX+10) ); i++){
          rect(s2ghX+10+i,height/2+8-4/(0.2*i),1,5);
        }
        s2timer++;
      }
    }
    else if(s2ghX<=width/2 && s2timer<210){
      drawGhost(s2ghX-20,height/2,2,color(255,0,0),"up","standard",false,false);
      fill(255,0,0);
         rect(width/2,height/2+6,2,10);
         rect(width/2-2,height/2+8,2,8);
         rect(width/2-8,height/2+10,6,6);
         rect(width/2-10,height/2+12,2,4);
         rect(width/2-14,height/2+14,4,2);       
      fill(0,0,0);
        rect(s2ghX-15,height/2+10,10,8);
        rect(s2ghX-12,height/2+8,6,2);
      fill(226,185,143);
        rect(s2ghX-13,height/2+8,4,8);
        rect(s2ghX-10,height/2+13,5,3);
    }
    else if(s2ghX<=width/2 && s2timer>=210){
      drawGhost(s2ghX-20,height/2,2,color(255,0,0),"right","standard",false,false);
      fill(255,0,0); //torn part
        rect(width/2,height/2+6,2,10);
        rect(width/2-2,height/2+8,2,8);
        rect(width/2-8,height/2+10,6,6);
        rect(width/2-10,height/2+12,2,4);
        rect(width/2-14,height/2+14,4,2);
      fill(0,0,0);
        rect(s2ghX-15,height/2+10,10,8);
        rect(s2ghX-12,height/2+8,6,2);
      fill(226,185,143);
        rect(s2ghX-13,height/2+8,4,8);
        rect(s2ghX-10,height/2+13,5,3);
    }
    if(s2timer>300){
      s2timer=0;
      s2pacX = 0;
      s2ghX = 0;
      s2mouthTime = 0;
      mode = sceneDest;
    }
}

float s3pacX = 0;
float s3ghX = 0;
int s3mouthTime = 0;
int s3slugTimer = 0;
int s3timer = 0;
int slugTimer = 0;
boolean s3ghReverse = false;

void runScene3(){
  
  if(s3mouthTime==0){
    s3pacX = width+50;
    s3ghX = width+150;
  }
  
  s3pacX-=2.2;
  if(s3ghReverse==false){ s3ghX-=2.25; }
  else if(s3ghReverse==true){ s3ghX+=2.25; }
  if(s3ghReverse==false && s3ghX<-50){ s3ghReverse=true; }
  
  //draw stuff
  background(0,0,0);
  fill(255,255,0);
  ellipse(s3pacX,height/2,28,28);
  fill(0,0,0);
  if(s3mouthTime>7){ arc(s3pacX+4,height/2,38,34,3*PI/4,5*PI/4); }
  s3mouthTime++;
  if(s3mouthTime>13){
    s3mouthTime=1;
  }
  if(s3ghReverse==false){
    if(rollingTimer%(framesPerWiggle*2+1)>framesPerWiggle){ drawGhost(s3ghX,height/2,2,color(255,0,0),"left","torn",false,false); }
    else{ drawGhost(s3ghX,height/2,2,color(255,0,0),"left","torn",false,true); }
  } else if(s3ghReverse==true){
    
    if(slugTimer<7){ drawSlug(s3ghX,height/2,2,true); }
    else{ drawSlug(s3ghX,height/2,2,false); }
    if(slugTimer>=14){ slugTimer=0; }
    
    slugTimer++;
  }
  if(s3ghReverse==true && s3ghX>6*width/5){
    mode=sceneDest;
    s3mouthTime = 0;
    s3slugTimer = 0;
    s3timer = 0;
    slugTimer = 0;
    s3ghReverse = false;
  }
}

void runMovie(){
  background(0,0,0);
  //draw ghosts
    drawGhost(width/5,height/4,6,color(255,0,0),"right","standard",false,false);
    drawGhost(2*width/5,height/4,6,color(255,184,255),"right","standard",false,false);
    drawGhost(3*width/5,height/4,6,color(0,255,255),"left","standard",false,false);
    drawGhost(4*width/5,height/4,6,color(255,184,82),"left","standard",false,false);
  //draw top two entities and ghosts
    fill(255,255,0);
    ellipse(width/3,height/12,84,84);
    fill(0,0,0);
    arc(width/3-8,height/12,102,96,-PI/4,PI/4);
    drawGhost(2*width/3,height/12,6,color(255,0,0),"right","frightened",false,false);
    fill(255,255,255);
    ellipse(0.41*width,height/12,10,10);
    ellipse(0.45*width,height/12,10,10);
    ellipse(0.49*width,height/12,10,10);
    ellipse(0.53*width,height/12,10,10);
    ellipse(0.57*width,height/12,10,10);
  //draw fruit
    //fruit
      drawCherry(width/9,0.4*height,4);
      drawStrawberry(2*width/9,0.4*height,4);
      drawOrange(3*width/9,0.4*height,4);
      drawApple(4*width/9,0.4*height,4);
      drawGrapes(5*width/9,0.4*height,4);
      drawGalaxian(6*width/9,0.4*height,4);
      drawBell(7*width/9,0.4*height,4);
      drawKey(8*width/9,0.4*height,4);
  //drawing the scenes
};

void runDev(){
}
