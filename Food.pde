class Food {
  PVector loc;
  float d;
  float d2;
  float pulseSpeed;
  ParticleFood pf;


  Food() {
    d = 30;
    d2 = 30;
    int rx = int(random(0, 39));
    int ry = int(random(0, 19));
    loc = new PVector(rx*30, ry*30);
    pulseSpeed = -0.5;
    pf = new ParticleFood(loc);
  }

  void display() {
    push();
    stroke(0);
    fill(255, 0, 0);
    ellipse(loc.x+d/2, loc.y+d/2, d2, d2);
    pop();
  }

  void pulse() {
    d2 += pulseSpeed;

    if (d2 > 30 || d2 < 25) pulseSpeed = -pulseSpeed;
  }

  void run() {
    pulse();
    display();
    pf.display(loc, d2);
  }

  void reset() {
    int rx = int(random(0, 39));
    int ry = int(random(0, 19));
    loc.set(rx*30, ry*30);
  }

  void eaten(PVector loc_, Snake s_) {
    if (loc.x == loc_.x && loc.y == loc_.y ) {
      PieceOfSnake ps = s_.pocs.get(s_.pocs.size()-1);
      //s_.pocs.add(new PieceOfSnake(-200, -200, true)); 
      s_.pocs.add(new PieceOfSnake(ps.loc.x, ps.loc.y, true)); 
      parSys.add(new ParticleSystem(loc.x+d/2, loc.y+d/2, red, 15, 5, 20));
      reset();
      counter++;
    }
  }

  void respawn(PieceOfSnake poc_) {
    if (loc.x == poc_.loc.x && loc.y == poc_.loc.y) { 
      reset();
      fail++;
    }
  }
}

class ParticleFood {
  PVector loc;
  float d, a;

  ParticleFood(PVector lo) {
    loc = new PVector(lo.x, lo.y);
    d = 50;
    a = 0;
  }

  void display(PVector lo, float d_) {
    loc.set(lo.x, lo.y);
    push();
    noFill();
    stroke(0);
    translate(loc.x + 15, loc.y + 15);
    //ellipse(0,0,d,d);

    for (float i = 0; i < 10; i++) {
      float x = cos(a-(i/5)) * d/2;
      float y = sin(a-(i/5)) * d/2;

      float viz = map(i, 0, 10, 255, 20);
      noStroke();
      fill(255, 0, 255, viz);
      fill(#FF443E, viz);
      ellipse(x, y, d/8, d/8);
    }

    a += 0.1;
    pop();
  }
}
