/*
  This class controls the cells and display of such.
 Each cell has a type, 0 = empty, 1-7 is the type of block it is part of
 */

public class Cell {

  //fields
  private int type;
  private float cSize = height*3/80; //one cell is 1/20th of 3/4 the height

  Cell() {
    this.type=0;
  }

  //displays cell on screen
  public void display(float x, float y) {
    switch(this.type) {
    case 0:
      fill(128);
      break;
    case 1: //square
      fill(233, 206, 0);
      break;
    case 2: //S
      fill(60, 155, 46);
      break;
    case 3: //Z
      fill(204, 11, 16);
      break;
    case 4: //J
      fill(218, 128, 0);
      break;
    case 5: //L
      fill(25, 98, 161);
      break;
    case 6: //I
      fill(92, 174, 182);
      break;
    case 7: //T
      fill(137, 64 ,135);
      break;
    default:
      fill(0);
    }
    stroke(0);
    rect(x, y, cSize, cSize);
  }

  //sets type of cell
  public void setType(int t) {
    this.type = t+1;
  }
}
