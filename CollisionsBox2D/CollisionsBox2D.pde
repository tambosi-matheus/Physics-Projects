import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Player p;
ArrayList<Platform> platforms;
Box2DProcessing box2d;
float speed = 10;

boolean isLeft, isRight, isUp, isDown;


void setup()
{
  size(500, 500, P3D);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -35);
  box2d.listenForCollisions();
  
  p = new Player(10, 10, 5);
  p.display();
  
  platforms = new ArrayList<Platform>();
  platforms.add(new Platform(width/4,height-5,width/2-50,10,0));
  platforms.add(new Platform(3*width/4,height-50,width/2-50,10,0));
  platforms.add(new Platform(width-5,height/2,10,height,0));
  platforms.add(new Platform(5,height/2,10,height,0));
  
  

  
}

void draw()
{
  p.move(new Vec2((int(isRight)-int(isLeft))*speed, int(isUp)*speed*20)); 
  
  background(0);
  box2d.step();
  p.display();
  for(Platform plat : platforms)
  {
    plat.display();
  }
  camera(p.pos.x, p.pos.y, (height/2.0) / tan(PI*30.0 / 180.0), p.pos.x, p.pos.y, 0, 0, 1, 0);
  fill(0);
  text("framerate: " + (int)frameRate,12,16);
}




void beginContact(Contact cp) 
{
  // Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  if (o1.getClass() == Player.class && o2.getClass() == Platform.class) {
    Platform p2 = (Platform) o2;
    p2.change();
  }
  if (o1.getClass() == Platform.class && o2.getClass() == Player.class) {
    Platform p1 = (Platform) o1;
    p1.change();
  }

}

void endContact(Contact cp) {
}
 
  
