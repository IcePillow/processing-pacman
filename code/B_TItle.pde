int titleTimer = 0;
int credits = 0;
int freezeTimer = 0;
boolean titleEnergizer = false;
float[] titGpos = new float[8];

boolean titleMouth=true;
float[] titlePac={0,0};
float[] titleB={0,0}, titleP={0,0}, titleI={0,0}, titleC={0,0};

void runTitle(){
  
  if(titleTimer<1){
    titlePac[0]=25*width/24;  titlePac[1]=5*height/8;
    titleB[0]=58*width/48;  titleB[1]=5*height/8;
    titleP[0]=61*width/48;  titleP[1]=5*height/8;
    titleI[0]=64*width/48;  titleI[1]=5*height/8;
    titleC[0]=67*width/48;  titleC[1]=5*height/8;
  } else if(titleTimer>1000){
    titlePac[1]=-height/2;
    titleB[1]=-height/2;
    titleP[1]=-height/2;
    titleI[1]=-height/2;
    titleC[1]=-height/2;
  }
  
  titleTimer++;
  
  //drawing things
  background(0,0,0);
  textAlign(CENTER, CENTER);
  textSize(20);
  
  //basic white text
  fill(255,255,255);
  text("High Score",width/2,12);
  text(highScore,width/2,34);
  text("1UP",width/5,12);
  text("00", width/5,34);
  text("2UP",4*width/5,12);
  text("00", 4*width/5,34);
  text("Credit " + credits, width/6,height-16);
  text("Character / Nickname", 4*width/7, height/6);
  
  //stationary ghosts
  if(titleTimer>30){
    drawGhost(width/7, height/4, 2, color(255,0,0), "right", "standard", false, false); }
  if(titleTimer>140){
    drawGhost(width/7, height/3, 2, color(255,184,255), "right", "standard", false, false); }
  if(titleTimer>250){
    drawGhost(width/7, 5*height/12, 2, color(0,255,255), "right", "standard", false, false); }
  if(titleTimer>360){
    drawGhost(width/7, height/2, 2, color(255,184,82), "right", "standard", false, false); }
    
  //colored text
  textAlign(LEFT,CENTER);
  if(titleTimer>60){
    fill(255,0,0);
    text("-Shadow",width/5,height/4); }
  if(titleTimer>90){
    text("\"Blinky\"",4*width/7,height/4); }
    
  if(titleTimer>170){
    fill(255,184,255);
    text("-Speedy",width/5,height/3); }
  if(titleTimer>200){
    text("\"Pinky\"",4*width/7,height/3); }
    
  if(titleTimer>280){
    fill(0,255,255);
    text("-Bashful",width/5,5*height/12); }
  if(titleTimer>310){
    text("\"Inky\"",4*width/7,5*height/12); }
    
  if(titleTimer>390){
    fill(255,184,82);
    text("-Pokey",width/5,height/2); }
  if(titleTimer>420){
    text("\"Clyde\"",4*width/7,height/2); }
    
  //dots
  if(titleTimer>460){
    fill(255,255,255);
    textAlign(CENTER,CENTER);
    ellipse(2*width/5,3*height/4,6,6);
    text("10pt",width/2,3*height/4-2);
    ellipse(2*width/5,4*height/5,14,14);
    text("50pt",width/2,4*height/5-2);
    if(titleEnergizer==false){
      ellipse(width/5,5*height/8,14,14);
    }
  }
  
  //draw moving entities
  
  textSize(14);
  if(titleEnergizer==false){ //blinky
    if(rollingTimer%(framesPerWiggle*2+1)>framesPerWiggle){ drawGhost(titleB[0], titleB[1], 2, color(255,0,0), "left", "standard", false, false); }
    else{ drawGhost(titleB[0], titleB[1], 2, color(255,0,0), "left", "standard", false, true); }
  } else if(titleEnergizer==true && titleB[0]-20>titlePac[0]){
    if(rollingTimer%(framesPerWiggle*2+1)>framesPerWiggle){ drawGhost(titleB[0], titleB[1], 2, color(255,0,0), "right", "frightened", false, false); }
    else{ drawGhost(titleB[0], titleB[1], 2, color(255,0,0), "right", "frightened", false, true); }
  } else if(titlePac[0]<width){
    fill(0,0,255);
    text("200",titleB[0],titleB[1]);
  }
  if(titleEnergizer==false){ //pinky
    if(rollingTimer%(framesPerWiggle*2+1)>framesPerWiggle){ drawGhost(titleP[0], titleP[1], 2, color(255,184,255), "left", "standard", false,false); }
    else{ drawGhost(titleP[0], titleP[1], 2, color(255,184,255), "left", "standard", false, true); }
  }else if(titleEnergizer==true && titleP[0]-20>titlePac[0]){
    if(rollingTimer%(framesPerWiggle*2+1)>framesPerWiggle){ drawGhost(titleP[0], titleP[1], 2, color(255,184,255), "right", "frightened", false,false); }
    else{ drawGhost(titleP[0], titleP[1], 2, color(255,184,255), "left", "frightened", false, true); }
  }else if(titlePac[0]<width){
    fill(0,0,255);
    text("400",titleP[0],titleP[1]);
  }
  if(titleEnergizer==false){ //inky
    if(rollingTimer%(framesPerWiggle*2+1)>framesPerWiggle){ drawGhost(titleI[0], titleI[1], 2, color(0,255,255), "left", "standard", false,false); }
    else{ drawGhost(titleI[0], titleI[1], 2, color(0,255,255), "left", "standard", false,true); }
  }else if(titleEnergizer==true && titleI[0]-20>titlePac[0]){
    if(rollingTimer%(framesPerWiggle*2+1)>framesPerWiggle){ drawGhost(titleI[0], titleI[1], 2, color(0,255,255), "right", "frightened", false,false); }
    else{ drawGhost(titleI[0], titleI[1], 2, color(0,255,255), "left", "frightened", false,true); }
  }else if(titlePac[0]<width){
    fill(0,0,255);
    text("800",titleI[0],titleI[1]);
  }
  if(titleEnergizer==false){ //clyde
    if(rollingTimer%(framesPerWiggle*2+1)>framesPerWiggle){ drawGhost(titleC[0], titleC[1], 2, color(255,184,82), "left", "standard", false, false); }
    else{ drawGhost(titleC[0], titleC[1], 2, color(255,184,82), "left", "standard", false, true); }
  }else if(titleEnergizer==true && titleC[0]-20>titlePac[0]){
    if(rollingTimer%(framesPerWiggle*2+1)>framesPerWiggle){ drawGhost(titleC[0], titleC[1], 2, color(255,184,82), "right", "frightened", false, false); }
    else{ drawGhost(titleC[0], titleC[1], 2, color(255,184,82), "left", "frightened", false, true); }
  }else if(titlePac[0]<width){
    fill(0,0,255);
    text("1600",titleC[0],titleC[1]);
  }
  
  fill(255,255,0);
  ellipse(titlePac[0], titlePac[1], 30, 30); //draw pac body
  if(titleTimer%14>7){ titleMouth=true; } //draw pac mouth
  else{ titleMouth=false; }
  if(titleMouth==true && titleEnergizer==false){
    fill(0,0,0);
    arc(titlePac[0]+3,titlePac[1],39,34,3*PI/4,5*PI/4);
  } else if(titleEnergizer==true && titleMouth==true){
    fill(0,0,0);
    arc(titlePac[0]-3,titlePac[1],39,34,7*PI/4,9*PI/4);
  }
  
  //move the entities
  if(titleTimer>460 && titleEnergizer==false){
    titlePac[0]-=1.5;
    titleB[0]-=1.7;
    titleP[0]-=1.7;
    titleI[0]-=1.7;
    titleC[0]-=1.7;
  } else if(titleTimer>460){
    titlePac[0]+=1.9;
    if(titleB[0]-20>titlePac[0]){ titleB[0]+=1.2; }
    if(titleP[0]-20>titlePac[0]){ titleP[0]+=1.2; }
    if(titleI[0]-20>titlePac[0]){ titleI[0]+=1.2; }
    if(titleC[0]-20>titlePac[0]){ titleC[0]+=1.2; }
  }
  
  if(titlePac[0]<width/5+10){
    titleEnergizer=true;
  }
  
  //final title
  if(titlePac[0]>width+pixelsPerTile && titleEnergizer==true){
    textAlign(CENTER,CENTER);
    textSize(48);
    fill(255,255,0);
    text("Pa -Man",width/2,5*height/8);
    ellipse(0.424*width,0.635*height,48,48);
    fill(0,0,0);
    arc(0.424*width-3,0.635*height,56,50,-PI/4,PI/4);
    
    //fruit
    drawCherry(width/9,7*height/8,2);
    drawStrawberry(2*width/9,7*height/8,2);
    drawOrange(3*width/9,7*height/8,2);
    drawApple(4*width/9,7*height/8,2);
    drawGrapes(5*width/9,7*height/8,2);
    drawGalaxian(6*width/9,7*height/8,2);
    drawBell(7*width/9,7*height/8,2);
    drawKey(8*width/9,7*height/8,2);
      //scores
    textSize(10);
    fill(255,255,255);
    text(100,width/9,0.91*height);
    text(300,2*width/9,0.91*height);
    text(500,3*width/9,0.91*height);
    text(700,4*width/9,0.91*height);
    text(1000,5*width/9,0.91*height);
    text(2000,6*width/9,0.91*height);
    text(3000,7*width/9,0.91*height);
    text(5000,8*width/9,0.91*height);
    
    textSize(20);
    fill(255,255,255);
    text("Press TAB", 4*width/5,height-16);
  }
  if(titleTimer>1600 && credits==0){
    mode="attract";
    topTipInd = int(random(0,topTips.length));
  }
}

