class Flipper extends Drawable
{
  // Box2D body
  Body pBody; 
  PShape pShape;

  Flipper(Vec2 position)
  {
    // Create shape
    PolygonShape shape = new PolygonShape();

    Vec2[] vertices = new Vec2[4];
    vertices[0] = new Vec2(0, 0);
    vertices[1] = new Vec2(0, 10);
    vertices[2] = new Vec2(50, 10);
    vertices[3] = new Vec2(50, 0);


    // Create an array to temporarily store the box2D vertex coordinates
    Vec2[] box2DVertices = new Vec2[vertices.length];

    // Create a new PShape
    pShape = createShape();
    pShape.beginShape();

    // Iterate through every vertex
    for (int i = 0; i < vertices.length; i++)
    {
      float x = vertices[i].x;
      float y = vertices[i].y;

      // Add the vertex to the shape
      pShape.vertex(x, y);

      // Add the vertex (converted to box2D coords)
      box2DVertices[i] = new Vec2(box2d.scalarPixelsToWorld(x), -box2d.scalarPixelsToWorld(y));
    }

    // End the PShape
    pShape.endShape(CLOSE);

    // Set the box2D vertices 
    shape.set(box2DVertices, box2DVertices.length);

    // Define physics body
    BodyDef bodyDef = new BodyDef();
    bodyDef.type = BodyType.DYNAMIC;
    bodyDef.position.set(box2d.coordPixelsToWorld(position));

    // Add body to world
    this.pBody = box2d.createBody(bodyDef);
    this.pBody.createFixture(shape, 1);
    
    // set the callback data to this instance
    this.pBody.setUserData(this);
  }

  void render()
  {
    // Since we're using a PShape we can't just call fill and stroke
    pShape.setFill(fillColor);
    pShape.setStroke(strokeColor);

    Vec2 ballPos = box2d.getBodyPixelCoord(this.pBody);

    float angle = this.pBody.getAngle();
    
    pushMatrix();
    translate(ballPos.x, ballPos.y);
    rotate(-angle);
    shape(pShape);
    popMatrix();
  }
  void flip()
  {
    this.pBody.applyTorque(2000); 
  }
}

