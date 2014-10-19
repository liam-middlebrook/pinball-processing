import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

Ball ball;
Wall wall;
void setup()
{
  size(640, 480);
  
  // Init box2d world
  box2d = new Box2DProcessing (this);
  
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -10);
 
  ball = new Ball(10.0f, new Vec2(125, 0));
  wall = new Wall(new Vec2(25,300), new Vec2(200, 10));
}

void draw()
{
  // Update physics world
  background(100, 149, 237); 
  fill(255);
  box2d.step();
  ball.render();
  wall.render();
}
