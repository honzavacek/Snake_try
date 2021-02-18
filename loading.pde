class Loading {
  Kyvadlo k1;
  Kyvadlo k2;
  Kyvadlo k3;
  float d, x, y;



  Loading(float d_, float x_, float y_) {
    k1 = new Kyvadlo(0, 0.000);            // začátek (0 je nahoře v pravo, 1.5PI je nahoře v levo ), gravitaces
    k2 = new Kyvadlo(PI* 1.5, 0.000);  // začátek, gravitace
    k3 = new Kyvadlo(0, 0.000);
    d = d_;
    x = x_;
    y = y_;
  }

  void run() {
    push();
    noStroke();
    k1.run(x, y, d, d*85/105, blue, 0.05);  // x, y, velikost delšího oblouku, velikost menšího oblouku, barva, rychlost
    k2.run(x, y, d*65/105, d/2.1, gre, 0.07); // x, y, velikost delšího oblouku, velikost menšího oblouku, barva, rychlost
    k3.run(x, y, d/3.5, d / 5.25, red, 0.09);
    pop();
  }

  void reset() {
    k1.reset(); 
    k2.reset();
    k3.reset();
  }
}
