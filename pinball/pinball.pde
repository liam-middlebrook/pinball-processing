import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

Ball ball;

ArrayList<Wall> wallList;

void setup()
{
  size(600, 800, P2D);
  
  // Init box2d world
  box2d = new Box2DProcessing (this);
  
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -10);
 
  ball = new Ball(15.0f, new Vec2(550, 100));
  ball.fillColor = color(255, 0, 0);

  wallList = new ArrayList<Wall>();  
  
  Vec2[] vertices = new Vec2[4];
  vertices[0] = new Vec2(10,400);
  vertices[1] = new Vec2(10,560);
  vertices[2] = new Vec2(115,560);
  vertices[3] = new Vec2(110,15);
  
  Wall wallToAdd = new Wall(new Vec2(410,140), vertices);
  wallToAdd.fillColor = color(255);
  wallToAdd.strokeColor = color(0);
  
  wallList.add(wallToAdd);
  
  vertices = new Vec2[4];
  vertices[0] = new Vec2(0, 0);
  vertices[1] = new Vec2(0, 700);
  vertices[2] = new Vec2(20,700);
  vertices[3] = new Vec2(20,0);
  
  wallToAdd = new Wall(new Vec2(580,0), vertices);
  wallToAdd.fillColor = color(255);
  wallToAdd.strokeColor = color(0);
  wallList.add(wallToAdd);
  
  vertices = new Vec2[3];
  vertices[0] = new Vec2(0, 0);
  vertices[1] = new Vec2(110, 60);
  vertices[2] = new Vec2(400, 0);
  
  wallToAdd = new Wall(new Vec2(200,0), vertices);
  wallToAdd.fillColor = color(255);
  wallToAdd.strokeColor = color(0);
  wallList.add(wallToAdd);
  
  vertices = new Vec2[4];
  vertices[0] = new Vec2(0, 210);
  vertices[1] = new Vec2(90, 210);
  vertices[2] = new Vec2(200, 0);
  vertices[3] = new Vec2(0, 0);
  
  wallToAdd = new Wall(new Vec2(00,0), vertices);
  wallToAdd.fillColor = color(255);
  wallToAdd.strokeColor = color(0);
  wallList.add(wallToAdd);
  
  vertices = new Vec2[4];
  vertices[0] = new Vec2(0, 0);
  vertices[1] = new Vec2(0, 500);
  vertices[2] = new Vec2(90, 500);
  vertices[3] = new Vec2(90, 0);
  
  wallToAdd = new Wall(new Vec2(0, 210), vertices);
  wallToAdd.fillColor = color(255);
  wallToAdd.strokeColor = color(0);
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
