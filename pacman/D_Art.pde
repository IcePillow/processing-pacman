void drawCherry(float x, float y, float si){
  noStroke(); //11x11
  fill(255,0,0); //left fruit
  rect(x-4*si,y-si,3*si,5*si);
  rect(x-5*si,y,5*si,2*si);
  rect(x-5*si,y+2*si,si,si);
  fill(255,255,255); //left spot
  rect(x-4*si,y+2*si,si,si);
  fill(255,0,0); //right fruit
  rect(x+si,y+si,3*si,5*si);
  rect(x,y+2*si,5*si,3*si);
  fill(255,255,255); //right spot
  rect(x+si,y+4*si,si,si);
  fill(249,200,130); //stems
  rect(x+4*si,y-5*si,2*si,2*si);
  rect(x+2*si,y-4*si,2*si,si); //top
  rect(x,y-3*si,2*si,si);
  rect(x-si,y-2*si,si,si);
  rect(x-2*si,y-si,si,2*si);
  rect(x+3*si,y-3*si,si,2*si); //bottom
  rect(x+2*si,y-si,si,4*si);
}
void drawStrawberry(float x, float y, float si){
  noStroke(); //10x11
  fill(255,0,0); //berry
  rect(x-5*si,y-3*si,10*si,3*si);
  rect(x-4*si,y-4*si,8*si,6*si);
  rect(x-3*si,y+2*si,6*si,si);
  rect(x-2*si,y+3*si,4*si,si);
  rect(x-si,y+4*si,2*si,si);
  fill(0,240,0); //leaf
  rect(x-3*si,y-5*si,7*si,si);
  rect(x-si,y-4*si,3*si,si);
  rect(x,y-3*si,si,si);
  fill(255,255,255); //stem and spots
  rect(x,y-6*si,si,2*si);
  rect(x+2*si,y-4*si,si,si);
  rect(x-4*si,y-3*si,si,si);
  rect(x-2*si,y-3*si,si,si);
  rect(x+si,y-2*si,si,si);
  rect(x+3*si,y-2*si,si,si);
  rect(x-3*si,y-si,si,si);
  rect(x-si,y-si,si,si);
  rect(x+2*si,y,si,si);
  rect(x-3*si,y+si,si,si);
  rect(x-si,y+si,si,si);
  rect(x+si,y+2*si,si,si);
  rect(x-si,y+3*si,si,si);
}
void drawOrange(float x, float y, float si){
  noStroke();
  fill(244,176,66); //fruit
  rect(x-5*si,y-si,10*si,4*si);
  rect(x-4*si,y-2*si,8*si,7*si);
  rect(x-3*si,y-3*si,2*si,si);
  rect(x+2*si,y-3*si,si,si);
  rect(x-2*si,y+5*si,4*si,si);
  fill(0,255,0); //stem
  rect(x,y-3*si,si,si);
  rect(x-si,y-4*si,3*si,si);
  rect(x,y-5*si,3*si,si);
}
void drawApple(float x, float y, float si){
  noStroke(); //10x11
  fill(255,0,0); //fruit
  rect(x-4*si,y-2*si,10*si,5*si);
  rect(x-3*si,y-3*si,8*si,8*si);
  rect(x-2*si,y+5*si,2*si,si);
  rect(x+2*si,y+5*si,2*si,si);
  rect(x+2*si,y-4*si,2*si,si);
  fill(255,255,255); //spots
  rect(x-3*si,y-si,si,2*si);
  rect(x-2*si,y-2*si,si,si);
  fill(0,255,0); //stem
  rect(x-3*si,y-5*si,3*si,si);
  rect(x-2*si,y-4*si,4*si,si);
  rect(x,y-3*si,si,si);
  rect(x+si,y-5*si,si,si);
}
void drawGrapes(float x, float y, float si){
  noStroke(); //9x11
  fill(0,255,0); //main body
  rect(x-si,y-4*si,3*si,si);
  rect(x-3*si,y-3*si,7*si,si);
  rect(x-4*si,y-2*si,9*si,2*si);
  rect(x-5*si,y,11*si,3*si);
  rect(x-4*si,y+3*si,9*si,2*si);
  rect(x-3*si,y+5*si,7*si,si);
  rect(x-si,y+6*si,3*si,si);
  fill(66,244,223); //stem
  rect(x,y-5*si,si,si);
  rect(x-2*si,y-6*si,5*si,si);
  rect(x-3*si,y-7*si,si,si);
  fill(120,20,20); //reds
  rect(x,y-4*si,si,si);
  rect(x-2*si,y-2*si,si,si);
  rect(x+si,y-si,si,si);
  rect(x-4*si,y,si,si);
  rect(x-si,y+si,si,si);
  rect(x+3*si,y+si,si,si);
  rect(x-4*si,y+2*si,si,si);
  rect(x-si,y+3*si,si,si);
  rect(x+si,y+3*si,si,si);
  fill(76,255,233); //spots
  rect(x,y-3*si,si,si);
  rect(x-3*si,y-2*si,si,si);
  rect(x-si,y-2*si,si,si);
  rect(x+3*si,y-2*si,si,si);
  rect(x-2*si,y-si,si,si);
  rect(x+2*si,y-si,si,si);
  rect(x-3*si,y,si,si);
  rect(x+si,y,si,si);
  rect(x+3*si,y,si,si);
  rect(x,y+si,si,si);
  rect(x+4*si,y+si,si,si);
  rect(x-3*si,y+2*si,si,si);
  rect(x+si,y+2*si,si,si);
  rect(x-2*si,y+3*si,si,si);
  rect(x,y+3*si,si,si);
  rect(x+2*si,y+3*si,si,si);
  rect(x-si,y+4*si,si,si);
  rect(x+3*si,y+4*si,si,si);
  rect(x-2*si,y+5*si,si,si);
  rect(x+2*si,y+5*si,si,si);
  rect(x+si,y+6*si,si,si);
}
void drawGalaxian(float x, float y, float si){
  noStroke(); //11x11
  fill(255,255,0);
  rect(x,y-2*si,si,8*si);
  rect(x-4*si,y-3*si,9*si,4*si);
  fill(255,0,0); //crown
  rect(x-si,y-2*si,si,si);
  rect(x+si,y-2*si,si,si);
  rect(x-3*si,y-3*si,7*si,si);
  rect(x-si,y-4*si,3*si,si);
  rect(x,y-5*si,si,si);
  fill(0,0,255); //arms
  rect(x-5*si,y-5*si,si,5*si); //left
  rect(x-4*si,y-2*si,si,3*si);
  rect(x-3*si,y-si,si,3*si);
  rect(x-2*si,y,si,3*si);
  rect(x-si,y+si,si,si);
  rect(x+5*si,y-5*si,si,5*si); //right
  rect(x+4*si,y-2*si,si,3*si);
  rect(x+3*si,y-si,si,3*si);
  rect(x+2*si,y,si,3*si);
  rect(x+si,y+si,si,si);
}
void drawBell(float x, float y, float si){
  noStroke(); //12x12
  fill(255,255,0);
  rect(x-5*si,y+3*si,12*si,4*si);
  rect(x-4*si,y,10*si,3*si);
  rect(x-3*si,y-3*si,8*si,3*si);
  rect(x-2*si,y-4*si,6*si,si);
  rect(x,y-5*si,2*si,si);
  fill(100,100,255); //hole
  rect(x-4*si,y+6*si,10*si,2*si);
  fill(255,255,255); //glint
  rect(x+si,y+6*si,2*si,2*si);
  fill(0,0,0); //crack
  rect(x-3*si,y+3*si,si,2*si);
  rect(x-2*si,y-si,si,3*si);
  rect(x-si,y-2*si,si,si);
  rect(x,y-4*si,2*si,si);
}
void drawKey(float x, float y, float si){
  noStroke(); //7x13
  fill(0,200,255); //handle
  rect(x-3*si,y-5*si,7*si,4*si);
  rect(x-si,y-6*si,3*si,si);
  fill(230,230,230); //metal
  rect(x-si,y-si,3*si,8*si);
  rect(x,y+6*si,si,si);
  rect(x+2*si,y,si,si);
  rect(x+2*si,y+4*si,si,si);
  fill(0,0,0); //holes
  rect(x-si,y-5*si,3*si,si);
  rect(x,y-si,si,7*si);
  rect(x+si,y+2*si,si,si);
}

