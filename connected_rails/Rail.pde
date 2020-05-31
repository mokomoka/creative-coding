class Rail {
  private int x, y, type;
  private boolean canConnectR, canConnectL, canConnectU, canConnectD;

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
    int space_rail = 16;
    int len_sleeper = space_rail + 8;
    int offset_sleeper = 8;
    int weight_rail = 8;
    int weight_sleeper = 8;
    color color_rail = #3b2f2b;
    color color_sleeper = #8a7365;
    noFill();

    switch(type) {
    case 0:
      strokeWeight(weight_sleeper);
      stroke(color_sleeper);
      line(x-len_half+offset_sleeper, y-len_sleeper, x-len_half+offset_sleeper, y+len_sleeper);
      line(x+offset_sleeper, y-len_sleeper, x+offset_sleeper, y+len_sleeper);
      strokeWeight(weight_rail);
      stroke(color_rail);
      line(x-len_half, y-space_rail, x+len_half, y-space_rail);
      line(x-len_half, y+space_rail, x+len_half, y+space_rail);
      break;
    case 1:
      strokeWeight(weight_sleeper);
      stroke(color_sleeper);
      line(x-len_sleeper, y-len_half+offset_sleeper, x+len_sleeper, y-len_half+offset_sleeper);
      line(x-len_sleeper, y+offset_sleeper, x+len_sleeper, y+offset_sleeper);
      strokeWeight(weight_rail);
      stroke(color_rail);
      line(x-space_rail, y-len_half, x-space_rail, y+len_half);
      line(x+space_rail, y-len_half, x+space_rail, y+len_half);
      break;
    case 2:
      strokeWeight(weight_sleeper);
      stroke(color_sleeper);
      line(x-len_half+offset_sleeper, y-len_sleeper, x-len_half+offset_sleeper, y+len_sleeper);
      line(x-len_sleeper, y+len_half-offset_sleeper, x+len_sleeper, y+len_half-offset_sleeper);
      strokeWeight(weight_rail);
      stroke(color_rail);
      bezier(x-len_half, y-space_rail, x+space_rail, y-space_rail, x+space_rail, y-space_rail, x+space_rail, y+len_half);
      bezier(x-len_half, y+space_rail, x-space_rail, y+space_rail, x-space_rail, y+space_rail, x-space_rail, y+len_half);
      break;
    case 3:
      strokeWeight(weight_sleeper);
      stroke(color_sleeper);
      line(x-len_half+offset_sleeper, y-len_sleeper, x-len_half+offset_sleeper, y+len_sleeper);
      line(x-len_sleeper, y-len_half+offset_sleeper, x+len_sleeper, y-len_half+offset_sleeper);
      strokeWeight(weight_rail);
      stroke(color_rail);
      bezier(x-len_half, y-space_rail, x-space_rail, y-space_rail, x-space_rail, y-space_rail, x-space_rail, y-len_half);
      bezier(x-len_half, y+space_rail, x+space_rail, y+space_rail, x+space_rail, y+space_rail, x+space_rail, y-len_half);
      break;
    case 4:
      strokeWeight(weight_sleeper);
      stroke(color_sleeper);
      line(x-len_sleeper, y-len_half+offset_sleeper, x+len_sleeper, y-len_half+offset_sleeper);
      line(x+len_half-offset_sleeper, y-len_sleeper, x+len_half-offset_sleeper, y+len_sleeper);
      strokeWeight(weight_rail);
      stroke(color_rail);
      bezier(x-space_rail, y-len_half, x-space_rail, y+space_rail, x-space_rail, y+space_rail, x+len_half, y+space_rail);
      bezier(x+space_rail, y-len_half, x+space_rail, y-space_rail, x+space_rail, y-space_rail, x+len_half, y-space_rail);
      break;
    case 5:
      strokeWeight(weight_sleeper);
      stroke(color_sleeper);
      line(x+len_half-offset_sleeper, y-len_sleeper, x+len_half-offset_sleeper, y+len_sleeper);
      line(x-len_sleeper, y+len_half-offset_sleeper, x+len_sleeper, y+len_half-offset_sleeper);
      strokeWeight(weight_rail);
      stroke(color_rail);
      bezier(x-space_rail, y+len_half, x-space_rail, y-space_rail, x-space_rail, y-space_rail, x+len_half, y-space_rail);
      bezier(x+space_rail, y+len_half, x+space_rail, y+space_rail, x+space_rail, y+space_rail, x+len_half, y+space_rail);
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

  boolean getL() {
    return canConnectL;
  }
  boolean getR() {
    return canConnectR;
  }
  boolean getU() {
    return canConnectU;
  }
  boolean getD() {
    return canConnectD;
  }
}
