class Player
{
  PVector pos, vel, acel, gravity = new PVector(0, 0.05);
  float speed, angle;
  
  Player(float x, float y, float acel)
  {
    pos = new PVector(x, y);
    this.speed = acel;
    vel = new PVector(0, 0);
    angle = - HALF_PI;
  }
  
  
  void Update()
  {
    Flight();
    Show();
  }
  
  void Flight()
  {
    acel = new PVector();
    if(mouseLeft || mouseRight)
    {
      acel = PVector.sub(mouse, pos).normalize();
      acel.mult(speed);
      angle = acel.heading();
    }
    
    acel.add(gravity);
    vel.add(acel);
    if(0 + 16 < pos.x + vel.x && pos.x + vel.x <  width - 16) pos.x += vel.x;
    else vel.x = 0;
    if(0 + 16 < pos.y + vel.y && pos.y + vel.y <  height - 16) pos.y += vel.y;
    else
    {
      vel = new PVector();
      angle = - HALF_PI;
    }
    
  }
  
  
  void Show()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle + HALF_PI);
    noTint();
    image(player, 0, 0);
    if(mouseLeft || mouseRight)
      image(fire, 0, 0.5);
    popMatrix();
  }
  
}
