PImage img;
ArrayList <Snake> snk;
Food fd;
Menu menu;
float counter, max;
ArrayList <ParticleSystem> parSys;
int fail;
boolean game;
boolean esc;
Loading esL;

color red = color(255, 0, 0);
color blue = color(0, 255, 255);
color gre = color(0, 255, 0);

void setup() {
  size(1200, 600);
  //frameRate(30);
  snk = new ArrayList <Snake> ();
  menu = new Menu();
  parSys = new ArrayList <ParticleSystem> ();
  esL = new Loading(150, width/2, 250);
  fd = new Food();
  img = loadImage("snake.png");
  snk.add(new Snake(true));
  counter = 0;
  fail=0;
  game = false;
  background(51);
  esc = false;
}

void draw() {
  if (esc) {
    background(51);
    esL.run();
    
    
  } else {
    if (game) {
      background(img);
      if (counter > max) max = counter;

      for (int i = parSys.size()-1; i > -1; i-- ) { 
        ParticleSystem ps = parSys.get(i);
        ps.run();
        if (ps.isDeat()) {
          parSys.remove(i);
        }
      }

      for (int i = snk.size()-1; i>-1; i--) {
        Snake s = snk.get(i); 
        s.run();
        fd.eaten(s.poc1.loc, s);

        if (s.deat()) {
          snk.remove(i); 
          counter = 0;
        }

        s.display(true);
      }

      fd.run();
      textSize(20);
      fill(0);
      text("Max point: " + int(max), 20, 50);
      text("Point: " + int(counter), 20, 80);
      text("Fail: " + int(fail), 20, 110);
    }

    if (game == false) {
      background(51); 
      menu.display();
    }


    textSize(20);
    fill(0);
    text("FPS: " + int(frameRate), 20, 20);
  }
}

void keyPressed() {
  for (int i = snk.size()-1; i>-1; i--) {
    Snake s = snk.get(i); 
    s.keyPres();
  }

  if (key == 'p') {
    esc = !esc;
  }
}

void mousePressed() {
  if (snk.size()==0) {
    snk.add(new Snake(true));
  }
  menu.buttonTouch();
}
