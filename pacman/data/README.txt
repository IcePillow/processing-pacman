~Ownership~
- All code was written and is owned by Elliott Hendricks
- This is intended for private use and not for public distribution, the images of pac-man, the ghosts, and other associated images are property of their respective owners.
- Font is emulogic and owned by its respective owners, used because it is free.


~Gameplay~
- To see controls press TAB
- Very similar to 1980 original arcade but not an exact replica
- High scores are not saved when the game is closed


~Code Format~
- This was coded in Processing 3.4: Java Mode
- The functions and variables are loosely sorted into categories: the main, A (config), B (front end functions), C (back end functions, classes, and vars),  D (art and reference)
- The config includes some vars needed for occasional reference that, in theory, could be changed (ghost time blue)
- The string variable "mode" controls what is run in the draw loop, it follows like this:
	- At any time:
		- TAB takes the player to and from the pause screen
			- Pause stores lastMode to return to previous
		- BACKSPACE/DELETE resets to the title screen entirely
	- It starts on the title screen which progresses in its animation
	- Pressing SPACE inserts a coin and pressing ENTER takes the player to "load"
	- Load sets the variables and has the player wait 2 seconds before sending the player to "play"
	- If the player beats the level they are sent to "finished" which animates the maze with flashing and then sends them to either a cut scene or to "load"
		- The cut scenes store a destination mode to return to
	- If the player dies, they are sent to "death reset" which animates their death and then either sends them to "title" (if out of lives) or resets the play and sends the player to "load", skipping the "load" reset


~List of Main Functionalities~
PACMAN
-Import and load font
-Initialize mode, lastMode, score, level, rollingTimer, ghost objects
-Load in config
-Set frame rate
-Check for mode and call corresponding function
-Increase rollingTimer
-Take keyboard user input and check mode
-Define full reset which resets most variables, saving a few (e.g. high score)

A_CONFIG
-Define config variables
-Set arrays of values: moveSpe, releaseDots, frightTime, modeTimers

B_Play
-Runs the main gameplay function which includes:
	-Updating/moving ghosts
	-Changing ghost fright timer and freeze timer
	-Checking for extra life
	-Update/move/eat with pacman
	-Change high score
	-Draw maze, dots, extra surrounding stuff, fruit, entities
-Defines drawing extra stuff
	-Draw high score, player one score
	-Draw the fruit bar in the bottom right
	-Draw the lives

B_Scene
-Defines each of the three intermissions
-Scene 1
	-Moves pac and blinky to the left in normal forms with blinky catching up
	-Reverse their directions, increases pac size, makes blinky frightened
	-Sends player to sceneDest and resets vars
-Scene 2
	-Moves pac left with blinky following
	-Blinky gets caught in middle and costume rips
	-Sends player to sceneDest and resets vars
-Scene 3
	-Moves pac left with blinky following
	-Moves blinky right in slug form
	-Sends player to sceneDest and resets vars
-Defines runDev for development use

B_Title
-Initializes titleTimer, credits, freezeTimer, and title vars
-Draws extra and over time draws other things:
	-First the four ghosts with their names
	-Then pac moving left with ghosts following
	-Pac eats energizer and eats the four ghosts showing the scores
	-Main title shows:
		- Press TAB, fruit scores, big pac-man letters
-Sends player to attract if titleTimer gets large
-Defines runPause
	-Shows controls, config, ghosts, and jokes

B_Transition
-Defines runLoad
	-Resets vars if loadTimer<1
	-Draws paceman, maze, ghosts, and extra for two seconds
-Defines deathReset
	-Draws animation of pac dying
	-Checks if game should be over, if so sends to title with full reset
	-Otherwise sends player back to load with loadTimer=1
-Defines runFinished
	-Draws paceman and maze flashing
	-Sends player to cut scene or load
-Defines runAttract
	-Sets positions if overTimer=0 then moves ghosts
	-Displays game over and one tip

C_Ghost
-Defines chase/scatter vars and frightTimer
-Defines ghost class
	-Position, speed, tile, name, move mode, direction, color, flash, wiggle, target tile, release dots, release timer
	-gDraw: draws the ghost
	-gUpdate: changes ghost speed, wiggle, house mode, tile, target tile, calls gEat if needed, toggles flashing
	-gMove: moves ghost based on mode and calls gTurn when needed, moves across tunnels,
	-gTurn: checks target tile, calculates distance, chooses smallest allowed one, changes ghost direction
	-gReverse: changes ghost direction to opposite
	-gEat: checks if frightened and either changes to return and increases score or kills paceman
-Defines energizerEaten: changes ghost mode, reverse direction, sets frightTimer
-Defines standardGhost: checks and changes the time in the chase/scatter timer and changes ghost modes if needed
-Defines undoFrighten: changes ghost modes
-Defines target functions for blinky, pinky, inky, clyde

C_Pacman
-Defines dir, mouth, pos, tile, see, lives, mouth timer, ghosts eaten vars for packman
-Defines fruit showing vars, high score, input vars, got extra life, dots eaten
-Defines drawPac which draws ellipse and conversation with black arc depending on mouthTimer
-Defines updatePac which updates tile, path positioning, surrounding tiles, move direction
-Defines movePac which checks for freezeTimer and moves pac, stops pac when he hits a wall, moves pac through tunnel
-Defines pacEat which checks to eat pellets and energizers, calling energizerEaten when needed, and checks for end of level when dotsEaten>=244
-Defines showFruit which checks level, displays fruit, sets fruitScoreGain, changes fruitTimer
-Defines showFruitText which displays fruit text based on fruitTextTimer then resets it

C_TileMap
-Defines drawing the dots with 2 for loops
-Defines 2D array for the tile map of walls, tunnels, and turns
-Defines 2D array for the dot map of dots and energizers as well as templateDots for pointers
-Defines the maze drawing function with lines/rects

D_Art
-Defines draw functions for each fruit with x, y, and size variables
-Defines drawGhost
	-Takes x, y, size, color, direction, mode, flash, wiggly
-Defines drawSlug
	-Takes x, y, size, up (boolean for which slug img)

D_Reference
-Defines candidInd and topTipInd
-Defines candidLines (Strings[][]) and topTips (String[])