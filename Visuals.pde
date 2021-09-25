/*
  This class is a static class that provides methods that display parts of the game.
 Each gamestate has a display and an interactive method. 
 Start screen = startMenu(), displays buttons and general start screen,
 checkStartMenu(), checks if buttons have been clicked or not
 In game = gameplay(), displays each part of game screen.
 
 Each part has it's own array of buttons. In order:
 Start screen = {start button}
 */

public class Visual {

  //start menu fields
  Button[] startMenuButtons = {new Button(width/2, height/2, 200, 100, 255, 0, "Start", 40)};

  //gameplay fields
  private final int iSize = height/8; //size of displayed images
  private final int iBorder = height/32; //border width around images
  HashMap<Integer, Cell> cells = new HashMap();

  public void startMenu() {
    //background
    background(255);
    //Buttons
    for (Button b : startMenuButtons) {
      b.display();
    }
  }

  //method checks if start buttons pressed and returns output signalling which one
  public int checkStartMenu() {
    //checks through array
    for (int i = 0; i<startMenuButtons.length; i++) {
      if (startMenuButtons[i].checkPress()) {
        return i;
      }
    }
    //if none pressed return -1
    return -1;
  }

  //displays the screen in game
  public void gameplay() {
    //background
    background(255);
    //main areas
    this.displayNextShapes();
    this.displayHeldShape();
    this.displayGame();
  }

  //shows the next shapes to be displayed. Each is height/8 tall image with height/32 spacing all sides
  private void displayNextShapes() {
    stroke(0);
    fill(255);
    rect(width*7/9, height/2, iSize + 2*iBorder, 3*iSize + 4*iBorder);
    //places for next pieces
    for (int i = 0; i<3; i++) {
      rect(width*7/9, height/4 + iBorder + iSize/2 + i*(iBorder+iSize), iSize, iSize);
    }
  }

  //shows held shape
  private void displayHeldShape() {
    stroke(0);
    fill(255);
    rect(width*2/9, height*2/9, iSize+2*iBorder, iSize+2*iBorder);
    //image next piece
    rect(width*2/9, height*2/9, iSize, iSize);
  }

  //actual gameplay area. 10x20 cells. defined by height
  private void displayGame() {
    stroke(0);
    fill(255);
    rect(width/2, height/2, height*3/80*10, height*3/80*20); //the height is done like so in order to fix the integer error
    //displays each cell, variables offset the drawing to start of grid
    float cS = height*3/4*1/20;
    float xStart = width/2 - 9.0/2 * cS;
    float yStart = (height - height*3/80*20) / 2.0 +cS/2; //fixes offset problem when dealing with the top of grid
    for (int i = 0; i<200; i++) {
      int xPos = i%10; //how far across grid.
      int yPos = i/10; //how far down grid
      cells.get(i).display(xStart + xPos*cS, yStart + yPos*cS);
    }
  }

  //initialises cells
  public void createMap() {
    //creates the 200 cells in the tetris grid from top right, read right->down
    for (int i = 0; i<200; i++) {
      cells.put(i, new Cell());
    }
  }

  //updates map with given piece
  public void updateMap(Piece piece) {
    int[] index = piece.getPos();
    int[] lastIndex = {0, 0, 0, 0};
    if (piece.getLastPos() != null) {
      if (!index.equals(lastIndex)) {
        lastIndex = piece.getLastPos();
        for (int i : lastIndex) {
          if (i>=0 && i <=199) {
            cells.get(i).setType(-1);
          }
        }
      }
    }
    //new pos
    for (int i : index) {
      if (i>=0 && i <=199) {
        cells.get(i).setType(piece.getType());
      }
    }
    piece.setLastPos(index);
  }
  
  //checks if given index has overlap with usedPieces
  public boolean checkOverlap(int[] index){
    for(int i : index){
      if(usedPieces.contains(i) || i >=200){
        return true;
      }
    }
    return false;
  }
}
