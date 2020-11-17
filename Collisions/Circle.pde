public class Circle extends Shape
{
  String name;
  float r;
  color c;
  boolean collided;

  public Circle(float x, float y, float r, int pos)
  {
    this.pos = new PVector(x, y);
    c = color(100, 100, pos);
    this.r = r;
  }

  public void Collision(Point p)
  {
    if (PVector.dist(p.pos, pos) < p.r/2 + r/2)
    {
      p.collided = true;
      p.c = color(255, 0, 0);
      println("Point [" + pointCount + "] collided with circle");    
    }
  }

  public void Show()
  {
    fill(c);
    circle(pos.x, pos.y, r);
  }
}
