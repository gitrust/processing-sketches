
int BASE = 0;
int ADD = 1;
int SELECT= 2;

class Modes {
  int mode = BASE;
  char lastkey = ' ';

  public void setKey(char key) {
    this.lastkey=key;

    if (key=='a') {
      this.mode= ADD;
    } else
      if (key=='s') {
        this.mode =SELECT;
      }
  }
  public  boolean isSelect() {
    return this.mode==SELECT;
  }
  public boolean isAttach() {
    return this.mode==ADD;
  }

  public String getModeText() {
    if (isSelect()) {
      return "SELECT";
    } else if (isAttach()) {
      return "ADD";
    }
    return "BASE";
  }

  public String getModeHelp() {
    if (isSelect()) {
      return "use mouse";
    } else if (isAttach()) {
      return "c=Circle,r=Rect";
    }
    return "use keys: s=SELECT,a=ADD";
  }
}