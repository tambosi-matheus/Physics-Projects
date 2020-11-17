class Player 
{
  boolean onAir;
  PVector pos, speed, totalForces, acel, worldForces, input;
  float mass, volume, density, angle = 0, force;

  Player(float x, float y, float mass, float volume, float force) 
  {
    pos = new PVector(x, y);
    this.mass = mass;
    this.volume = volume;
    density = mass/volume;
    this.force = force;
    speed = new PVector(0, 0);
    acel = new PVector(0, 0);
    worldForces = new PVector(0, 0);
    input = new PVector(0, 0);
  }

  void Update()
  {
    UpdateForces();
    Debug();
    Show();
  }

  void UpdateForces()
  {
    if(speed.mag() > 0.1)
      angle = speed.heading();
    if(keyR)
    {
      onAir = false;
      speed = new PVector();
    }
    if (!onAir) 
    {
      pos.x = pointPosition.x;
      pos.y = pointPosition.y;
      if (mouseLeft)
      {
        pos.x = mouseX;
        pos.y = mouseY;
        speed = new PVector(pointPosition.x - mouseX, pointPosition.y - mouseY).mult(force).div(mass);
      }
    } else
    {
      updateDensity();
      calcAirDrag();
      worldForces = PVector.add(wind, gravity);
      worldForces.add(airDrag);
      //.add(...) can add more forces if wanted
      totalForces = worldForces;
      
      acel = totalForces.div(mass);
      speed.add(acel.mult(deltaTime)).mult(density);
      
      //set the speed based on collision map
      checkCollisions();
    }
  }
  
  void checkCollisions()
  {
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
        }
        //if collides with the ground, change Y vector
        else speed = new PVector(0, 0); 
      } else speed.y = 0;
  }

  void calcAirDrag()
  {
    float _airDrag = airDensity * drag * volume / 2;
    airDrag.set(speed);
    _airDrag *= airDrag.magSq();
    airDrag.normalize().mult(_airDrag).mult(-1);
  }
  
  void updateDensity()
  {
    if(abs(PVector.dist(pos, waterPos)) < waterRadius/2)
      {
        density = 0.9;
      }
     else density = 1;
  }
  
  void Show()
  {
    pushMatrix();

    translate(pos.x, pos.y);
    rotate(angle + HALF_PI);
    noTint();
    image(player, 0, 0);
    if (speed.mag() > 0) image(fire, 0, 0);

    popMatrix();
  }

  void Debug()
  {
    println("----------");  

    //println("position    " + nf(pos.x, 0, 2) + "/------/" + nf(pos.y, 0, 2));
    println("speed    " + nf(speed.x, 0, 2) + "/------/" + nf(speed.y, 0, 2));
    println("drag    " + nf(airDrag.x, 0, 2) + "/------/" + nf(airDrag.y, 0, 2));
    //println("aceleration    " + nf(acel.x, 0, 2) + "/------/" + nf(acel.y, 0, 2));
    //println("worldForces    " + nf(worldForces.x, 0, 2) + "/------/" + nf(worldForces.y, 0, 2));
    //println("point position    " + nf(pointPosition.x, 0, 2) + "/------/" + nf(pointPosition.y, 0, 2));

    println("----------");
    println();
    println();
  }
}