void drawGhost(float x, float y, float si, color col, String dir, String mode, boolean flash,boolean wiggly){
  noStroke();
  if(mode=="frightened"){
    fill(0,0,255); //body
    if(flash==true){ fill(255,255,255); }
    rect(x-7*si,y,14*si,6*si);
    rect(x-6*si,y-3*si,12*si,3*si);
    rect(x-5*si,y-4*si,10*si,2*si);
    rect(x-4*si,y-5*si,8*si,2*si);
    rect(x-2*si,y-6*si,4*si,2*si);
    //wiggly bits bground
    rect(x-7*si,y+6*si,14*si,2*si);
    if(wiggly==false){
      fill(0,0,0); //wiggly bits cover up
      rect(x-6*si,y+7*si,3*si,si);
      rect(x-5*si,y+6*si,si,si);
      rect(x-si,y+6*si,2*si,2*si);
      rect(x+3*si,y+7*si,3*si,si);
      rect(x+4*si,y+6*si,si,si);
    } else{
      fill(0,0,0);
      rect(x-7*si,y+7*si,si,si);
      rect(x-4*si,y+7*si,3*si,si);
      rect(x-3*si,y+6*si,si,si);
      rect(x+si,y+7*si,3*si,si);
      rect(x+2*si,y+6*si,si,si);
      rect(x+6*si,y+7*si,si,si);
    }
    fill(255,255,255); //eyes
    if(flash==true){ fill(255,0,0); }
    rect(x-3*si,y-si,2*si,2*si);
    rect(x+si,y-si,2*si,2*si);
    //mouth
    rect(x-6*si,y+4*si,si,si);
    rect(x-5*si,y+3*si,2*si,si);
    rect(x-3*si,y+4*si,2*si,si);
    rect(x-si,y+3*si,2*si,si);
    rect(x+si,y+4*si,2*si,si);
    rect(x+3*si,y+3*si,2*si,si);
    rect(x+5*si,y+4*si,si,si);
  }    
  else{
    //13x14
    if(mode!="return"){
      fill(col); //body
      rect(x-7*si,y,14*si,6*si);
      rect(x-6*si,y-3*si,12*si,3*si);
      rect(x-5*si,y-4*si,10*si,2*si);
      rect(x-4*si,y-5*si,8*si,2*si);
      rect(x-2*si,y-6*si,4*si,2*si);
      //wiggly bits bground
      rect(x-7*si,y+6*si,14*si,2*si);
      fill(0,0,0); //wiggly bits cover up
      if(wiggly==false){
        rect(x-6*si,y+7*si,3*si,si);
        rect(x-5*si,y+6*si,si,si);
        rect(x-si,y+6*si,2*si,2*si);
        rect(x+3*si,y+7*si,3*si,si);
        rect(x+4*si,y+6*si,si,si);
      } else{
        rect(x-7*si,y+7*si,si,si);
        rect(x-4*si,y+7*si,3*si,si);
        rect(x-3*si,y+6*si,si,si);
        rect(x+si,y+7*si,3*si,si);
        rect(x+2*si,y+6*si,si,si);
        rect(x+6*si,y+7*si,si,si);
      }
      if(mode=="torn"){
        fill(226,185,143);
        rect(x+6*si,y+si,si,si);
        rect(x+5*si,y+2*si,si,si);
        rect(x+4*si,y+si,si,si);
        rect(x+3*si,y+2*si,si,si); //
        rect(x+2*si,y+3*si,si,si);
        rect(x+3*si,y+4*si,si,si);
        rect(x+2*si,y+5*si,si,si);
        rect(x+3*si,y+6*si,si,si);
      }
    }
    //eyes
    if(dir=="left"){
      fill(255,255,255);
      rect(x-5*si,y-2*si,4*si,3*si);
      rect(x-4*si,y-3*si,2*si,5*si);
      rect(x+si,y-2*si,4*si,3*si);
      rect(x+2*si,y-3*si,2*si,5*si);
      fill(0,0,255);
      rect(x-5*si,y-si,2*si,2*si);
      rect(x+si,y-si,2*si,2*si);
    } else if(dir=="right"){
      fill(255,255,255);
      rect(x-4*si,y-2*si,4*si,3*si);
      rect(x-3*si,y-3*si,2*si,5*si);
      rect(x+2*si,y-2*si,4*si,3*si);
      rect(x+3*si,y-3*si,2*si,5*si);
      fill(0,0,255);
      rect(x-2*si,y-si,2*si,2*si);
      rect(x+4*si,y-si,2*si,2*si);
    } else if(dir=="up"){
      fill(255,255,255);
      rect(x-4*si,y-4*si,4*si,3*si);
      rect(x-3*si,y-5*si,2*si,5*si);
      rect(x+1*si,y-4*si,4*si,3*si);
      rect(x+2*si,y-5*si,2*si,5*si);
      fill(0,0,255);
      rect(x-3*si,y-5*si,2*si,2*si);
      rect(x+2*si,y-5*si,2*si,2*si);
    } else if(dir=="down"){
      fill(255,255,255);
      rect(x-4*si,y-1*si,4*si,3*si);
      rect(x-3*si,y-2*si,2*si,5*si);
      rect(x+1*si,y-1*si,4*si,3*si);
      rect(x+2*si,y-2*si,2*si,5*si);
      fill(0,0,255);
      rect(x-3*si,y+si,2*si,2*si);
      rect(x+2*si,y+si,2*si,2*si);
    }
  }
}
void drawSlug(float x, float y, float si, boolean up){
  noStroke();
  if(up==true){
    fill(226,185,143); //body
      rect(x+4*si,y-3*si,7*si,si);
      rect(x+2*si,y-2*si,8*si,si);
      rect(x+si,y-si,8*si,si);
      rect(x,y,9*si,si);
      rect(x+si,y+si,7*si,si);
      rect(x+2*si,y+2*si,9*si,si);
      rect(x+3*si,y+3*si,8*si,si);
      rect(x+8*si,y+4*si,3*si,si);
    fill(0,255,255); //eye whites
      rect(x+5*si,y-5*si,4*si,2*si);
      rect(x+6*si,y-6*si,2*si,4*si);
      rect(x+9*si,y-6*si,2*si,4*si);
    fill(0,0,255); //pupils
      rect(x+7*si,y-5*si,2*si,2*si);
      rect(x+10*si,y-5*si,2*si,2*si);
    fill(255,0,0); //coat
      rect(x-2*si,y+si,3*si,si);
      rect(x-4*si,y+2*si,6*si,si);
      rect(x-9*si,y+2*si,3*si,si);
      rect(x-10*si,y+3*si,13*si,si);
      rect(x-11*si,y+4*si,13*si,si);
  } else if(up==false){
    fill(226,185,143); //body
      rect(x+2*si,y-3*si,7*si,2*si);
      rect(x+si,y-si,8*si,si);
      rect(x,y,9*si,2*si);
      rect(x+2*si,y+2*si,10*si,si);
      rect(x+3*si,y+3*si,9*si,si);
      rect(x+9*si,y+4*si,3*si,si);
    fill(255,0,0); //coat
      rect(x-si,y+2*si,3*si,si);
      rect(x-8*si,y+2*si,2*si,si);
      rect(x-9*si,y+3*si,12*si,si);
      rect(x-10*si,y+4*si,12*si,si);
    fill(0,255,255); //eye whites
      rect(x+4*si,y-5*si,4*si,2*si);
      rect(x+5*si,y-6*si,2*si,4*si);
      rect(x+8*si,y-6*si,2*si,4*si);
    fill(0,0,255);
      rect(x+6*si,y-5*si,2*si,2*si);
      rect(x+9*si,y-5*si,2*si,2*si);
  }
}
