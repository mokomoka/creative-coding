class Rail {
  int x, y, type;
  boolean canConnectR, canConnectL, canConnectU, canConnectD;

  Rail(int x, int y, int type) {
    this.x = x;
    this.y = y;
    this.type = type;

    if (type == 0 || type == 4 || type == 5) {
      canConnectR = true;
    } else {
      canConnectR = false;
    }
    if (type == 0 || type == 2 || type == 3) {
      canConnectL = true;
    } else {
      canConnectL = false;
    }
    if (type == 1 || type == 3 || type == 4) {
      canConnectU = true;
    } else {
      canConnectU = false;
    }
    if (type == 1 || type == 2 || type == 5) {
      canConnectD = true;
    } else {
      canConnectD = false;
    }
  }

  void drawRail() {
    int len_half = len/2;
    strokeWeight(16);
    strokeCap(SQUARE);
    switch(type) {
    case 0:
      line(x-len_half, y, x+len_half, y);
      break;
    case 1:
      line(x, y-len_half, x, y+len_half);
      break;
    case 2:
      bezier(x-len_half, y, x, y, x, y, x, y+len_half);
      break;
    case 3:
      bezier(x-len_half, y, x, y, x, y, x, y-len_half);
      break;
    case 4:
      bezier(x, y-len_half, x, y, x, y, x+len_half, y);
      break;
    case 5:
      bezier(x, y+len_half, x, y, x, y, x+len_half, y);
      break;
    }
  }

  int[] connectTypes(String direction) {
    int result[] = new int[3];
    if (direction.equals("left") && canConnectL) {
      result[0] = 0;
      result[1] = 4;
      result[2] = 5;
    } else if (direction.equals("right") && canConnectR) {
      result[0] = 0;
      result[1] = 2;
      result[2] = 3;
    } else if (direction.equals("up") && canConnectU) {
      result[0] = 1;
      result[1] = 2;
      result[2] = 5;
    } else if (direction.equals("down") && canConnectD) {
      result[0] = 1;
      result[1] = 3;
      result[2] = 4;
    } else {
      result[0] = result[1] = result[2] = -1;
    }
    return result;
  }
  
  boolean getL(){
    return canConnectL;
  }
  boolean getR(){
    return canConnectR;
  }
  boolean getU(){
    return canConnectU;
  }
  boolean getD(){
    return canConnectD;
  }
}
