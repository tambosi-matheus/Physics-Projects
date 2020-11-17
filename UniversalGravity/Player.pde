class Player extends Solid
{
  private PVector totalForces;
  private float angle;

  public Player(float x, float y, float mass) 
  {
    pos = new PVector(x, y);
    this.mass = mass;
    vel = new PVector(0, 0);
    acel = new PVector(0, 0);
  }

  public void Update()
  {
    UpdateForces();
    Show();
  }

  private void UpdateForces()
  {
    if (mouseRight || mouseLeft || mouseCenter)
    {
      vel = new PVector();
      pos = mouse;
    } else
    {
      if (vel.mag() > 0.1)
        angle = vel.heading();
      totalForces = Util.GetFinalGravity(solids, this).mult(100);
      acel = totalForces.div(mass);
      vel.add(acel.mult(deltaTime));
      //set the speed based on collision map
      checkCollisions();
    }
  }

  private void checkCollisions()
  {
    //check if the player will be in X bounds if moves
    if (16 < pos.x + vel.x * deltaTime && pos.x + vel.x * deltaTime <  width - 16) 
      pos.x += vel.x * deltaTime; 
    else vel.x = 0;
    //check if the player will be in Y top bound if moves
    if (16 < pos.y + vel.y * deltaTime) 
    {
      if (pos.y + vel.y * deltaTime < height - 41) 
      {
        pos.y += vel.y * deltaTime;
      }
      //if collides with the ground, change Y vector
      else vel = new PVector(0, 0);
    } else vel.y = 0;
  }

  public void Show()
  {
    pushMatrix();

    translate(pos.x, pos.y);
    rotate(angle + HALF_PI);
    noTint();
    image(player, 0, 0);
    if (vel.mag() > 0) image(fire, 0, 0);

    popMatrix();
  }
}
