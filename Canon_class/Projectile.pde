class Projectile{
  PVector Velocity = new PVector(0, 0);
  PVector Position;
  float Size;
  PVector Colour;
  PVector Resistance = new PVector(0, 0);
  
  Projectile(PVector _Velocity,PVector _Position, float _Size, PVector _Colour, PVector _Resistance){
    Velocity = _Velocity;
    Position = _Position;
    Size = _Size;
    Colour = _Colour;
    Resistance = _Resistance;
  }
  
  Projectile(PVector _Position, float _Size, PVector _Colour){
    Position = _Position;
    Size = _Size;
    Colour = _Colour;
  }
  
  void Draw(){
    ellipseMode(CENTER);
    fill(Colour.x, Colour.y, Colour.z);
    stroke(0);
    
    pushMatrix();
    
    translate(Canon.Size.y/2, height - Canon.Size.y/2);
    
    ellipse(Position.x, Position.y, Size, Size);
    
    Position.add(Velocity);
    Velocity.add(Resistance);
    
    popMatrix();
    
    if(Position.x > (width + Size/2) || Position.y > (Canon.Size.y/2 + Size/2)){
      Projectiles.remove(this);
    }
  }
  
  void UpdateVerticalVelocity(){
    Velocity.y = Velocity.copy().y * -1;
  }
  
  void UpdateHorizontalVelocity(){
    Velocity.x = Velocity.copy().x * -1;
  }
}
