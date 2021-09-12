void keyPressed(){
  if(keyCode == UP && Canon.Angel > -81){
    Canon.Angel -= 1;
    
    PredictionTrailArray.clear();
    TrailPrediction.Calculate(Canon.Position.copy(), Canon.CalculateFieringVelocety(), Canon.Resistance.copy(), PredictionTrailArray, PredictionTrailLength);
  }
  
  if(keyCode == DOWN && Canon.Angel < -5){
    Canon.Angel += 1;
    
    PredictionTrailArray.clear();
    TrailPrediction.Calculate(Canon.Position.copy(), Canon.CalculateFieringVelocety(), Canon.Resistance.copy(), PredictionTrailArray, PredictionTrailLength);
  }
  
  if(keyCode == LEFT && Canon.Power > 0.01){
    Canon.Power -= 0.01;
    
    PredictionTrailArray.clear();
    TrailPrediction.Calculate(Canon.Position.copy(), Canon.CalculateFieringVelocety(), Canon.Resistance.copy(), PredictionTrailArray, PredictionTrailLength);
  }
  
  if(keyCode == RIGHT && Canon.Power < 0.99){
    Canon.Power += 0.01;
    
    PredictionTrailArray.clear();
    TrailPrediction.Calculate(Canon.Position.copy(), Canon.CalculateFieringVelocety(), Canon.Resistance.copy(), PredictionTrailArray, PredictionTrailLength);
  }
}
