class Button {

  String Text = "";
  PVector Position = new PVector();
  PVector Size = new PVector();
  String Shape = "";
  PVector Colour = new PVector();
  PVector TextColour = new PVector(220, 150, 150);
  PVector StaticColour = new PVector();
  PVector StaticTextColour = TextColour.copy();

  Button(String _Text, PVector _Position, PVector _Size, String _Shape, PVector _Colour) {
    Text = _Text;
    Position = _Position;
    Size = _Size;
    Shape = _Shape;
    Colour = _Colour;
    StaticColour = _Colour.copy();
  }

  void Draw() throws RuntimeException {
    if (Shape == "rect") {
      rectMode(CENTER);
      fill(Colour.x, Colour.y, Colour.z);

      rect(Position.x, Position.y, Size.x, Size.y);
    } else if (Shape == "ellipse") {
      ellipseMode(CENTER);
      fill(Colour.x, Colour.y, Colour.z);

      ellipse(Position.x, Position.y, Size.x, Size.y);
    } else {
      throw new RuntimeException("Shape " + Shape + " is not a valid shape");
    }
    
    fill(TextColour.x, TextColour.y, TextColour.z);
    textAlign(CENTER);
    textSize(25);
    text(Text, Position.x, Position.y + textAscent()/2);
  }


  boolean CheckIfMouseOver() {
    if (Shape == "rect")
    {
      if (mouseX > (Position.x - Size.x/2) && mouseX < (Position.x + Size.x/2) && mouseY > (Position.y - Size.y/2) && mouseY < (Position.y + Size.y/2)) {
        return true;
      } else {
        return false;
      }
    } else if (Shape == "ellipse") {
      if (dist(mouseX, mouseY, Position.x, Position.y) <= Size.x/2) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
