class Player 
{
  PVector pos, vel, totalForces, acel, worldForces, input;
  float mass, angle = HALF_PI, force;

  Player(float x, float y, float mass, float force) 
  {
    pos = new PVector(x, y);
    this.mass = mass;
    this.force = force;
    vel = new PVector(0, 0);
  }

  void Update()
  {
    UpdateForces();
    Debug();
    Show();
  }

  void UpdateForces()
  {
    input = new PVector((float)(int(keyD) - int(keyA)) /2, (int(keyS) - int(keyW))).mult(force);
    worldForces =  PVector.add(wind, gravity);
                          //.add(...) can add more forces if wanted
    totalForces = PVector.add(input, worldForces);
    acel = totalForces.div(mass);
    angle = PVector.add(acel, vel).heading();
    vel.add(acel.mult(deltaTime));
    if (16 < pos.x + vel.x * deltaTime && pos.x + vel.x * deltaTime <  width - 16) pos.x += vel.x * deltaTime; //check if the player will be in X bounds if moves
    else vel.x = 0;
    if (16 < pos.y + vel.y * deltaTime) //check if the player will be in Y top bound if moves
    {
      if (pos.y + vel.y * deltaTime < height - 41) 
      {
        pos.y += vel.y * deltaTime;
      } else vel.y = -vel.y; //if collides with the ground, change Y vectwwaor
    } else vel.y = 0;
  }

  void Show()
  {     
    pushMatrix();

    translate(pos.x, pos.y);
    rotate(angle + HALF_PI);
    noTint();
    image(player, 0, 0);
    if(input.mag() > 0) image(fire, 0, 0);
    
    popMatrix();
  }

  void Debug()
  {
    println("----------");

    println("position    " + nf(pos.x, 0, 2) + "/------/" + nf(pos.y, 0, 2));
    println("speed    " + nf(vel.x, 0, 2) + "/------/" + nf(vel.y, 0, 2));
    println("aceleration    " + nf(acel.x, 0, 2) + "/------/" + nf(acel.y, 0, 2));
    println("input    " + nf(input.x, 0, 2) + "/-------/" + nf(input.y, 0, 2));
    println("worldForces    " + nf(worldForces.x, 0, 2) + "/------/" + nf(worldForces.y, 0, 2));

    println("----------");
    println();
    println();
  }
}
