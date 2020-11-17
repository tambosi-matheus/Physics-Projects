import java.util.ArrayList;
import java.util.HashMap;

static PVector size, center;
ArrayList<Solid> solids;

static int gridSize = 10;
int startSolids = 15;
float time, deltaTime, cooldown = 20, canSpawn;

boolean showGrid = true, centerGravity = false;

public void setup()
{
  size(500, 500, P3D);
  frameRate(60);
  size = new PVector(width, height);
  solids = new ArrayList<Solid>();  
  center = new PVector(size.x/2, size.y/2);
}


public void draw()
{
  clear();
  Mouse();
  Update();
  deltaTime = (millis() - time)/ 10;
  time = millis();
  //ShowSolidToCenter();

  if(showGrid) ShowCollisionGrid();
  if (mousePressed && canSpawn < millis())
  {
    Solid s = new Solid();
    if(!Util.CheckCollision(s, solids))
      solids.add(new Solid()); 
    canSpawn = millis() + cooldown;
  }

  for (Solid c : solids)
  {
    c.Update();
  }

  Util.IterateCollisionList(Util.CreateCollisionGrid(solids));
}
