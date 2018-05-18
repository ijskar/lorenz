import peasy.*;

float x, y, z;
float dx, dy, dz, dt;
float a = 10;
float b = 8.0/3.0;
float c = 28;
ArrayList<PVector> points = new ArrayList<PVector>();
PeasyCam cam;
void setup() {
  x = 1;
  y = 1;
  z = 1;
  dt  = 0.01;
  colorMode(HSB);
  size(800, 800, P3D);
  cam = new PeasyCam(this, 500);
}

void draw() {
  background(0);
  dx = (a*(y-x))*dt;
  dy = (x*(c-z)-y)*dt;
  dz = (x*y-b*z)*dt;

  x = x + dx;
  y = y + dy;
  z = z + dz;
  points.add(new PVector(x, y, z));
  scale(5);
  noFill();
  
  float hue = 0;
  beginShape();
  for(PVector v: points){
    vertex(v.x, v.y, v.z);
    stroke(hue, 255, 255);
    hue += 0.1;
    if(hue > 255) hue = 0;
  }
  endShape();
}
