Player p;
PImage player, fire, background, target;
float mouseAngle;

void setup()
{
  size(500, 500, P3D);
  imageMode(CENTER);  
  
  p = new Player(width/2, height/2, 0.1f); 
  player = loadImage("galaga.png");
  background = loadImage("spacebg.jpeg");
  fire = loadImage("fire.png");
  target = loadImage("target.png");
  noCursor();
}

void draw()
{
  Mouse();
  image(target, mouse.x, mouse.y);
  tint(100, 100, 100, 100);
  image(background, width/2, height/2, 1280, 800);
  p.Update();
  println(nf(p.vel.x, 0, 2) + " ------ " + nf(p.vel.y, 0, 2));
}
