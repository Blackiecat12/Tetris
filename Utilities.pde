/*
  This has the general utility classes:
 - Button
 - IndexTranslate
 */

/*
  It's a button. Position defined by the center. Rectangle buttons supported cause rectangle easy. 
 */
public class Button {

  //fields
  private PVector pos;
  private int bWidth;
  private int bHeight;
  private color col;
  private color outline;
  private String text;
  private int tSize = 30;

  //Rectangle constructor
  Button(float x, float y, int w, int h, color c, color s, String t) {
    this.pos = new PVector(x, y);
    this.bWidth = w;
    this.bHeight = h;
    this.col = c;
    this.outline = s;
    this.text = t;
  }

  //Rectangle constructor with text size
  Button(float x, float y, int w, int h, color c, color s, String t, int ts) {
    this.pos = new PVector(x, y);
    this.bWidth = w;
    this.bHeight = h;
    this.col = c;
    this.outline = s;
    this.text = t;
    this.tSize = ts;
  }

  //displays the button
  public void display() {
    //box
    fill(this.col);
    stroke(this.outline);
    rect(this.pos.x, this.pos.y, bWidth, bHeight);
    //text
    fill(0);
    textSize(this.tSize);
    textAlign(CENTER, CENTER);
    text(this.text, this.pos.x, this.pos.y);
  }

  //checks if mouse is within bounds of button
  public boolean checkPress() {
    return mouseX >= this.pos.x-bWidth/2 && mouseX <= this.pos.x+bWidth/2 && mouseY >= this.pos.y-bHeight/2 && mouseY <= this.pos.y+bHeight/2;
  }
}

/*
  This just translate pos of a piece into hashmap index. Also checks input index is against a border
 */
public static class IndexTranslate {

