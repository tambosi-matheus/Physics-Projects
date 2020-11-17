public static class Util
{
  public static PVector GetFinalGravity(ArrayList<Solid> solids, Solid solid)
  {
    PVector gravity = new PVector();
    for (Solid s : solids)
    {
      if (solid == s) continue;
      gravity.add(CalcGravity(solid, s));
    }

    return gravity;
  }
  public static PVector CalcGravity(Solid s1, Solid s2)
  {
    PVector vec = PVector.sub(s2.pos, s1.pos);
    float dist = vec.mag();    
    float f = (GRAV_CONST * s1.mass * s2.mass) / (dist * dist);
    vec.normalize();
    vec.mult(f);    
    return vec;
  }
}
