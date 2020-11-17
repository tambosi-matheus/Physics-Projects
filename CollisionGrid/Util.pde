public static class Util
{ 
  public static ArrayList<ArrayList<Solid>> CreateCollisionGrid(ArrayList<Solid> generalArray)
  {
    ArrayList<Solid> solids = (ArrayList)generalArray.clone();

    ArrayList<ArrayList<Solid>> grid = new ArrayList<ArrayList<Solid>>();

    for (int x = 0; x < gridSize; x++)
    {
      for (int y = 0; y < gridSize; y++)
      {
        ArrayList<Solid> cell = new ArrayList<Solid>();
        for (int i = solids.size() - 1; i >= 0; i--)
        {
          Solid obj = solids.get(i);
          if (CheckIfSolidInCell(obj, x, y))          
            cell.add(obj);

          else if (CheckIfSolidInCell(obj, x, y, true)) 
            cell.add(obj);
        }
        grid.add(cell);
      }
    }   
    return grid;
  }

  public static void IterateCollisionList(ArrayList<ArrayList<Solid>> grid)
  {
    for (ArrayList<Solid> cell : grid)
    {
      for (Solid solid : cell)
      {
        solid.Collision(cell);
      }
    }
  }

  public static boolean CheckCollision(Solid s1, Solid s2)
  {
    if (PVector.dist(s1.pos, s2.pos) < s1.d + s2.d)    
      return true;

    else return false;
  }

  public static boolean CheckCollision(Solid s, ArrayList<Solid> solids)
  {
    for (Solid s1 : solids)
    {
      if (CheckCollision(s, s1))
        return true;
    }
    return false;
  }

  private static boolean CheckIfSolidInCell(Solid s, int x, int y)
  {
    if ((size.x/gridSize * x) < s.pos.x && s.pos.x < (size.x/gridSize * (x + 1)) &&
      (size.y/gridSize * y) < s.pos.y && s.pos.y < (size.y/gridSize * (y + 1)))
      return true;
    return false;
  }

  private static boolean CheckIfSolidInCell(Solid s, int x, int y, boolean withSpeed)
  {
    if ((size.x/gridSize * x) < s.pos.x + s.vel.x + s.d/2 && s.pos.x - s.vel.x - s.d/2 < (size.x/gridSize * (x + 1)) &&
      (size.y/gridSize * y) < s.pos.y + s.vel.y + s.d/2 && s.pos.y - s.vel.y - s.d/2< (size.y/gridSize * (y + 1)))
      return true;
    return false;
  }
}

// create starting circles
private void CreateObjects()
{
  for (int i = 0; i < startSolids; i++)
  {
    Solid s = new Solid();
    if(!Util.CheckCollision(s, solids))
      solids.add(new Solid()); 
  }
}

private void ShowCollisionGrid()
{    
  for (int x = 0; x < gridSize; x++)
  {
    stroke(255, 255, 255);
    strokeWeight(1);
    line((size.x/gridSize * x), size.y, (size.x/gridSize * x + 1), 0);
  }  
  for (int y = 0; y < gridSize; y++)
  {
    stroke(255, 255, 255);
    strokeWeight(1);
    line(size.x, (size.x/gridSize * y), 0, (size.x/gridSize * y + 1));
  }
}

private void ShowSolidToCenter()
{
  for (Solid s : solids)
  {
    stroke(255, 255, 255);
    strokeWeight(1);
    line(s.pos.x, s.pos.y, center.x, center.y);
  }
}
