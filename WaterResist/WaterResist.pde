Player p;
PImage player, background, fire, ground, point;
int deltaTime, lastTime, waterRadius = 200;
boolean mouseDown;
float airDensity = 1, drag = 0.05;
PVector wind = new PVector(-0.05, 0.01), 
  gravity = new PVector(0, 0.98), 
  airDrag = new PVector(0, 0), 

  pointPosition = new PVector(150, 300), 
  waterPos = new PVector(400, 150);

void setup()
{
  imageMode(CENTER);
  size(500, 500);
  player = loadImage("galaga.png");
  background = loadImage("spacebg.jpeg");
  fire = loadImage("fire.png");
  ground = loadImage("sangGround.png");
  point = loadImage("Point.png");

  p = new Player(width/2, height/2, 10, 1, 10); // x, y, mass, angle, volume, input strenght
}

void draw()
{
  clear();
  deltaTime = (millis() - lastTime) / 10;
  lastTime = millis();

  tint(150, 150, 150, 200);
  image(background, width/2, height/2);
  image(ground, width/2, height);
  image(point, pointPosition.x, pointPosition.y);
  fill(0, 0, 100);
  circle(waterPos.x, waterPos.y, waterRadius);


  p.Update();
}
