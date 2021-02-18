class Snake {
  PieceOfSnake poc1;
  ArrayList <PieceOfSnake> pocs;
  float timer, visibility;
  boolean canDir;
  boolean deat1, deat2, deat3;


  Snake(boolean normal) {
    deat1 = false;
    deat2 = false;
    deat3 = false;
    visibility = 300;

    pocs = new ArrayList <PieceOfSnake>();
    timer = 0;
    canDir = true;
    if (normal) {
      poc1 = new PieceOfSnake(120, 30, true); 
      pocs.add(new PieceOfSnake(90, 30, true));
      pocs.add(new PieceOfSnake(60, 30, true));
      pocs.add(new PieceOfSnake(30, 30, true));
    } else {
      poc1 = new PieceOfSnake(120, 450, false); 
      pocs.add(new PieceOfSnake(120, 420, true));
      pocs.add(new PieceOfSnake(120, 390, true));
      pocs.add(new PieceOfSnake(120, 360, true));
      pocs.add(new PieceOfSnake(120, 330, true));
      pocs.add(new PieceOfSnake(120, 300, true));
      pocs.add(new PieceOfSnake(120, 270, true));
      pocs.add(new PieceOfSnake(120, 240, true));
      pocs.add(new PieceOfSnake(120, 210, true));
      pocs.add(new PieceOfSnake(120, 180, true));
      pocs.add(new PieceOfSnake(120, 150, true));
    }
  }

  void run() {
    if (deat1 == false && deat2 == false) {
      move();
      kill();
    } else {
      vis();
    }
  }

  void display(boolean pr) {
    PieceOfSnake pp = pocs.get(0);
    if (poc1.loc.x > pp.loc.x) poc1.display(visibility, true, true, true, false);
    if (poc1.loc.x < pp.loc.x) poc1.display(visibility, true, false, true, true);
    if (poc1.loc.y < pp.loc.y) poc1.display(visibility, true, true, false, true);
    if (poc1.loc.y > pp.loc.y) poc1.display(visibility, false, true, true, true);




    for (int i = pocs.size()-1; i>-1; i--) {
      PieceOfSnake poc = pocs.get(i);

      fd.respawn(poc);

      if (i == pocs.size()-1) {
        if (timer == 1 && pr) {
          parSys.add(new ParticleSystem(poc.loc.x+15, poc.loc.y+15, blue, 15, 4, 10));
        }
      }


      boolean li1 = true;
      boolean li2 = true;
      boolean li3 = true;
      boolean li4 = true;

      if (i != pocs.size()-1 && i != 0) {
        PieceOfSnake pocp = pocs.get(i+1);
        PieceOfSnake pocm = pocs.get(i-1);
        if (poc.loc.x < pocp.loc.x || poc.loc.x < pocm.loc.x) li2 = false;  
        if (poc.loc.x > pocp.loc.x || poc.loc.x > pocm.loc.x) li4 = false; 
        if (poc.loc.y > pocp.loc.y || poc.loc.y > pocm.loc.y) li1 = false; 
        if (poc.loc.y < pocp.loc.y || poc.loc.y < pocm.loc.y) li3 = false;
      }

      if (i == 0) {
        PieceOfSnake pocp = pocs.get(i+1);
        if (poc.loc.x < pocp.loc.x || poc.loc.x < poc1.loc.x) li2 = false;  
        if (poc.loc.x > pocp.loc.x || poc.loc.x > poc1.loc.x) li4 = false; 
        if (poc.loc.y > pocp.loc.y || poc.loc.y > poc1.loc.y) li1 = false; 
        if (poc.loc.y < pocp.loc.y || poc.loc.y < poc1.loc.y) li3 = false;
      }

      if (i == pocs.size()-1) {
        PieceOfSnake pocm = pocs.get(i-1);
        if (poc.loc.x < pocm.loc.x) li2 = false;  
        if (poc.loc.x > pocm.loc.x) li4 = false; 
        if (poc.loc.y > pocm.loc.y) li1 = false; 
        if (poc.loc.y < pocm.loc.y) li3 = false;
      }


      poc.display(visibility, li1, li2, li3, li4);
    }
  }

  void move() {
    poc1.update(true);
    if (poc1.stop == false) {
      timer++;
      if (timer >= 8) {

        for (int i = pocs.size()-1; i > 0; i--) {
          PieceOfSnake poc = pocs.get(i);
          PieceOfSnake poc_ = pocs.get(i-1);
          poc.setLoc(poc_.loc);
        }


        PieceOfSnake poc2 = pocs.get(0);
        poc2.setLoc(poc1.loc);
        poc1.update(false);
        timer = 0;
        canDir = true;
      }
    }
  }

  void keyPres() {
    if (canDir)poc1.dirWSAD();
  }

  void kill() {
    if (poc1.loc.x > width-1 || poc1.loc.x < 0 || poc1.loc.y < 0 || poc1.loc.y > height-1) deat1 = true;


    for (int i = pocs.size()-1; i > -1; i--) {
      PieceOfSnake poc = pocs.get(i);
      if (poc1.loc.x == poc.loc.x && poc1.loc.y == poc.loc.y) {
        deat2 = true;
        i=-20;
      }
    }
  }

  void vis() {
    visibility -= 3;
    if (visibility < 1) {
      deat3 = true;
    }
  }

  boolean deat() {
    if (deat3) {
      return true;
    } else {
      return false;
    }
  }
}
