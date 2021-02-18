class Kyvadlo {  
  float d1, d2, a, slow, max, min;

  Kyvadlo(float a_, float slow_) {
    d1 = 100;
    d2 =  80;
    a = a_;
    slow = slow_;
    max = 1.5 * PI;
    min = 0;
  }

  void run(float locx, float locy, float d1_, float d2_, color clr, float speed) {  // x, y, velikost delšího oblouku, velikost menšího oblouku, barva, rychlost
    push();
    d1 = d1_;
    d2 = d2_;
    translate(locx, locy);  

    float angle = map(sin(a), -1, 1, min, max);
    // angle +=a;
    rotate(angle);
    fill(clr);
    beginShape();

    for (float i = 0; i > -PI/2; i -= 0.01) {
      float x = cos(i) * d1;  
      float y = sin(i) * d1;
      vertex(x, y);
    }

    for (float i = -PI/2; i < 0; i += +0.01) {
      float x = cos(i) * d2;  
      float y = sin(i) * d2;
      vertex(x, y);
    }

    a += speed;
    if (max > 0.75 * PI) max -= slow;
    if (min < 0.75 * PI) min += slow;

    endShape(CLOSE);
    pop();
  }

  void reset() {
    max =  1.5 * PI;
    min = 0;
  }
}
