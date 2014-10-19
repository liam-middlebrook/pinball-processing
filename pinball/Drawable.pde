class Drawable
{
  // The fill color of the object
  color fillColor;
  
  // The stroke color of the object
  color strokeColor; 
  
  // Changes the color appropriately (doesn't work on PShapes) 
  void render()
  {
    stroke(strokeColor);
    fill(fillColor);
  }
}
