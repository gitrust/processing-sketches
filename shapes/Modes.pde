


class Modes {
  int BASE = 0;
  int ADDNEW = 1;
  int SELECT= 2;
  int MOVING = 21;
  int mode = BASE;
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
    if (isSelect()) {
      return "SELECT";
    } else if (isAttach()) {
      return "ADD";
    } else if (isMoving()) {
      return "SELECT - > MOVING";
    }
    return "BASE";
  }

  public String getModeHelp() {
    if (isSelect()) {
      return "use mouse to select and move shapes";
    } else if (isAttach()) {
      return "c=Circle,r=Rect";
    } else if (isMoving()) {
       return "use mouse to move shape"; 
    }
    return "use keys: s=SELECT,a=ADD";
  }
}