public class Spaceship extends Solid
{
  PVector pos, finalPos, step;
  boolean isRotating, isMoving;
  double angle, angularSpeed, finalAngle, timerRotating;
  double speed, timerMoving;

  public Spaceship()
  {
    pos = new PVector();
  }


  public void Update()
  {
    CheckInput();
    Movimentation();
  }


  private void Movimentation()
  {
    if (!isRotating && !isMoving) return;

    if (isRotating)
    {
      if (timerRotating > time)
      {
        angle += (angularSpeed * deltaTime);
      } else 
      {
        println("desired angle -> [" + nfs((float)finalAngle, 0, 2) + "] / angle achieved -> [" + nfs((float)angle, 0, 2) + "]");
        timerMoving = time + (movingSeconds * 1000);
        isRotating = false;
        isMoving = true;
      }
    }


    if (isMoving)
    {
      if (timerMoving > time)
      {
        PVector _step = step.copy();
        _step.mult(deltaTime);
        pos.add(_step);
      } else
      {
        println("desired position -> " + finalPos + " / position achieved -> " + pos);
        isMoving = false;
      }
    }
  }


  private void CheckInput()
  {
    if (mouseLeft)
      solids.add(new Bullet(pos, radians((float)angle + 90)));
      
    if (!mouseRight) return;
    if (isRotating || isMoving) return;

    finalPos = new PVector(mouse.x, mouse.y);
    finalAngle = degrees(atan2(mouse.y - pos.y, mouse.x - pos.x));

    angularSpeed = (finalAngle - angle) / (rotatingSeconds * 1000);
    timerRotating = time + (rotatingSeconds * 1000);    

    isRotating = true;

    step = PVector.sub(mouse, pos).div(movingSeconds * 1000);
    speed = (finalPos.mag() - pos.mag()) / movingSeconds;
    println();
    println("--------------------------");
    println("position -> " + pos + " / final position -> " + finalPos + " / movimentation speed -> [" + nfs((float)speed, 0, 2) + "]");
    println("rotation -> [" + nfs((float)angle, 0, 2) + "] / final angle -> [" + nfs((float)finalAngle, 0, 2) + "] / rotation speed -> [" + nfs((float)angularSpeed, 0, 2) + "]");
  }


  public void Show()
  {
    pushMatrix();

    translate(pos.x, pos.y);
    rotate(radians((float)angle + 90));
    image(player, 0, 0, 24, 16);   

    popMatrix();

    if (!isMoving && !isRotating) return;

    pushMatrix();

    translate(finalPos.x, finalPos.y);
    image(target, 0, 0);

    popMatrix();
  }
}
