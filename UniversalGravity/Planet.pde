public class Planet extends Solid
{
  private color c;

  public Planet(float x, float y, float radius, float mass) 
  {
    pos = new PVector(x, y);
    d = radius;
    this.mass = mass;
    vel = new PVector(0, 0);
    acel = new PVector(0, 0);
    c = color(random(0, 255), random(0, 255), random(0, 255));
  }

  public void Update()
  {
    UpdateForces();
    Show();
  }

  private void UpdateForces()
  {      
    acel = new PVector();
    acel = Util.GetFinalGravity(solids, this); 
    println(this + " gravity " + acel.mag());
    acel.div(mass);
    vel.add(acel.mult(deltaTime));

    pos.x += vel.x;
    pos.y += vel.y;
  }

  public void Show()
  {
    fill(c);
    circle(pos.x, pos.y, d);
  }
}
