ArrayList<Solid> solids;
PImage player, background, fire;
int deltaTime, time;
final static float GRAV_CONST = 0.1f;
boolean mouseDown;
PVector point = new PVector(150, 300);

void setup()
{
  imageMode(CENTER);
  size(500, 500);
  player = loadImage("galaga.png");
  background = loadImage("spacebg.jpeg");
  fire = loadImage("fire.png");
  solids = new ArrayList<Solid>();

  solids.add(new Planet(width, height/5, 150, 10.0f)); // x, y, radius, mass
  solids.add(new Planet(width/20, height, 50, 50.0f));
  solids.add(new Player(width/2, height/2, 1f)); // x, y, mass, volume
}

void draw()
{
  clear();
  Mouse();
  deltaTime = (millis() - time) / 10;
  time = millis();

  tint(150, 150, 150, 210);
  image(background, width/2, height/2);

  for(Solid s : solids)
  {
   s.Update(); 
  }
  
  for(Solid s : solids)
  {
   s.Show(); 
  }
}

public abstract class Solid
{
  PVector pos, vel, acel;
  float mass, d;

  public void Update() {
  };
  public void Show() {
  };
}
