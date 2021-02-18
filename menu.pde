class Menu {  
  Loading l;
  float a, w, wSpeed, wAcc;
  boolean nwm;
  boolean timeToPlay;
  Snake s;
  Menu() {
    l = new Loading(150, width/2, 250);
    a = 0;
    nwm = false;
    w = 600;
    wSpeed = 2;
    wAcc = 0.0039;
    timeToPlay = false;
    s = new Snake(false);
  }



  void snake() {
    push();

    s.run();
    s.display(false);





    //fill(0, 255, 255);
    //rect(150, 90, 90, 30);
    //rect(150, 90, 60, 30);
    //rect(150, 90, 30, 30);
    //rect(150, 120, 30, 30);
    //rect(150, 150, 30, 30);
    //rect(150, 180, 30, 30);
    //rect(150, 210, 30, 30);
    //rect(150, 240, 30, 30);
    //rect(150, 270, 30, 30);
    //rect(150, 300, 30, 30);
    //rect(120, 300, 30, 30);
    //rect(90, 300, 30, 30);
    //rect(90, 270, 30, 30);

    pop();
  }

  void display() {
    if (nwm) {
      l.run();
      ld();
    }
    if (nwm == false) {
      snake();
      txt();      
      if (timeToPlay) {
        buttonDis();
        part();
      }
    }
  }

  void txt() {
    push();
    fill(gre);
    textSize(150);
    text("  NAKE", 365, 250);
    pop();
  }

  void buttonDis() {
    push();
    //fill(100);
    rectMode(CENTER);
    //trect(width/2, 450, 300,130);
    textSize(90);
    fill(blue);
    text("PLAY", 490, 480);
    pop();
  }

  void buttonTouch() {
    if (timeToPlay) {
      if (mouseX > width/2-150 && mouseX < width/2 + 150 && mouseY > 450 - 65 && mouseY < 450 + 65) {
        nwm = true;
      }
    }
  }

  void part() {
    float d = 180;
    push();
    stroke(0);
    noFill();
    //ellipse(width/2, 450, d*2, d);
    pop();
    float x = cos(a) * d;
    float y = sin(a) * d/2;

    parSys.add(new ParticleSystem(width/2 + x, 450 + y, red, 8, 1.5, 2));
    a += 0.08;



    for (int i = parSys.size()-1; i > -1; i-- ) { 
      ParticleSystem ps = parSys.get(i);
      push();
      ps.run();
      pop();
      if (ps.isDeat()) {
        parSys.remove(i);
      }
    }
  }

  void ld() {
    push();  
    rectMode(CENTER);

    noStroke();
    fill(gre);  
    rect(width/2, 500, 500, 25, 255);
    fill(51);
    rect(w, 500, 500, 25);
    strokeWeight(2);
    stroke(0);
    noFill();
    rect(width/2, 500, 500, 25, 255);
    float proc = map(w, 600, 1100, 0, 100);
    fill(gre);
    textSize(25);
    text(int(proc) + " %", 870, 507);

    wSpeed -= wAcc;
    w += wSpeed;
    proc = map(w, 600, 1100, 0, 100);
    if (int(proc) == 101) game = true;
    pop();
  }
}
