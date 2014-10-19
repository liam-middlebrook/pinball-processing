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
    shape.m_radius = box2d.scalarPixelsToWorld(radius);
    
    // Create circle fixture
    FixtureDef fixture = new FixtureDef();
    fixture.shape = shape;
    fixture.density = 1.0f;
    
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
    this.pBody.setAwake(true);
    Vec2 ballPos = box2d.getBodyPixelCoord(this.pBody);
   
    float angle = this.pBody.getAngle();
   
    pushMatrix();
    translate(ballPos.x, ballPos.y);
    rotate(-angle);
    ellipse(0, 0, radius, radius);
    popMatrix(); 
  }
}
