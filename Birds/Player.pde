class Player 
{
  boolean onAir;
  PVector pos, speed, totalForces, acel, worldForces, input;
  float mass, angle, force;

  Player(float x, float y, float mass, float angle, float force) 
  {
    pos = new PVector(x, y);
    this.mass = mass;
    this.angle = angle;
    this.force = force;
    speed = new PVector(0, 0);
    acel = new PVector(0, 0);
    worldForces = new PVector(0, 0);
    input = new PVector(0, 0);
  }

  void Update()
  {
    UpdateForces();
    //Debug();
    Show();
  }

  void UpdateForces()
  {
    if(speed.mag() > 0.1)
      angle = speed.heading();
    if (!onAir) 
    {
      pos.x = point.x;
      pos.y = point.y;
      if (mouseLeft)
      {
        pos.x = mouseX;
        pos.y = mouseY;
        speed = new PVector(point.x - mouseX, point.y - mouseY).mult(force).div(mass);
      }
    } else
    {
      worldForces = PVector.add(wind, gravity);
      //.add(...) can add more forces if wanted
      totalForces = worldForces;
      acel = totalForces.div(mass);
      speed.add(acel.mult(deltaTime));
      //check if the player will be in X bounds if moves
      if (16 < pos.x + speed.x * deltaTime && pos.x + speed.x * deltaTime <  width - 16) 
        pos.x += speed.x * deltaTime; 
      else speed.x = 0;
      //check if the player will be in Y top bound if moves
      if (16 < pos.y + speed.y * deltaTime) 
      {
        if (pos.y + speed.y * deltaTime < height - 41) 
        {
          pos.y += speed.y * deltaTime;
        } else speed = new PVector(0, 0); //if collides with the ground, change Y vector 
      } else speed.y = 0;
    }
  }
  
  void resetPosition()
  {
   onAir = false;
   speed = new PVector(0, 0);
  }

  void Show()
  {
    pushMatrix();

    translate(pos.x, pos.y);
    rotate(angle + HALF_PI);
    noTint();
    image(player, 0, 0);
    if (speed.mag() > 0 && onAir) 
      image(fire, 0, 0);

    popMatrix();
  }

  void Debug()
  {
    println("----------");  

    println("position    " + nf(pos.x, 0, 2) + "/------/" + nf(pos.y, 0, 2));
    println("speed    " + nf(speed.x, 0, 2) + "/------/" + nf(speed.y, 0, 2));
    println("aceleration    " + nf(acel.x, 0, 2) + "/------/" + nf(acel.y, 0, 2));
    println("worldForces    " + nf(worldForces.x, 0, 2) + "/------/" + nf(worldForces.y, 0, 2));
    println("point position    " + nf(point.x, 0, 2) + "/------/" + nf(point.y, 0, 2));

    println("----------");
    println();
    println();
  }
}
