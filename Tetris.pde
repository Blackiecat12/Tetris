int gamestate;
int time = 0;
Visual visual;
Piece tPiece = new Piece();
ArrayList<Integer> usedPieces = new ArrayList();

void setup() {
  fullScreen();
  frameRate(60);
  gamestate = 0;
  visual = new Visual();
  rectMode(CENTER);
}


/*
  Gamestate changes the game to different parts.
 0 = start screen.
 1 = gameplay
 2 = exit screen
 */
void draw() {
  switch(gamestate) {

  case 0:
    visual.startMenu();
    break;

  case 1:
    visual.gameplay();
    visual.updateMap(tPiece);
    //time causes brick fall to increase. 
    time+=1;
    if (time==60) {
      //attempts update and if can then move on, else add to endPieces and new piece
      if (tPiece.update(0, 1)) {
        for (int i : tPiece.getPos()) {
          usedPieces.add(i);
          tPiece = new Piece();
        }
      }
      time=0;
    }
    break;

  default:
  }
}

/*
  Controls what happens when the mouse is pressed. Includes buttons.
 */
void mousePressed() {
  //checks button presses
  switch(gamestate) {

    //checks if start menu buttons pressed
  case 0:

    //changes effect based on what button press
    switch(visual.checkStartMenu()) {
    case 0:
      gamestate = 1;
      visual.createMap();
      break;

    default:
      //no press on button
    }
    break;

  default:
  }
}

/*
  Controls key presses. 90 = z, 88 = x, 67 = c, 32 = " ", 37 = <-, 39 = ->, 40 = \/, 28 = /\
 */
void keyPressed() {
  switch(keyCode) {
  case 90:
    tPiece.spin(-1);
    break;

  case 88: 
    tPiece.spin(1);
    break;

  case 67:
    //hold
    break;

  case 32: //hard drop
    for(int i = 0; i<20; i++){
      tPiece.update(0,1);
    }
    break;

  case 37:
    tPiece.moveLeft();
    break;

  case 39:
    tPiece.moveRight();
    break;

  case 40:
    tPiece.update(0,1);
    break;

  case 38: //hard drop
    for(int i = 0; i<20; i++){
      tPiece.update(0,1);
    }
    break;

  default:
    //unbound key
  }
}
