class Canon {
  PVector Position = new PVector(0, 0);
  PVector Size = new PVector();
  PVector Colour = new PVector();
  boolean Fireable = true;

  PVector VelocityData = new PVector();
  PVector Resistance = new PVector(0, 0.005);
  int Angel = -5;
  float MaxVelocity = 4;
  float SubtractiveVelocity = 1; //The velocity subtracted from the max vilocity
  float Power = 0.01; //procentivis kraft

  PVector MeterSize = new PVector(160, 30);
  PVector MeterColour = new PVector(150, 150, 150);
  PVector MeterTextColour = new PVector(220, 150, 150);
  PVector AngelMeterPosition = new PVector(0, 0);
  PVector PowerMeterPosition = new PVector(AngelMeterPosition.x + MeterSize.x, 0);
  int MeterTextSize = 25;
  

  Canon(PVector _Colour, PVector _Size) {
    Colour = _Colour;
    Size = _Size;
  }

  void Draw() {
    fill(Colour.x, Colour.y, Colour.z);
    rectMode(CENTER);
    ellipseMode(CENTER);
    stroke(0);
    
    pushMatrix();
    
    translate(Size.y/2, height - Size.y/2);

    rotate(radians(Angel));
    rect(Position.x, Position.y, Size.x, Size.y);

    rotate(radians(-Angel));
    ellipse(0 - 10, 0 + 10, Size.y * 1.5, Size.y * 1.5);

    popMatrix();
  }
  
  void DrawAngelMeter() {
    rectMode(CORNER);
    fill(MeterColour.x, MeterColour.y, MeterColour.z);
    stroke(0);

    rect(AngelMeterPosition.x, AngelMeterPosition.y, MeterSize.x, MeterSize.y);

    fill(MeterTextColour.x, MeterTextColour.y, MeterTextColour.z);
    textAlign(CENTER);
    textSize(MeterTextSize);

    text("Angel " + -Angel + "°", AngelMeterPosition.x + MeterSize.x/2, AngelMeterPosition.y + textAscent());
  }

  void DrawPowerMeter() {

    rectMode(CORNER);
    fill(MeterColour.x, MeterColour.y, MeterColour.z);
    stroke(0);

    rect(PowerMeterPosition.x, PowerMeterPosition.y, MeterSize.x, MeterSize.y);

    fill(MeterTextColour.x, MeterTextColour.y, MeterTextColour.z);
    textAlign(CENTER);
    textSize(MeterTextSize);

    text("Power " + ceil(Power * 100) + "%", PowerMeterPosition.x + MeterSize.x/2, PowerMeterPosition.y + textAscent());
  }

  void FireProjecile() {
    PVector FireVelocety = CalculateFieringVelocety();

    Projectiles.add(new Projectile(FireVelocety, Position.copy(), Size.y, Colour, Resistance.copy()));
  }

  PVector CalculateFieringVelocety() {
    PVector FireVelocety;  

    float xPower = (MaxVelocity -(SubtractiveVelocity * (1 - Power))) * cos(radians(Angel));
    float yPower = -(MaxVelocity -(SubtractiveVelocity * (1 - Power))) * sin(radians(Angel));

    FireVelocety = new PVector(xPower, -yPower);

    return FireVelocety;
  }
}
