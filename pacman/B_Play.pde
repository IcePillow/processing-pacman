void runPlay(){
  
  //update and change ghosts
    //updates
  Blinky.gUpdate();
  Pinky.gUpdate();
  Inky.gUpdate();
  Clyde.gUpdate();
    //move
  Blinky.gMove();
  Pinky.gMove();
  Inky.gMove();
  Clyde.gMove();
    //timers
  if(frightTimer>0){
    frightTimer--;
  } else if(frightTimer==0){
    frightTimer=-1;
    undoFrighten();
  } else if(frightTimer<0 && freezeTimer==0){
    standardGhost();
  }
  //bonus life
  if(gotExtraLife==false&&score>=10000){
    gotExtraLife=true;
    livesRem+=1;
  }
  //update and change pacman
  updatePac();
  movePac();
  pacEat();
  //update score
  if(score>highScore){
    highScore=score;
  }
  //freeze timer
  if(freezeTimer>0){ freezeTimer--; }
  //draw things
    //maze stuff
  background(0,0,0);
  drawMaze();
  drawDots();
    //extra
  drawExtra();
    //fruit
  if(showFruit==true){ showFruit(); }
  else if(showFruitText==true){ showFruitText(); }
    //eat score
  for(int i=0; i<ghostEatText.length; i++){
    if(ghostEatText[i][0]>0){
      ghostEatText[i][0]--;
      fill(0,0,200);
      textSize(8);
      text( int(pow(2,i+1)*100), pixelsPerTile*ghostEatText[i][1]+pixelsPerTile*0.5, pixelsPerTile*ghostEatText[i][2]+pixelsPerTile*0.5);
    }
  }
    //entities
  drawPac();
  Blinky.gDraw();
  Pinky.gDraw();
  Inky.gDraw();
  Clyde.gDraw();
}

void drawExtra(){
  //text
    textAlign(CENTER,CENTER);
    textSize(16);
    fill(255,255,255);
    text("High Score", width/2, 20);
    text(highScore, width/2,40);
    text("1UP", width/5, 20);
    text(score, width/5, 40);
    text("2UP", 4*width/5, 20);
    text("", 4*width/5, 40);
  //fruit bar
    for(int i=0; i<fruitBar.length; i++){
      if(fruitBar[i]=="cherry"){ drawCherry(width-2*pixelsPerTile*i-pixelsPerTile,height-pixelsPerTile, 2); }
      else if(fruitBar[i]=="strawberry"){ drawStrawberry(width-2*pixelsPerTile*i-pixelsPerTile,height-pixelsPerTile, 2); }
      else if(fruitBar[i]=="orange"){ drawOrange(width-2*pixelsPerTile*i-pixelsPerTile,height-pixelsPerTile, 2); }
      else if(fruitBar[i]=="apple"){ drawApple(width-2*pixelsPerTile*i-pixelsPerTile,height-pixelsPerTile, 2); }
      else if(fruitBar[i]=="grapes"){ drawGrapes(width-2*pixelsPerTile*i-pixelsPerTile,height-pixelsPerTile, 2); }
      else if(fruitBar[i]=="galaxian"){ drawGalaxian(width-2*pixelsPerTile*i-pixelsPerTile,height-pixelsPerTile, 2); }
      else if(fruitBar[i]=="bell"){ drawBell(width-2*pixelsPerTile*i-pixelsPerTile,height-pixelsPerTile, 2); }
      else if(fruitBar[i]=="key"){ drawKey(width-2*pixelsPerTile*i-pixelsPerTile,height-pixelsPerTile, 2); }
    }
  //lives
  for(int i=0; i<livesRem; i++){
    fill(255,255,0);
    ellipse((1+i)*30, height-pixelsPerTile, pixelsPerTile*1.2, pixelsPerTile*1.2);
    fill(0,0,0);
    arc((1+i)*30-2, height-pixelsPerTile, pixelsPerTile*1.2+8, pixelsPerTile*1.2, 7*PI/4, 9*PI/4);
  }
}
