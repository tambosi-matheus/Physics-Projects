import java.util.ArrayList;

PImage player, target;
float time, deltaTime, 
rotatingSeconds = 0.5, movingSeconds = 2;
ArrayList<Solid> solids;

void setup()
{
  imageMode(CENTER);
  noStroke();
  size(500, 500, P3D);
  camera(0, 0, (height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  player = loadImage("pixel_ship_blue.png");
  target = loadImage("target.png");
  solids = new ArrayList<Solid>();
  solids.add(new Spaceship());
}


void draw()
{
  clear();
  Mouse();
  deltaTime = millis() - time;
  time = millis();


  for(int i = solids.size() - 1; i >= 0; i--)
  {
    Solid s = solids.get(i);
    s.Update();
  }
  
  for (Solid s : solids)
  {
    s.Show();
  }
}
