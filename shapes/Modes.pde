


class Modes {
  int BASE = 0;
  int ADDNEW = 1;
  int SELECT= 2;
  int MOVING = 21;
  int mode = ADDNEW;
  char lastkey = ' ';

  public void setKey(char key) {
    this.lastkey=key;

    if (key=='a') {
      this.mode= ADDNEW;
    } else
      if (key=='s') {
        this.mode =SELECT;
      } else if (key =='m' && isSelect()) {
        this.mode = MOVING;
      }
  }

  public  boolean isSelect() {
    return this.mode==SELECT;
  }

  public boolean isAttach() {
    return this.mode==ADDNEW;
  }
  
  public boolean isMoving() {
     return this.mode==MOVING; 
  }

  public String getModeText() {
    return "s = SELECT, a = ADD";
  }

  public String getModeHelp() {
    if (isSelect()) {
      return "SELECT: use mouse to select and move shapes";
    } else if (isAttach()) {
      return "ADD: c=Circle,r=Rect";
    } else if (isMoving()) {
       return "MOVE: use mouse to move shape"; 
    }
    return "use keys: s=SELECT,a=ADD";
  }
}