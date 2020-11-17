import java.util.ArrayList;

ArrayList<Point> points;
ArrayList<Shape> shapes;
float pointCooldown = 100, pointTimer, shapeCooldown = 500, shapeTimer, time, deltaTime;
int pointCount = 0;


void setup()
{
  size(500, 500);
  imageMode(CENTER);
  rectMode(CENTER);

  points = new ArrayList<Point>();
  shapes = new ArrayList<Shape>();
}

void draw()
{
  clear();
  deltaTime = millis() - time;
  time = millis();
  pointTimer -= deltaTime;
  shapeTimer -= deltaTime;
  
  while(points.size() > 50)
  {
    points.remove(0); 
  }
  
  if ((mouseRight || mouseLeft) && pointTimer <= 0) 
  {
    pointTimer = pointCooldown;
    pointCount ++;
    Point p = new Point(mouseX, mouseY);
    points.add(p);
    for(Shape s : shapes)
      s.Collision(p);
    for(int i = points.size() - 1; i >= 0; i--)
    {
      Point p1 = points.get(i);
      p1.updateColor(i);
    }
  }
  if (keyQ && shapeTimer <= 0)
  {
    shapeTimer = shapeCooldown;
    shapes.add(new Square(mouseX, mouseY, 50, 75, shapes.size()));
  }  
  if (keyE && shapeTimer <= 0)
  {
    shapeTimer = shapeCooldown;
    shapes.add(new Circle(mouseX, mouseY, 50, shapes.size()));
  }
  
  for (Shape s : shapes)
    s.Show();
  for (Point p : points)
    p.Show();  
}

public abstract class Shape 
{
  PVector pos;
  public void Show() {
  }
  public void Collision(Point p) {
  }
}
