//changable
  //general
    int pixelsPerTile; //pixels for each tile, tiles are 28x36
    int framesPerWiggle; //frames until ghost changes its wiggle
    int freezeTimeLength;
    boolean peaceMode; //whether ghosts eat pacman
    int setFrameRate;
  //movement
    float maxSpeed; //max speed that multiples below will be compared to

//unchanagable (i know)
  float[][] moveSpe = {
    //pac, gho, fri, tun
    {0.8, 0.75, 0.5, 0.4}, //level 1
    {0.9, 0.85, 0.55, 0.45}, //levels 2-4
    {1, 0.95, 0.6, 0.5}, //levels 5-20
    {0.9, 0.95, 0.6, 0.5} //levels 21+
  };
  int[][] releaseDots = {
    //pinky, inky, clyde
    {7,17,32}, //death
    {0,30,60}, //level 1
    {0,0,50}, //level 2
    {0,0,0}, //level 3+
  };
  int[] frightTime = {6,5,4,3,2, 2,5,2,2,1, 5,2,1,1,3, 1,1,0,1,0,0};
  
  float[][] modeTimers = {
    {7,20,7,20,5,20,5,10000000},
    {7,20,7,20,5,1033,0.17,10000000},
    {5,20,5,20,5,1037,0.17,10000000},
  };