  //t is the type, r is the rotation, pos is position of piece.
  public static int[] getPos(int t, int r, PVector pos) {
    int[] index = {0, 0, 0, 0};
    switch(t) {

      //square all rotations are same
    case 0:
      index[0] = int(pos.x)-1 + ((int(pos.y)-1) * 10);
      index[1] = index[0] + 1;
      index[2] = index[0] + 10;
      index[3] = index[2] + 1;
      break;

      //S
    case 1:
      switch(r) {
      case 0:
        index[0] = int(pos.x) + ((int(pos.y)-1) * 10);
        index[1] = index[0] + 1;
        index[2] = index[0] + 9;
        index[3] = index[0] + 10;
        break;

      case 1:
        index[0] = int(pos.x) + ((int(pos.y)-1) * 10);
        index[1] = index[0] + 10;
        index[2] = index[0] + 11;
        index[3] = index[0] + 21;
        break;

      case 2:
        index[0] = int(pos.x) + ((int(pos.y)-1) * 10) + 10;
        index[1] = index[0] + 1;
        index[2] = index[0] + 9;
        index[3] = index[0] + 10;
        break;

      case 3:
        index[0] = int(pos.x)-1 + ((int(pos.y)-1) * 10);
        index[1] = index[0] + 10;
        index[2] = index[0] + 11;
        index[3] = index[0] + 21;
        break;
      }
      break;

      //Z
    case 2:
      switch(r) {
      case 0:
        index[0] = int(pos.x)-1 + ((int(pos.y)-1) * 10);
        index[1] = index[0] + 1;
        index[2] = index[0] + 11;
        index[3] = index[0] + 12;
        break;

      case 1:
        index[0] = int(pos.x)+1 + ((int(pos.y)-1) * 10);
        index[1] = index[0] + 9;
        index[2] = index[0] + 10;
        index[3] = index[0] + 19;
        break;

      case 2:
        index[0] = int(pos.x)-1 + ((int(pos.y)-1) * 10) + 10;
        index[1] = index[0] + 1;
        index[2] = index[0] + 11;
        index[3] = index[0] + 12;
        break;

      case 3:
        index[0] = int(pos.x) + ((int(pos.y)-1) * 10);
        index[1] = index[0] + 9;
        index[2] = index[0] + 10;
        index[3] = index[0] + 19;
        break;
      }
      break;

      //L
    case 3:
      switch(r) {
      case 0:
        index[0] = int(pos.x)+1 + ((int(pos.y)-1) * 10);
        index[1] = index[0] + 8;
        index[2] = index[0] + 9;
        index[3] = index[0] + 10;
        break;

      case 1:
        index[0] = int(pos.x) + ((int(pos.y)-1) * 10);
        index[1] = index[0] + 10;
        index[2] = index[0] + 20;
        index[3] = index[0] + 21;
        break;

      case 2:
        index[0] = int(pos.x)-1 + ((int(pos.y)-1) * 10) + 10;
        index[1] = index[0] + 1;
        index[2] = index[0] + 2;
        index[3] = index[0] + 10;
        break;

      case 3:
        index[0] = int(pos.x)-1 + ((int(pos.y)-1) * 10);
        index[1] = index[0] + 1;
        index[2] = index[0] + 11;
        index[3] = index[0] + 21;
        break;
      }
      break;

    case 4: //J
      switch(r) {
      case 0:
        index[0] = int(pos.x)-1 + ((int(pos.y)-1) * 10);
        index[1] = index[0] + 10;
        index[2] = index[0] + 11;
        index[3] = index[0] + 12;
        break;

      case 1:
        index[0] = int(pos.x) + ((int(pos.y)-1) * 10);
        index[1] = index[0] + 1;
        index[2] = index[0] + 10;
        index[3] = index[0] + 20;
        break;

      case 2:
        index[0] = int(pos.x)-1 + ((int(pos.y)-1) * 10) + 10;
        index[1] = index[0] + 1;
        index[2] = index[0] + 2;
        index[3] = index[0] + 12;
        break;

      case 3:
        index[0] = int(pos.x) + ((int(pos.y)-1) * 10);
        index[1] = index[0] + 10;
        index[2] = index[0] + 19;
        index[3] = index[0] + 20;
        break;
      }
      break;

      //I
    case 5:
      switch(r) {
      case 0:
        index[0] = int(pos.x)-1 + ((int(pos.y)-1) * 10);
        index[1] = index[0] + 1;
        index[2] = index[0] + 2;
        index[3] = index[0] + 3;
        break;

      case 1:
        index[0] = int(pos.x)+1 + ((int(pos.y)-1) * 10) -10;
        index[1] = index[0] + 10;
        index[2] = index[0] + 20;
        index[3] = index[0] + 30;
        break;

      case 2:
        index[0] = int(pos.x)-1 + ((int(pos.y)-1) * 10) + 10;
        index[1] = index[0] + 1;
        index[2] = index[0] + 2;
        index[3] = index[0] + 3;
        break;

      case 3:
        index[0] = int(pos.x) + ((int(pos.y)-1) * 10)-10;
        index[1] = index[0] + 10;
        index[2] = index[0] + 20;
        index[3] = index[0] + 30;
        break;
      }
      break;

      //T
    case 6:
      switch(r) {
      case 0:
        index[0] = int(pos.x) + ((int(pos.y)-1) * 10);
        index[1] = index[0] + 9;
        index[2] = index[0] + 10;
        index[3] = index[0] + 11;
        break;

      case 1:
        index[0] = int(pos.x) + ((int(pos.y)-1) * 10);
        index[1] = index[0] + 10;
        index[2] = index[0] + 11;
        index[3] = index[0] + 20;
        break;

      case 2:
        index[0] = int(pos.x)-1 + ((int(pos.y)-1) * 10)+10;
        index[1] = index[0] + 1;
        index[2] = index[0] + 2;
        index[3] = index[0] + 11;
        break;

      case 3:
        index[0] = int(pos.x) + ((int(pos.y)-1) * 10);
        index[1] = index[0] + 9;
        index[2] = index[0] + 10;
        index[3] = index[0] + 20;
        break;
      }
      break;
    default:
    }
    return index;
  }

  //checks on left Border
  public static boolean onLBorder(int t, int r, PVector pos) {
    if (t == 5) { //I
      if (r == 1 && (pos.x+1)%10 == 0) {
        return true;
      }
      if ((r == 0 || r == 2) && (pos.x-1)%10 == 0) {
        return true;
      }
      if (r == 3 && (pos.x)%10 == 0) {
        return true;
      }
    } else if ((r == 0 || r == 2 || r == 3) && (pos.x-1)%10 == 0) {
      return true;
    } else if (r==1 && (pos.x)%10 == 0) {
      return true;
    }
    return false;
  }

  //checks on right Border
  public static boolean onRBorder(int t, int r, PVector pos) {
    if (t == 0) { //O
      if ((pos.x-9)%10 == 0) {
        return true;
      } 
      return false;
    } else if (t == 5) { //I
      if ((r == 0 || r == 2 ) && (pos.x-7)%10 == 0) {
        return true;
      } else if (r == 3 && (pos.x-9)%10 == 0) {
        return true;
      } else if (r == 1 && (pos.x-8)%10 == 0) {
        return true;
      }
      return false;
    } else { //rest
      if ((r == 0 || r == 2 ) && (pos.x-8)%10 == 0) {
        return true;
      } else if (r == 3 && (pos.x-9)%10 == 0) {
        return true;
      } else if (r == 1 && (pos.x-8)%10 == 0) {
        return true;
      }
      return false;
    }
  }
}
