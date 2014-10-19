import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

Ball ball;

ArrayList<Wall> wallList;

void setup()
{
  size(640, 480, P2D);
  
  // Init box2d world
  box2d = new Box2DProcessing (this);
  
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -10);
 
  ball = new Ball(15.0f, new Vec2(125, 0));
  ball.fillColor = color(255, 0, 0);

  wallList = new ArrayList<Wall>();  
  
  Vec2[] vertices = new Vec2[4];
  vertices[0] = new Vec2(0,0);
  vertices[1] = new Vec2(150,100);
  vertices[2] = new Vec2(280,50);
  vertices[3] = new Vec2(120,10);
  
  Wall wallToAdd = new Wall(new Vec2(20,50), vertices);
  wallToAdd.fillColor = color(255, 255, 0);
  wallToAdd.strokeColor = color(255, 0, 255);
  wallList.add(wallToAdd);
}

void draw()
{
  // Update physics world
  background(100, 149, 237); 
  box2d.step();
  ball.render();
  
  for(Wall w : wallList)
  {
    w.render(); 
  }
}
