void mouseMoved() {
  if (FireCanonButton.CheckIfMouseOver()) { //
    FireCanonButton.Colour.x = FireCanonButton.StaticColour.x + 20;
    FireCanonButton.Colour.y = FireCanonButton.StaticColour.y + 20;
    FireCanonButton.Colour.z = FireCanonButton.StaticColour.z + 20;

    FireCanonButton.TextColour.x = FireCanonButton.StaticTextColour.x + 20;
    FireCanonButton.TextColour.y = FireCanonButton.StaticTextColour.y + 20;
    FireCanonButton.TextColour.z = FireCanonButton.StaticTextColour.z + 20;

    cursor(HAND);
  } else {   
    FireCanonButton.Colour.x = FireCanonButton.StaticColour.x;
    FireCanonButton.Colour.y = FireCanonButton.StaticColour.y;
    FireCanonButton.Colour.z = FireCanonButton.StaticColour.z;

    FireCanonButton.TextColour.x = FireCanonButton.StaticTextColour.x;
    FireCanonButton.TextColour.y = FireCanonButton.StaticTextColour.y;
    FireCanonButton.TextColour.z = FireCanonButton.StaticTextColour.z;

    cursor(ARROW);
  }
}

void mouseClicked() {
  if (FireCanonButton.CheckIfMouseOver() && Canon.Fireable) {
    Canon.FireProjecile();
  }
  
  if (circleOver) {
    exit();
  }
  if (rectOver) {
    GameState = "game on";
  }
}
