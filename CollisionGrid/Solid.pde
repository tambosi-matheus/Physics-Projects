class Solid
{
  PVector pos, vel;
  float d, res;
  color c;

  public Solid()
  {
    res = random(0.8, 1);
    d = random(10, 50);
    pos = new PVector(random(d, size.x - d), random(d, size.y - d));
    println(pos);
    c = color(random(50, 255), random(50, 255), random(50, 255));

    //create a random speed vector
    vel = PVector.random2D();
    float speed = random(1, 1.5);
    vel.mult(speed);
  }

  public void Update()
  {
    Movement();
    Show();
  }

  // update object movement
  private void Movement()
  {
    if(centerGravity)
    {
      PVector gravity = PVector.sub(center, pos).normalize();
      gravity.mult(0.05 * 1 / d);
      vel.add(gravity);
    }
      
    if (pos.x + vel.x + d/2 > width || pos.x + vel.x - d/2 < 0)
      vel.x = -vel.x;
    else
      pos.x += (vel.x * deltaTime);
    ;

    if (pos.y + vel.y + d/2 > height || pos.y + vel.y - d/2 < 0)
      vel.y = -vel.y;
    else
      pos.y += (vel.y * deltaTime);
    ;
  }

  public void Collision(ArrayList<Solid> cell)
  {
    for(Solid s : cell)
    {
      if(s == this) continue;
      
      if(PVector.sub(pos, s.pos).mag() < d/2 + s.d/2)
      {
         Collided(s.pos);
         s.Collided(pos);
      }
    }
  }
  
  
  public void Collided(PVector coll)
  {
    c = color(random(50, 255), random(50, 255), random(50, 255));
    PVector _pos = pos.copy();
    coll = PVector.sub(_pos, coll).normalize();
    float speed = vel.mag();    
    coll.mult(speed);
    vel = coll.mult(res);
  }

  // paint the object in the scene
  private void Show()
  {
    noStroke();
    fill(c);
    circle(pos.x, pos.y, d);
  }
}
