Player p;
PImage player, background, fire, ground;
int deltaTime, lastTime;
boolean mouseDown;
PVector wind = new PVector(-0.05, 0.01), 
        gravity = new PVector(0, 1),
        point = new PVector(150, 300);

void setup()
{
  noStroke();
  imageMode(CENTER);
  size(500, 500, P3D);
  player = loadImage("galaga.png");
  background = loadImage("spacebg.jpeg");
  fire = loadImage("fire.png");
  ground = loadImage("sangGround.png");

  p = new Player(width/2, height/2, 10, 0, 1); // x, y, mass, angle and input strenght
}

void draw()
{
  clear();
  deltaTime = (millis() - lastTime) / 10;
  lastTime = millis();
  
  tint(150, 150, 150, 200);
  image(background, width/2, height/2, 1280, 800);
  image(ground, width/2, height);
  
  noTint();
  fill(255, 255, 255, 255);
  circle(point.x, point.y, 10);
  p.Update();
  if(keyR)
    p.resetPosition();
}
