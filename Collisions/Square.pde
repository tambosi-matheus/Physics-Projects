public class Square extends Shape
{
  String name;
  float w, h;
  color c;

  public Square(float x, float y, float w, float h, int pos)
  {
    this.pos = new PVector(x, y);
    c = color(pos, 100, 100);
    this.w = w;
    this.h = h;
  }
  
  public void Collision(Point p)
  {
    if (p.pos.x + p.r/2 > pos.x - w/2 &&
      p.pos.x - p.r/2 < pos.x + w/2 &&
      p.pos.y + p.r/2 > pos.y - h/2 &&
      p.pos.y - p.r/2 < pos.y + h/2)
    {
      p.collided = true;
      p.c = color(255, 0, 0);
      println("Point [" + pointCount + "] collided with square");
    }
  }

  public void Show()
  {
    fill(c);
    rect(pos.x, pos.y, w, h);
  }  
}
