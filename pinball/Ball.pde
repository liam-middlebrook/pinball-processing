class Ball
{
  // Box2D body
  Body pBody; 

  float radius;

  Ball(float radius, Vec2 position)
  {
    this.radius = radius;

    // Create circle shape
    CircleShape shape = new CircleShape();
    shape.m_radius = box2d.scalarPixelsToWorld(radius/2);

    // Create circle fixture
    FixtureDef fixture = new FixtureDef();
    fixture.shape = shape;
    fixture.density = 1.0f;
    fixture.restitution = 0.5f;

    // Define physics body
    BodyDef bodyDef = new BodyDef();
    bodyDef.type = BodyType.DYNAMIC;
    bodyDef.position.set(box2d.coordPixelsToWorld(position));

    // Add body to world
    this.pBody = box2d.createBody(bodyDef);
    this.pBody.createFixture(fixture);
  }

  void render()
  {
    Vec2 ballPos = box2d.getBodyPixelCoord(this.pBody);

    float angle = this.pBody.getAngle();

    pushMatrix();
    translate(ballPos.x, ballPos.y);
    rotate(-angle);
    ellipse(0, 0, radius, radius);
    popMatrix();
  }
}

