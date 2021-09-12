class Trails {
  PVector Colour;
  float Outline = 0;
  float TrailSpace;

  float x = 0;

  Trails(float _TrailSpace, PVector _Colour) {
    TrailSpace = _TrailSpace;
    Colour = _Colour;
  }

  void Calculate(PVector Location, PVector Velocity, PVector Resistense, ArrayList <Projectile> TrailArray, int TrailLength) {
    if (TrailLength == 0) {
      while (Location.x < width && Location.y <= 0) {
        for ( int u = 0; u < TrailSpace; u++) {
          Location.add(Velocity);
          Velocity.add(Resistense);
        }

        TrailArray.add(new Projectile(Location.copy(), Canon.Size.y * 0.25, Colour.copy()));
      }
    } else if (TrailLength > 0 ) {
      while (TrailArray.size() < TrailLength) {
        for ( int u = 0; u < TrailSpace; u++) {
          Location.add(Velocity);
          Velocity.add(Resistense);
        }

        TrailArray.add(new Projectile(Location.copy(), Canon.Size.y * 0.25, Colour.copy()));
      }
    }
  }
}
