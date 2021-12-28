boolean mazeWhite = false;
void drawDots(){
  noStroke();
  for(int i=0; i<dotMap.length; i++){
    for(int j=0; j<dotMap[i].length; j++){
      if(dotMap[i][j]==1){
        fill(200,200,200);
        rect(j*pixelsPerTile+pixelsPerTile*0.5-2,i*pixelsPerTile+pixelsPerTile*0.5-1,pixelsPerTile*0.18,pixelsPerTile*0.18);
      }
      if(dotMap[i][j]==2){
        fill(200,200,200);
        ellipse(j*pixelsPerTile+pixelsPerTile*0.5, i*pixelsPerTile+pixelsPerTile*0.5,pixelsPerTile*0.6,pixelsPerTile*0.6);
      }
    }
  }
}

int[][] tileMap ={
  //0=nothing, 1=wall, 2=tunnel, 3=turn 28x36
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}, //top of maze wall
  {1,3,0,0,0,0,3,0,0,0,0,0,3,1,1,3,0,0,0,0,0,3,0,0,0,0,3,1},
  {1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1},
  {1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1},
  {1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1},
  {1,3,0,0,0,0,3,0,0,3,0,0,3,0,0,3,0,0,3,0,0,3,0,0,0,0,3,1},
  {1,0,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,0,1},
  {1,0,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,0,1},
  {1,3,0,0,0,0,3,1,1,3,0,0,3,1,1,3,0,0,3,1,1,3,0,0,0,0,3,1},
  {1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1}, //bottom wall of upper section
  {0,0,0,0,0,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,0,0,0,0,0},
  {0,0,0,0,0,1,0,1,1,3,0,0,3,0,0,3,0,0,3,1,1,0,1,0,0,0,0,0},
  {0,0,0,0,0,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,0,0,0,0,0},
  {1,1,1,1,1,1,0,1,1,0,1,0,0,0,0,0,0,1,0,1,1,0,1,1,1,1,1,1}, //top of tunnel wall
  {2,2,2,2,2,2,3,0,0,3,1,0,0,0,0,0,0,1,3,0,0,3,2,2,2,2,2,2},
  {1,1,1,1,1,1,0,1,1,0,1,0,0,0,0,0,0,1,0,1,1,0,1,1,1,1,1,1}, //bottom of tunnel wall
  {0,0,0,0,0,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,0,0,0,0,0},
  {0,0,0,0,0,1,0,1,1,3,0,0,0,0,0,0,0,0,3,1,1,0,1,0,0,0,0,0},
  {0,0,0,0,0,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,0,0,0,0,0},
  {1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1}, //top of bottom section wall
  {1,3,0,0,0,0,3,0,0,3,0,0,3,1,1,3,0,0,3,0,0,3,0,0,0,0,3,1},
  {1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1},
  {1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1},
  {1,3,0,3,1,1,3,0,0,3,0,0,3,0,0,3,0,0,3,0,0,3,1,1,3,0,3,1},
  {1,1,1,0,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,1,1,1},
  {1,1,1,0,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,1,1,1},
  {1,3,0,3,0,0,3,1,1,3,0,0,3,1,1,3,0,0,3,1,1,3,0,0,3,0,3,1},
  {1,0,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,0,1},
  {1,0,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,0,1},
  {1,3,0,0,0,0,3,0,0,0,0,0,3,0,0,3,0,0,0,0,0,0,0,0,0,0,3,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}, //bottom of maze wall
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
};


int[][] dotMap = {
  //0=nothing, 1=dot, 2=energizer
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, //top of maze wall
  
  {0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0},
  {0,1,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,1,0},
  {0,2,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,2,0},
  {0,1,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,1,0},
  {0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
  {0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0},
  {0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0},
  {0,1,1,1,1,1,1,0,0,1,1,1,1,0,0,1,1,1,1,0,0,1,1,1,1,1,1,0},
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0}, //bottom wall of upper section
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0},
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0},
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0},
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0}, //top of tunnel wall
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0},
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0}, //bottom of tunnel wall
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0},
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0},
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0},
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0}, //top of bottom section wall
  {0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0},
  {0,1,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,1,0},
  {0,1,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,1,0},
  {0,2,1,1,0,0,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,0,0,1,1,2,0},
  {0,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,0,0,0},
  {0,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,0,0,0},
  {0,1,1,1,1,1,1,0,0,1,1,1,1,0,0,1,1,1,1,0,0,1,1,1,1,1,1,0},
  {0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0},
  {0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0},
  {0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
  
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, //bottom of maze wall
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
};


