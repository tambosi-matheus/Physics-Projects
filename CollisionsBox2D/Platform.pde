// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2012
// Box2DProcessing example

// A fixed boundary class (now incorporates angle)

class Platform {

  // A boundary is a simple rectangle with x,y,width,and height
  float x, y, w, h;
  color c;
  // But we also have to make a body for box2d to know about it
  Body b;
  Vec2 pos;

 Platform(float x_,float y_, float w_, float h_, float a) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = color(255);

    // Define the polygon
    PolygonShape sd = new PolygonShape();
    // Figure out the box2d coordinates
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    // We're just a box
    sd.setAsBox(box2dW, box2dH);


    // Create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.angle = a;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    
    // Attached the shape to the body using a Fixture
    b.createFixture(sd,1);
    b.setUserData(this);
  }
  
  void killBody() {
    box2d.destroyBody(b);
  }

  // Draw the boundary, it doesn't move so we don't have to ask the Body for location
  void display() {
    fill(c);
    stroke(0);
    strokeWeight(1);
    rectMode(CENTER);
    float a = b.getAngle();
    pushMatrix();
    translate(x,y);
    rotate(-a);
    rect(0,0,w,h);
    popMatrix();
  }
  
  void change()
  {
    c = color(255, 0, 0);
  }

}
