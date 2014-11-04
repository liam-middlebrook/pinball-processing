import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.Manifold;
import org.jbox2d.common.*;
import org.jbox2d.callbacks.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

Ball ball;

ArrayList<Wall> wallList;

Plunger plunger;

Flipper flipper;

ArrayList<Bumper> bumperList;

int playerScore;

void setup()
{
  size(600, 800, P2D);
  smooth();

  // Init box2d world
  box2d = new Box2DProcessing (this);
  box2d.createWorld();

  // We are setting a custom gravity
  box2d.setGravity(0, -10);

  // Start listening for collisions
  box2d.listenForCollisions();

  ball = new Ball(15.0f, new Vec2(550, 100));
  ball.fillColor = color(255, 0, 0);

  wallList = new ArrayList<Wall>();  

  plunger = new Plunger(new Vec2( 550, 650));

  flipper = new Flipper(new Vec2( 300, 600));
  flipper.fillColor = color(255, 0, 0);

  bumperList = new ArrayList<Bumper>();

  addWalls();
  addBumpers();
}

void draw()
{
  // Update physics world
  background(100, 149, 237); 
  box2d.step();
  ball.render();

  for (Wall w : wallList)
  {
    w.render();
  }


  for (Bumper b : bumperList)
  {
    b.render();
  }
  plunger.render();
  flipper.render();
  fill(0);
  text("Score: " + playerScore, 5, 15);
}

void beginContact(Contact c)
{
  // Detect collisions for objects

  // Get the colliding fixtures
  Fixture f1 = c.getFixtureA();
  Fixture f2 = c.getFixtureB();

  // Get the bodies of each fixture
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  // Get the objects that the bodies are from
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  // If either object is null return
  if (o1 == null || o2 == null)
  {
    return;
  }

  if (o1 instanceof Bumper && o2 instanceof Ball) 
  {
    Bumper bumper = (Bumper)o1;
    Ball ball = (Ball)o2;

    bumper.collide(ball, color(0));
  } else if (o1 instanceof Ball && o2 instanceof Bumper) 
  {
    Bumper bumper = (Bumper)o2;
    Ball ball = (Ball)o1;

    bumper.collide(ball, color(0));
  }
}
void endContact(Contact c)
{
}


void keyPressed()
{
  // space activates plunger
  if (key == ' ')
  {
    plunger.pullPlunger();
  }
  if (key == 'a')
  {
    flipper.flip();
  }
}
void addWalls()
{
  Vec2[] vertices = new Vec2[4];
  vertices[0] = new Vec2(10, 400);
  vertices[1] = new Vec2(10, 560);
  vertices[2] = new Vec2(115, 560);
  vertices[3] = new Vec2(110, 15);

  Wall wallToAdd = new Wall(new Vec2(410, 140), vertices);
  wallToAdd.fillColor = color(255);
  wallToAdd.strokeColor = color(0);

  wallList.add(wallToAdd);

  vertices = new Vec2[4];
  vertices[0] = new Vec2(0, 0);
  vertices[1] = new Vec2(0, 700);
  vertices[2] = new Vec2(20, 700);
  vertices[3] = new Vec2(20, 0);

  wallToAdd = new Wall(new Vec2(580, 0), vertices);
  wallToAdd.fillColor = color(255);
  wallToAdd.strokeColor = color(0);
  wallList.add(wallToAdd);

  vertices = new Vec2[4];
  vertices[0] = new Vec2(300, 0);
  vertices[1] = new Vec2(325, 10);
  vertices[2] = new Vec2(400, 80);
  vertices[3] = new Vec2(400, 0);

  wallToAdd = new Wall(new Vec2(200, 0), vertices);
  wallToAdd.fillColor = color(255);
  wallToAdd.strokeColor = color(0);
  wallList.add(wallToAdd);

  vertices = new Vec2[3];
  vertices[0] = new Vec2(000, 0);
  vertices[1] = new Vec2(200, 50);
  vertices[2] = new Vec2(300, 0);

  wallToAdd = new Wall(new Vec2(200, 0), vertices);
  wallToAdd.fillColor = color(255);
  wallToAdd.strokeColor = color(0);
  wallList.add(wallToAdd);

  vertices = new Vec2[4];
  vertices[0] = new Vec2(0, 210);
  vertices[1] = new Vec2(90, 210);
  vertices[2] = new Vec2(200, 0);
  vertices[3] = new Vec2(0, 0);

  wallToAdd = new Wall(new Vec2(00, 0), vertices);
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
void addBumpers()
{ 
  Bumper bumper = new Bumper(new Vec2( 150, 700), 50);
  bumper.fillColor = color(255, 0, 0);
  bumperList.add(bumper);

  bumper = new Bumper(new Vec2( 250, 700), 50);
  bumper.fillColor = color(0, 255, 0);
  bumperList.add(bumper);

  bumper = new Bumper(new Vec2( 350, 700), 50);
  bumper.fillColor = color(255, 255, 0);
  bumperList.add(bumper);

  bumper = new Bumper(new Vec2( 250, 350), 25);
  bumper.fillColor = color(0, 0, 255);
  bumperList.add(bumper);
}