int[][] templateDots = {
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, //top of maze wall
  
  {0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0},
  {0,1,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,1,0},
  {0,2,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,2,0},
  {0,1,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,1,0},
  {0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
  {0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0},
  {0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0},
  {0,1,1,1,1,1,1,0,0,1,1,1,1,0,0,1,1,1,1,0,0,1,1,1,1,1,1,0},
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0}, //bottom wall of upper section
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0},
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0},
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0},
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0}, //top of tunnel wall
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0},
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0}, //bottom of tunnel wall
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0},
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0},
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0},
  {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0}, //top of bottom section wall
  {0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0},
  {0,1,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,1,0},
  {0,1,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,1,0},
  {0,2,1,1,0,0,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,0,0,1,1,2,0},
  {0,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,0,0,0},
  {0,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,0,0,0},
  {0,1,1,1,1,1,1,0,0,1,1,1,1,0,0,1,1,1,1,0,0,1,1,1,1,1,1,0},
  {0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0},
  {0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0},
  {0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
  
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, //bottom of maze wall
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
};

//perpendicular line maze
void drawMaze(){
  float pix=pixelsPerTile;
  float cmt = pix/2-2;
  float cpt = pix/2+2;
  fill(0,0,200);
  stroke(0,0,200);
  strokeWeight(2);
  
  if(mazeWhite==true){
    fill(255,255,255);
    stroke(255,255,255);
  }
  
  
  //external wall, outer layer, top
  line(0,16*pix+cmt,5*pix+cmt,16*pix+cmt);
  line(5*pix+cmt,16*pix+cmt,5*pix+cmt,12*pix+cpt);
  line(5*pix+cmt,12*pix+cpt,cmt,12*pix+cpt);
  line(cmt,12*pix+cpt,cmt,3*pix+cmt);
  line(cmt,3*pix+cmt,width-cmt,3*pix+cmt);
  line(width-cmt,12*pix+cpt,width-cmt,3*pix+cmt);
  line(width-6*pix+cpt,12*pix+cpt,width-cmt,12*pix+cpt);
  line(width-6*pix+cpt,16*pix+cmt,width-6*pix+cpt,12*pix+cpt);
  line(width,16*pix+cmt,width-6*pix+cpt,16*pix+cmt);
  //external wall, inner layer, top
  line(0,16*pix+cpt,5*pix+cpt,16*pix+cpt);
  line(5*pix+cpt,16*pix+cpt,5*pix+cpt,12*pix+cmt);
  line(5*pix+cpt,12*pix+cmt,cpt,12*pix+cmt);
  line(cpt,12*pix+cmt,cpt,3*pix+cpt);
  line(cpt,3*pix+cpt,13*pix+cmt,3*pix+cpt);
  line(13*pix+cmt,3*pix+cpt,13*pix+cmt,7*pix+cpt);
  line(13*pix+cmt,7*pix+cpt,14*pix+cpt,7*pix+cpt); //halfway
  line(14*pix+cpt,7*pix+cpt,14*pix+cpt,3*pix+cpt);
  line(width-13*pix-cmt,3*pix+cpt,width-cpt,3*pix+cpt);
  line(width-cpt,3*pix+cpt,width-cpt,12*pix+cmt);
  line(width-cpt,12*pix+cmt,width-6*pix+cmt,12*pix+cmt);
  line(width-6*pix+cmt,12*pix+cmt,width-6*pix+cmt,16*pix+cpt);
  line(width-6*pix+cmt,16*pix+cpt,width,16*pix+cpt);
  //external wall, outer layer, bottom
  line(0,18*pix+cpt,5*pix+cmt,18*pix+cpt);
  line(5*pix+cmt,18*pix+cpt,5*pix+cmt,22*pix+cmt);
  line(5*pix+cmt,22*pix+cmt,cmt,22*pix+cmt);
  line(cmt,22*pix+cmt,cmt,height-2*pix-cmt);
  line(cmt,height-2*pix-cmt,width-cmt,height-2*pix-cmt);
  line(width-cmt,height-2*pix-cmt,width-cmt,22*pix+cmt);
  line(width-6*pix+cpt,22*pix+cmt,width-cmt,22*pix+cmt);
  line(width-6*pix+cpt,18*pix+cpt,width-6*pix+cpt,22*pix+cmt);
  line(width,18*pix+cpt,width-6*pix+cpt,18*pix+cpt);
  //external wall, inner layer, bottom
  line(0,18*pix+cmt,5*pix+cpt,18*pix+cmt);
  line(5*pix+cpt,18*pix+cmt,5*pix+cpt,22*pix+cpt);
  line(5*pix+cpt,22*pix+cpt,cpt,22*pix+cpt);
  line(cpt,22*pix+cpt,cpt,27*pix+cmt);
  line(cpt,27*pix+cmt,2*pix+cpt,27*pix+cmt);
  line(2*pix+cpt,27*pix+cmt,2*pix+cpt,28*pix+cpt); //first jog
  line(2*pix+cpt,28*pix+cpt,cpt,28*pix+cpt);
  line(cpt,28*pix+cpt,cpt,height-pix*2-cpt);
  line(cpt,height-pix*2-cpt,width-cpt,height-pix*2-cpt);
  line(width-cpt,28*pix+cpt,width-cpt,height-pix*2-cpt);
  line(width-2*pix-cpt,28*pix+cpt,width-cpt,28*pix+cpt);
  line(width-2*pix-cpt,27*pix+cmt,width-2*pix-cpt,28*pix+cpt); //second jog
  line(width-2*pix-cpt,27*pix+cmt,width-cpt,27*pix+cmt);
  line(width-cpt,27*pix+cmt,width-cpt,22*pix+cpt);
  line(width-cpt,22*pix+cpt,width-6*pix+cmt,22*pix+cpt);
  line(width-6*pix+cmt,22*pix+cpt,width-6*pix+cmt,18*pix+cmt);
  line(width-6*pix+cmt,18*pix+cmt,width,18*pix+cmt);
  
  noFill();
  //top 6 islands
  rect(2*pix+cmt,5*pix+cmt,3*pix+4,2*pix+4); //left
  rect(7*pix+cmt,5*pix+cmt,4*pix+4,2*pix+4);
  rect(2*pix+cmt,9*pix+cmt,3*pix+4,pix+4);
  rect(width-5*pix-cpt,5*pix+cmt,3*pix+4,2*pix+4); //right
  rect(width-11*pix-cpt,5*pix+cmt,4*pix+4,2*pix+4);
  rect(width-5*pix-cpt,9*pix+cmt,3*pix+4,pix+4);
  //top 3 Ts
  beginShape();
    vertex(7*pix+cmt,9*pix+cmt);
    vertex(8*pix+cpt,9*pix+cmt);
    vertex(8*pix+cpt,12*pix+cmt);
    vertex(11*pix+cpt,12*pix+cmt);
    vertex(11*pix+cpt,13*pix+cpt);
    vertex(8*pix+cpt,13*pix+cpt);
    vertex(8*pix+cpt,16*pix+cpt);
    vertex(7*pix+cpt,16*pix+cpt);
  endShape(CLOSE);
  beginShape();
    vertex(10*pix+cmt,9*pix+cmt);
    vertex(17*pix+cpt,9*pix+cmt);
    vertex(17*pix+cpt,10*pix+cpt);
    vertex(14*pix+cpt,10*pix+cpt);
    vertex(14*pix+cpt,13*pix+cpt);
    vertex(13*pix+cmt,13*pix+cpt);
    vertex(13*pix+cmt,10*pix+cpt);
    vertex(10*pix+cmt,10*pix+cpt);
  endShape(CLOSE);
  beginShape();
    vertex(20*pix+cpt,9*pix+cmt);
    vertex(19*pix+cmt,9*pix+cmt);
    vertex(19*pix+cmt,12*pix+cmt);
    vertex(16*pix+cmt,12*pix+cmt);
    vertex(16*pix+cmt,13*pix+cpt);
    vertex(19*pix+cmt,13*pix+cpt);
    vertex(19*pix+cmt,16*pix+cpt);
    vertex(20*pix+cpt,16*pix+cpt);
  endShape(CLOSE);
  //bottom rectangles
  rect(7*pix+cmt,18*pix+cmt,pix+4,4*pix+4);
  rect(19*pix+cmt,18*pix+cmt,pix+4,4*pix+4);
  rect(7*pix+cmt,24*pix+cmt,4*pix+4,pix+4);
  rect(16*pix+cmt,24*pix+cmt,4*pix+4,pix+4);
  //middle bottom Ts
  beginShape();
    vertex(10*pix+cmt,21*pix+cmt);
    vertex(17*pix+cpt,21*pix+cmt);
    vertex(17*pix+cpt,22*pix+cpt);
    vertex(14*pix+cpt,22*pix+cpt);
    vertex(14*pix+cpt,25*pix+cpt);
    vertex(13*pix+cmt,25*pix+cpt);
    vertex(13*pix+cmt,22*pix+cpt);
    vertex(10*pix+cmt,22*pix+cpt);
  endShape(CLOSE);
  beginShape();
    vertex(10*pix+cmt,27*pix+cmt);
    vertex(17*pix+cpt,27*pix+cmt);
    vertex(17*pix+cpt,28*pix+cpt);
    vertex(14*pix+cpt,28*pix+cpt);
    vertex(14*pix+cpt,31*pix+cpt);
    vertex(13*pix+cmt,31*pix+cpt);
    vertex(13*pix+cmt,28*pix+cpt);
    vertex(10*pix+cmt,28*pix+cpt);
  endShape(CLOSE);
  //upside down Ls
  beginShape();
    vertex(2*pix+cmt,24*pix+cmt);
    vertex(5*pix+cpt,24*pix+cmt);
    vertex(5*pix+cpt,28*pix+cpt);
    vertex(4*pix+cmt,28*pix+cpt);
    vertex(4*pix+cmt,25*pix+cpt);
    vertex(2*pix+cmt,25*pix+cpt);
  endShape(CLOSE);
  beginShape();
    vertex(25*pix+cpt,24*pix+cmt);
    vertex(22*pix+cmt,24*pix+cmt);
    vertex(22*pix+cmt,28*pix+cpt);
    vertex(23*pix+cpt,28*pix+cpt);
    vertex(23*pix+cpt,25*pix+cpt);
    vertex(25*pix+cpt,25*pix+cpt);
  endShape(CLOSE);
  beginShape();
    vertex(2*pix+cpt,30*pix+cmt);
    vertex(7*pix+cmt,30*pix+cmt);
    vertex(7*pix+cmt,27*pix+cmt);
    vertex(8*pix+cpt,27*pix+cmt);
    vertex(8*pix+cpt,30*pix+cmt);
    vertex(11*pix+cpt,30*pix+cmt);
    vertex(11*pix+cpt,31*pix+cpt);
    vertex(2*pix+cpt,31*pix+cpt);
  endShape(CLOSE);
  beginShape();
    vertex(25*pix+cpt,30*pix+cmt);
    vertex(20*pix+cpt,30*pix+cmt);
    vertex(20*pix+cpt,27*pix+cmt);
    vertex(19*pix+cmt,27*pix+cmt);
    vertex(19*pix+cmt,30*pix+cmt);
    vertex(16*pix+cmt,30*pix+cmt);
    vertex(16*pix+cmt,31*pix+cpt);
    vertex(25*pix+cpt,31*pix+cpt);
  endShape(CLOSE);
  //ghost house
  rect(10*pix+cmt,15*pix+cmt,7*pix+4,4*pix+4);
  rect(10*pix+cpt,15*pix+cpt,7*pix-4,4*pix-4);
  noStroke();
  fill(0,0,0);
  rect(13*pix+1,15*pix+cmt-1,2*pix-2,9);
  fill(250,170,235);
  rect(13*pix+1,15*pix+cmt+1,2*pix-2,4);
}
