Player p;
PImage player, background, fire, ground;
int deltaTime, lastTime;
PVector wind = new PVector(0.05, 0.01), 
        gravity = new PVector(0, 0.5);

void setup()
{
  imageMode(CENTER);
  size(500, 500);
  player = loadImage("galaga.png");
  background = loadImage("spacebg.jpeg");
  fire = loadImage("fire.png");
  ground = loadImage("sangGround.png");

  p = new Player(width/2, height/2, 10, 1.5); // x, y, mass, angle and input strenght
}

void draw()
{
  clear();
  deltaTime = (millis() - lastTime) / 10;
  lastTime = millis();
  tint(150, 150, 150, 255);
  image(background, width/2, height/2, 1280, 800);
  image(ground, width/2, height);
  p.Update();
}
