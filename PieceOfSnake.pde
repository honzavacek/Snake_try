class PieceOfSnake {
  PVector loc, vel;
  float d;
  boolean normal;
  boolean stop;


  PieceOfSnake(float x, float y, boolean normal_) {
    d= 30;
    normal = normal_;
    stop = false;
    vel = new PVector(d, 0);
    loc = new PVector(x, y);
  }


  //void display(float visibility_) {
  //  stroke(0, visibility_);
  //  fill(0, 255, 255, visibility_);
  //  rect(loc.x, loc.y, d, d);
  //  if (normal == false) {
  //    fill(255);
  //    //text(loc.x, 100, 100);
  //    //text(loc.y, 100, 200);
  //    //print(vel.x);
  //  }
  //  //image(im, loc.x, loc.y);
  //}

  void display(float visibility_, boolean lin1,boolean lin2,boolean lin3,boolean lin4) {

    fill(0, 255, 255, visibility_);
    noStroke();
    rect(loc.x, loc.y, d, d);
    stroke(0, visibility_);
    
    if(lin1) line(loc.x, loc.y, loc.x+d, loc.y);
    if(lin2) line(loc.x+d, loc.y, loc.x +d, loc.y+d);
    if(lin3) line(loc.x, loc.y+d, loc.x+d, loc.y+d);
    if(lin4) line(loc.x, loc.y, loc.x, loc.y+d);

    if (normal == false) {
      fill(255);
      //text(loc.x, 100, 100);
      //text(loc.y, 100, 200);
      //print(vel.x);
    }
    //image(im, loc.x, loc.y);
  }

  //void display2(float visibility_) {
  //  if (vel.x == 0 && vel.y == -d) {
  //    push();
  //    translate(loc.x+d/2, loc.y+d/2);
  //    rotate(PI/2);
  //    image(im, -d/2 + -1, -d/2 - 1);
  //    pop();
  //  }
  //  if (vel.x == 0 && vel.y == d) {
  //    push();
  //    translate(loc.x+d/2, loc.y+d/2);
  //    rotate(-PI/2);
  //    image(im, -d/2 + -1, -d/2 - 1);
  //    pop();
  //  }
  //}

  void update(boolean only) {

    if (normal == false) {
      if (loc.x == 360 && loc.y == 450) vel.set(0, -d);
      if (loc.x == 360 && loc.y == 240) vel.set(d, 0);
      if (loc.x == 420 && loc.y == 240) vel.set(0, -d);
      if (loc.x == 420 && loc.y == 180) vel.set(-d, 0);
      if (loc.x == 360 && loc.y == 180) vel.set(0, -d);
      if (loc.x == 360 && loc.y == 120) vel.set(d, 0);
      if (loc.x == 420 && loc.y == 120) { 
        stop = true;
        menu.timeToPlay = true;
      }
    }

    if (only == false) {
      if (stop == false)loc.add(vel);
    }
  }

  void setLoc(PVector loc_) {
    loc.set(loc_);
  }

  void dirWSAD() {

    Snake s = snk.get(0);
    if (key == 'W' ||key == 'w') if (vel.x != 0 && vel.y != d) {
      vel.set(0, -d); 
      s.canDir = false;
    }
    if (key == 'S' ||key == 's') if (vel.x != 0 && vel.y != -d) {
      vel.set(0, d); 
      s.canDir = false;
    }
    if (key == 'A' ||key == 'a') if (vel.x != d && vel.y != 0) {
      vel.set(-d, 0); 
      s.canDir = false;
    }
    if (key == 'D' ||key == 'd') if (vel.x != -d && vel.y != 0) {
      vel.set(d, 0); 
      s.canDir = false;
    }
  }
}
