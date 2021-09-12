Canon Canon; //<>// //<>//
Button FireCanonButton;
Trails TrailPrediction;
Obstecal Obstecal1;
Obstecal Obstecal2;
Obstecal Obstecal3;
Obstecal Obstecal4;
Obstecal Obstecal5;
Obstecal Obstecal6;

ArrayList <Projectile> PredictionTrailArray;
ArrayList <Projectile> Projectiles;
ArrayList <Obstecal> Obstecals;

int PredictionTrailLength = 20;
int ObstecalStartFallDistance = 20;
float ObstecalOrigo;
int Bund = 25;

PImage Background;

void setup() {
  frameRate(100);
  fullScreen();

  //---------- Main menu ----------
  rectColor = color(0); //farve af firkant
  rectHighlight = color(139, 0, 0); //farve af firkanten når musen er over den
  circleColor = color(255); //farve af cirkel
  circleHighlight = color(139, 0, 0); //farve af cirkel når musen er over den
  baseColor = color(0);
  currentColor = baseColor;
  circleX = width/2;
  circleY = height/2+circleSize/2+80;
  rectX = width/2;
  rectY = height/2;
  img = loadImage("giphy.gif"); //load ind et billedet
  ISize = height*0.27;
  Ix = -(width+20+ISize/2); // X af billedet
  Iy = 75 + ISize/2; // Y af billedet
  //-----------------------------

  Background = loadImage("Background.png");
  Background.resize(width, height);

  ObstecalOrigo = width - width * 1/4;

  PredictionTrailArray = new ArrayList <Projectile>();
  Projectiles = new ArrayList<Projectile>();
  Obstecals = new ArrayList<Obstecal>();

  Obstecal1 = new Obstecal(new PVector(ObstecalOrigo, + 25 - 50 - ObstecalStartFallDistance), new PVector(150, 100), new PVector(150, 150, 150));
  Obstecal2 = new Obstecal(new PVector(ObstecalOrigo - 125, + 25 - 200 - ObstecalStartFallDistance), new PVector(150, 100), new PVector(150, 150, 150));
  Obstecal3 = new Obstecal(new PVector(ObstecalOrigo, + 25 - 125 - ObstecalStartFallDistance), new PVector(500, 50), new PVector(150, 150, 150));
  Obstecal4 = new Obstecal(new PVector(ObstecalOrigo + 125, + 25 - 200 - ObstecalStartFallDistance), new PVector(150, 100), new PVector(150, 150, 150));
  Obstecal5 = new Obstecal(new PVector(ObstecalOrigo, + 25 - 275 - ObstecalStartFallDistance), new PVector(400, 50), new PVector(150, 150, 150));
  Obstecal6 = new Obstecal(new PVector(ObstecalOrigo, + 25 - 350 - ObstecalStartFallDistance), new PVector(150, 100), new PVector(150, 150, 150));

  Canon = new Canon(new PVector(200, 200, 200), new PVector(175, 50));

  FireCanonButton = new Button("Fire", new PVector(Canon.PowerMeterPosition.x + Canon.MeterSize.x * 1.19, Canon.PowerMeterPosition.y + Canon.MeterSize.y/2), new PVector(60, 30), "rect", new PVector(150, 150, 150));

  TrailPrediction = new Trails(10, new PVector(255, 200, 200));

  TrailPrediction.Calculate(Canon.Position.copy(), Canon.CalculateFieringVelocety(), Canon.Resistance.copy(), PredictionTrailArray, PredictionTrailLength);
}

void draw() {
  if (GameState == "main menu") {

    DrawMainMenu();
  } else if (GameState == "game on") {
    textFont(createFont("Lucida Sans", 12));

    background(150);

    imageMode(CORNER);
    image(Background, 0, 0);

    for (int i = 0; i < PredictionTrailArray.size(); i++) {
      PredictionTrailArray.get(i).Draw();
    }

    Canon.DrawAngelMeter();
    Canon.DrawPowerMeter();
    FireCanonButton.Draw();

    //Check if the canon is abel to fire
    for (int i = 0; i < Obstecals.size(); i++) {
      if (!Obstecals.get(i).Hit && Projectiles.size() == 0) {

        Canon.Fireable = true;
      } else {

        Canon.Fireable = false;
      }
    }

    for (int i = 0; i < Obstecals.size(); i++) {
      Obstecals.get(i).Draw();
    }

    for (int i = 0; i < Projectiles.size(); i++) {
      Projectiles.get(i).Draw();
    }

    Canon.Draw();

    //Check if the obstecals is hit by a projectile
    for (int i = 0; i < Obstecals.size(); i++) {
      for (int u = 0; u < Projectiles.size(); u++) {
        if (Obstecals.get(i).CheckIfHit(Projectiles.get(u).Position, new PVector(Projectiles.get(u).Size, Projectiles.get(u).Size)) == "left" &&
          !Obstecals.get(i).Hit) {

          Obstecals.get(i).UpdateVelocity(Projectiles.get(u).Velocity.copy());
          Obstecals.get(i).Hit = true;

          Projectiles.get(u).UpdateHorizontalVelocity();
        } else if (Obstecals.get(i).CheckIfHit(Projectiles.get(u).Position, new PVector(Projectiles.get(u).Size, Projectiles.get(u).Size)) == "right") {

          Projectiles.get(u).UpdateHorizontalVelocity();
        } else if (Obstecals.get(i).CheckIfHit(Projectiles.get(u).Position, new PVector(Projectiles.get(u).Size, Projectiles.get(u).Size)) == "top") {

          Projectiles.get(u).UpdateVerticalVelocity();
        } else if (Obstecals.get(i).CheckIfHit(Projectiles.get(u).Position, new PVector(Projectiles.get(u).Size, Projectiles.get(u).Size)) == "bottom") {

          Projectiles.get(u).UpdateVerticalVelocity();
        }
      }
    }

    //Check if the obstecals is standing on another obstecal or if the obstecal is standing on the ground
    for (int i = 0; i < Obstecals.size(); i++) {
      if (Obstecals.size() == 1) {
        if (Obstecals.get(i).CheckIfStandingOnSomething(new PVector(width/2, + Canon.Size.y/2), new PVector(width, 0))) {

          Obstecals.get(i).StandingOnSomething = true;
        } else {

          Obstecals.get(i).StandingOnSomething = false;
        }
      } else {
        int u = -1;
        do {
          u++;

          if (i != u && u < Obstecals.size()) {
            if (Obstecals.get(i).CheckIfStandingOnObstecal(Obstecals.get(u)) ||
              Obstecals.get(i).CheckIfStandingOnSomething(new PVector(width/2, + Canon.Size.y/2), new PVector(width, 0))) {

              Obstecals.get(i).StandingOnSomething = true;
            } else {

              Obstecals.get(i).StandingOnSomething = false;
            }
          }
        } while (u < Obstecals.size() && (!Obstecals.get(i).CheckIfStandingOnObstecal(Obstecals.get(u)) ||
          Obstecals.get(i).CheckIfStandingOnSomething(new PVector(width/2, Canon.Size.y/2), new PVector(width, 0))));
      }
    }
  }
}
