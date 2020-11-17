public class Point
{
  PVector pos;
  float r;
  color c;
  int number;
  boolean collided;

  public Point(float x , float y)
  {
    this.pos = new PVector(x, y);
    r = 5;    
    c = color(100, 255, 100);  
  }

  public void updateColor(int pos)
  {
    if(!collided)
      c = color(100, map(pos, 0, points.size(), 0, 255), 100);
  }

  public void Show()
  {
    fill(c);
    circle(pos.x, pos.y, r);
  }
}