void runPause(){
  background(0,0,0);
  //pause text
    textAlign(CENTER,CENTER);
    textSize(48);
    fill(255,255,0);
    text("Pause",width/2,36);
  //controls
    textAlign(LEFT,CENTER);
    fill(255,255,255);
    textSize(14);
    text("- TAB to pause or unpause\n- SPACE to insert coin\n- ENTER to play\n- ARROWS to move\n- DELETE to full reset",width/12,height/5);
  //control pics
      //arrows
        fill(200,200,200);
        stroke(100,100,100);
        strokeWeight(2);
        rect(0.7*width, height/6,30,30);
        rect(0.7*width, height/6+30,30,30);
        rect(0.7*width-30, height/6+30,30,30);
        rect(0.7*width+30, height/6+30,30,30);
        noStroke();
        fill(0,0,0);
        triangle(0.7*width+15,height/6+8,0.7*width+22,height/6+22,0.7*width+8,height/6+22);
        triangle(0.7*width-22,height/6+45,0.7*width-8,height/6+38,0.7*width-8,height/6+52);
        triangle(0.7*width+15,height/6+52,0.7*width+22,height/6+38,0.7*width+8,height/6+38);
        triangle(0.7*width+52,height/6+45,0.7*width+38,height/6+38,0.7*width+38,height/6+52);
   //config
     textAlign(CENTER,CENTER);
     fill(0,0,255);
     textSize(20);
     text("Config",0.5*width,0.32*height);
     textAlign(RIGHT,CENTER);
     textSize(12);
     text("Size:\nPeace:\nMax Speed:\nWiggles/frame:\nFreeze time:",0.5*width-5,0.415*height);
     textAlign(LEFT, CENTER);
     textSize(12);
     fill(255,0,0);
     text(pixelsPerTile+"\n"+peaceMode+"\n"+maxSpeed+"\n"+framesPerWiggle+"\n"+freezeTimeLength,0.5*width,0.415*height);
   //drawings
     drawGhost(0.15*width,8*height/13,3,color(255,0,0),"right","standard",false,false);
     drawGhost(0.15*width,9*height/13,3,color(255,184,255),"right","standard",false,false);
     drawGhost(0.15*width,10*height/13,3,color(0,255,255),"right","standard",false,false);
     drawGhost(0.15*width,11*height/13,3,color(255,184,82),"right","standard",false,false);
     drawGhost(0.15*width,12*height/13,3,color(255,184,82),"right","frightened",false,false);
     //ghost text
       textAlign(LEFT, CENTER);
       textSize(10);
       fill(255,255,0);
       ellipse(0.15*width,7*height/13,48,48);
       fill(0,0,0);
       arc(0.15*width-4,7*height/13,60,50,-PI/4,PI/4);
       fill(255,255,0);
       text(candidLines[candidInd][0],0.22*width,7*height/13);
       fill(255,0,0);
       text(candidLines[candidInd][1],0.22*width,8*height/13);
       fill(255,184,255);
       text(candidLines[candidInd][2],0.22*width,9*height/13);
       fill(0,255,255);
       text(candidLines[candidInd][3],0.22*width,10*height/13);
       fill(255,184,82);
       text(candidLines[candidInd][4],0.22*width,11*height/13);
       fill(0,0,255);
       text(candidLines[candidInd][5],0.22*width,12*height/13);
}
