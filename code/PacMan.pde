PFont emulogic;
String mode = "title";
String lastMode = "";
int score = 0;
int level = 0;
int rollingTimer = 0;
String[] configLines = {};
Ghost Blinky, Pinky, Inky, Clyde;

void setup(){
  
  //set image
  PImage iconImg = loadImage("PacmanIcon.png");
  surface.setIcon(iconImg);
  
  //load config
  configLines = loadStrings("config.txt");
  pixelsPerTile = int(split(configLines[0]," ")[2]);
    surface.setSize(28*pixelsPerTile, 36*pixelsPerTile); //set size
  peaceMode = boolean(split(configLines[1]," ")[2]);
  maxSpeed = float(split(configLines[2]," ")[2]);
  freezeTimeLength = int(split(configLines[3]," ")[2]);
  framesPerWiggle  = int(split(configLines[4]," ")[2]);
  setFrameRate = int(split(configLines[5]," ")[2]);
  //load font
  emulogic = createFont("emulogic.ttf", 20);
  textFont(emulogic);
  //set frame rate
  frameRate(setFrameRate);
  //init objects
  Blinky = new Ghost("blinky", color(255,0,0));
  Pinky = new Ghost("pinky", color(255,184,255));
  Inky = new Ghost("inky", color(0,255,255));
  Clyde = new Ghost("clyde", color(255,184,82));
}

void draw(){
  rollingTimer++;
  if (mode=="title"){
    runTitle();
  } else if(mode=="load"){
    runLoad();
  } else if(mode=="play"){
    runPlay();
  } else if(mode=="death reset"){
    deathReset();
  } else if(mode=="finished"){
    runFinished();
  } else if(mode=="attract"){
    runAttract();
  } else if(mode=="scene 1"){
    runScene1();
  } else if(mode=="scene 2"){
    runScene2();
  } else if(mode=="scene 3"){
    runScene3();
  } else if(mode=="pause"){
    runPause();
  } else if(mode=="movie"){
    runMovie();
  } else if(mode=="dev"){
    runDev();
  }
}

void keyPressed(){
  
  if(key==BACKSPACE||key==DELETE){
    fullReset();
  }
  if(key==TAB && mode!="pause"){
    lastMode=mode;
    candidInd = int(random(0,candidLines.length));
    mode="pause";
  } else if(key==TAB && mode=="pause"){
    mode=lastMode;
  }
  
  if(mode=="title"){
    if(key==ENTER && credits>=1){
      mode="load";
      credits-=1;
    }
  }
  if(key==CODED){
    if(keyCode==LEFT){ lPress=true; }
    else if(keyCode==RIGHT){ rPress=true; }
    else if(keyCode==UP){ uPress=true; }
    else if(keyCode==DOWN){ dPress=true; }
  }
}
void keyReleased(){
  if(mode=="title"){
    if(key==32){ credits+=1; }
  } else if(mode=="attract"){
    if(key==32){
      credits+=1;
      attractTimer=0;
    }
  }
  if(key==CODED){
    if(keyCode==LEFT){ lPress=false; }
    else if(keyCode==RIGHT){ rPress=false; }
    else if(keyCode==UP){ uPress=false; }
    else if(keyCode==DOWN){ dPress=false; }
  }
}

void fullReset(){
  //general
    mode = "title";
    level = 0;
    score = 0;
    gotExtraLife = false;
    livesRem=2;
  //level arrays
    fruitBar = new String[0];
    curSpeeds = new float[]{0,0,0,0};
  //mode timers
    titleTimer=0;
    attractTimer=0;
    loadTimer=0;
  //title
    titleEnergizer = false;
    titGpos = new float[8];
    titleMouth=true;
    titlePac=new float[]{0,0};
    titleB=new float[]{0,0};
    titleP=new float[]{0,0};
    titleI=new float[]{0,0};
    titleC=new float[]{0,0};
  //ghost general
    gcsMode = "scatter"; //scatter or chase mode
    gcsStage = 0;
    gcsTimer = 0;
    frightTimer = -1;
  //pacman
    livesRem=2;
    fruitsShown[0]=false; fruitsShown[1] = false;
    showFruit=false;
    showFruitText=false;
    fruitScoreGain=0;
    fruitTimer=0;
    fruitTextTimer=0;
    dotsEaten=0;
    mouthTimer = 0;
    ghostsEaten = 0;
    ghostEatText = new int[][]{ //time, x, y
    {0,0,0},
    {0,0,0},
    {0,0,0},
    {0,0,0} };
}
