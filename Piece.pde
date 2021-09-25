/*
  This is the class for the actual tetris brick/piece. They are stored by a PVector which corresponds to position on grid from top left. Have type and rotation. Rotation is 0->3 as up,left,down,right.
 0 = square
 */

public class Piece {

  //fields
  private int type;
  private PVector pos;
  private int rotation = 0;
  private int[] lastPos;

  Piece() {
    //randomiser
    int p = int(random(0, 8));
    if (p==7) { //add last piece checker
      p=int(random(0, 7));
    }
    this.type = 6;
    this.pos = new PVector(4, -1);
    if (this.type==0) {
      this.pos = new PVector(5, -1);
    }
  }

  //gets index of positions on the grid
  public int[] getPos() {
    int[] index = IndexTranslate.getPos(this.type, this.rotation, this.pos);
    return index;
  }

  //changes pos of brick if it won't collide. Otherwise it returns false
  public boolean update(int x, int y) {
    if (!this.checkCollision(x, y)) {
      this.pos.x+=x;
      this.pos.y+=y;
      return false;
    } 
    return true;
  }

  //checks if move will cause collision
  private boolean checkCollision(int x, int y) {
    //retrieves new index will be put into
    PVector newPos = new PVector(this.pos.x + x, this.pos.y + y);
    int[] newIndex = IndexTranslate.getPos(this.type, this.rotation, newPos);
    //check if index contains non 0 blocks
    return visual.checkOverlap(newIndex);
  }

  public void moveLeft() {
    //checks if against border and if new index overlaps anything
    PVector newPos = new PVector(this.pos.x - 1, this.pos.y);
    int[] newIndex = IndexTranslate.getPos(this.type, this.rotation, newPos);
    if (!IndexTranslate.onLBorder(this.type, this.rotation, this.pos) && !visual.checkOverlap(newIndex)) {
      this.pos.x-=1;
    }
  }

  public void moveRight() {
    //checks if against border and if new index overlaps anything
    PVector newPos = new PVector(this.pos.x + 1, this.pos.y);
    int[] newIndex = IndexTranslate.getPos(this.type, this.rotation, newPos);
    if (!IndexTranslate.onRBorder(this.type, this.rotation, this.pos) && !visual.checkOverlap(newIndex)) {
      this.pos.x+=1;
    }
  }

  //spins piece left or right
  public void spin(int x) {      
    int tempRotation = this.rotation+x;
    if (tempRotation<0) {
      tempRotation = 3;
    }
    if (tempRotation>3) {
      tempRotation = 0;
    }
    int[] newIndex = IndexTranslate.getPos(this.type, tempRotation, this.pos);
    //checks if valid rotation and that it is inside grid at end
    boolean outsideGrid = false;
    for (int i : newIndex) {
      if (i>199) {
        outsideGrid = true;
      }
    }
    if (!visual.checkOverlap(newIndex) && !outsideGrid) {
      this.rotation = tempRotation;
    }
  }

  //sets index of last positions
  public void setLastPos(int[] i) {
    this.lastPos = i;
  }
  //gets index of last pos
  public int[] getLastPos() {
    return this.lastPos;
  }
  public int getType() {
    return this.type;
  }
}
