class ParticleSystem {
  ArrayList <Particle> system;
  PVector poz;

  ParticleSystem(float x, float y, color col_, float d_, float lon_, float pocet) {
    poz = new PVector(x, y);
    system = new ArrayList <Particle>();

    for (int i = 0; i < pocet; i++) system.add(new Particle(poz, col_, d_, lon_ ));
  }

  void run() {
    for (int i = system.size()-1; i > -1; i--) {
      Particle p = system.get(i);
      p.run();
      p.display();

      if (p.isDeat()) {
        system.remove(i);
        //system.add(new Particle(poz));
      }
    }
  }


  boolean isDeat() {
    if (system.size() == 0) {
      return true;
    } else {
      return false;
    }
  }
}


class Particle {
  PVector loc, gra, vel;
  float d, lon;
  float visibility;
  color clr;
  Particle(PVector poz_, color clr_, float d_, float lon_) {
    clr = clr_;
    lon = lon_;
    loc = new PVector(poz_.x, poz_.y);
    //vel = new PVector(0, 0);
    vel = new PVector(random(-lon, lon), random(-lon, lon));
    //gra = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    //gra.rotate(180);
    PVector zero = new PVector(0, 0);
    PVector poc = new PVector(vel.x, vel.y);
    gra = PVector.sub(zero, poc);
    gra.mult(0.04);
    d = d_;
    visibility = random(200, 300);
  }

  void display() {
    stroke(0, visibility);
    fill(clr, visibility);
    //d = map(vel.mag(),0, 3, 30, 0);
    ellipse(loc.x, loc.y, d, d);
  }

  void run() {
    vel.add(gra);
    loc.add(vel);
    visibility -= 6;
  }

  boolean isDeat() {
    //if (loc.y > height+d/2) {
    if (visibility < 0) {
      return true;
    } else {
      return false;
    }
  }
}
