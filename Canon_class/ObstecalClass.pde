class Obstecal { //<>// //<>// //<>//
  PVector Position;
  PVector Size;
  PVector Colour;
  boolean StandingOnSomething = true;
  boolean Hit = false;
  float DownForce = 1;
  PVector Velocity = new PVector(0, 0);

  Obstecal(PVector _Position, PVector _Size, PVector _Colour) {
    Position = _Position;
    Size = _Size;
    Colour = _Colour;

    Obstecals.add(this);
  }

  void Draw() {
    rectMode(CENTER);
    fill(Colour.x, Colour.y, Colour.z);
    stroke(0);

    pushMatrix();

    translate(Canon.Size.y/2, height - Canon.Size.y/2);

    rect(Position.x, Position.y, Size.x, Size.y);

    popMatrix();

    Position.x += Velocity.copy().x;

    if (!StandingOnSomething) {
      Position.y += DownForce;
    }

    if (Position.x > (width + Size.x/2) || Position.y > (Canon.Size.y/2 + Size.y/2)) {
      Obstecals.remove(this);
    }
  }

  String CheckIfHit(PVector ProjectilePosition, PVector ProjectileSize) {
    String Hit = "Not hit";
    if (ProjectilePosition.x + ProjectileSize.x/2 > Position.x - Size.x/2 &&
      (ProjectilePosition.x - ProjectileSize.x/2 < Position.x + Size.x/2) &&
      (ProjectilePosition.y + ProjectileSize.y/2 > Position.y - Size.y/2) &&
      (ProjectilePosition.y - ProjectileSize.y/2 < Position.y + Size.y/2)) {
      
        if (ProjectilePosition.x + ProjectileSize.x/2 < Position.x &&
        ProjectilePosition.y + ProjectileSize.y/2 > Position.y - Size.y/2 &&
        ProjectilePosition.y - ProjectileSize.y/2 < Position.y + Size.y/2) {

        Hit = "left";
      } else if (ProjectilePosition.x - ProjectileSize.x/2 > Position.x &&
        ProjectilePosition.y + ProjectileSize.y/2 > Position.y - Size.y/2 &&
        ProjectilePosition.y - ProjectileSize.y/2 < Position.y + Size.y/2) {

        Hit = "right";
      } else if (ProjectilePosition.y + ProjectileSize.y/2 < Position.y &&
        ProjectilePosition.x + ProjectileSize.x/2 > Position.x - Size.y/2 &&
        ProjectilePosition.x - ProjectileSize.x/2 < Position.x + Size.y/2) {

        Hit = "top";
      } else if (ProjectilePosition.y - ProjectileSize.y/2 > Position.y &&
        ProjectilePosition.x + ProjectileSize.x/2 > Position.x - Size.y/2 &&
        ProjectilePosition.x - ProjectileSize.x/2 < Position.x + Size.y/2) {

        Hit = "bottom";
      }
    }
    return Hit;
  }

  boolean CheckIfStandingOnObstecal(Obstecal Obstecal) {
    return CheckIfStandingOnSomething(Obstecal.Position.copy(), Obstecal.Size.copy());
  }

  boolean CheckIfStandingOnSomething(PVector ObstecalPosition, PVector ObstecalSize) {
    if (ObstecalSize.x <= Size.x &&
      (ObstecalPosition.x - ObstecalSize.x/2 <= Position.x + Size.x/2 && ObstecalPosition.x - ObstecalSize.x/2 >= Position.x - Size.x/2 ||
      ObstecalPosition.x + ObstecalSize.x/2 <= Position.x + Size.x/2 && ObstecalPosition.x + ObstecalSize.x/2 >= Position.x - Size.x/2) &&
      Position.y + Size.y/2 == ObstecalPosition.y - ObstecalSize.y/2) {
      return true;
    } else if (ObstecalSize.x > Size.x &&
      (Position.x - Size.x/2 <= ObstecalPosition.x + ObstecalSize.x/2 && Position.x - Size.x/2 >= ObstecalPosition.x - ObstecalSize.x/2 ||
      Position.x + Size.x/2 <= ObstecalPosition.x + ObstecalSize.x/2 && Position.x + Size.x/2 >= ObstecalPosition.x - ObstecalSize.x/2) &&
      Position.y + Size.y/2 == ObstecalPosition.y - ObstecalSize.y/2) {
      return true;
    } else if (Position.y + Size.y/2 >= Bund) {
      return true;
    }

    return false;
  }

  void UpdateVelocity(PVector _Velocity) {
    Velocity = _Velocity.copy();
  }
}
