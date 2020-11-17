public class Bullet extends Solid
{
  PVector vel;
  
 public Bullet(PVector pos, float angle)
 {
  this.pos = new PVector(pos.x, pos.y);
  vel = new PVector(0, -0.1); 
  vel.rotate(angle);
 }
  
  
  public void Update()
  {
    Movimentation();
  }
  
  private void Movimentation()
  {
   PVector step = vel.copy();  
   step.mult(deltaTime);
   pos.add(step);
  }
  
  public void Show()
  {
    pushMatrix();
    
    translate(pos.x, pos.y);
    fill(255, 0, 0);
    circle(0, 0, 5);
    
    popMatrix();
  }
}
