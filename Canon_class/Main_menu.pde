int rectX, rectY;      // Position of square button
int circleX, circleY;  // Position of circle button
int rectSize = 90;     // Diameter of rect
int circleSize = 118; // Diameter of circle 
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;
boolean partyMode = false;
boolean Rudy = true;
int w = 100;
int h = 100;
PFont font;
String GameState = "main menu";
float r = random(0,255);
float o = random(0,255);
float p = random(0,255);
PImage img;
float Ix;
float Iy;
float ISize;

void DrawMainMenu()
{
  update(mouseX, mouseY);
  background(100);
  if((partyMode) == true){
  background(random(0,255),random(0,255),random(0,255));
  }
  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  imageMode(CENTER);
  image(img,-Ix,Iy,ISize,ISize);
  
    
  
  stroke(255);
  rectMode(CENTER);
  rect(rectX, rectY, rectSize+100, rectSize+60);
  if (circleOver) {
    fill(circleHighlight);
  } else {
    fill(baseColor);
  }
  stroke(0);
  ellipseMode(CENTER);
  ellipse(circleX, circleY+30, circleSize+50, circleSize+50);
  
   String T = "Angry Steffos";
font = loadFont("Stencil-48.vlw");
fill(128,0,0);
textFont(font,100);
textAlign(CENTER);
text(T,width/2,100); 
  
  
  
String A = "play";
font = loadFont("Stencil-48.vlw");
fill(255);
textFont(font,40);
text(A,rectX-5,rectY+10);


String B = "exit";
font = loadFont("Stencil-48.vlw");
fill(255);
textFont(font,25);
text(B,circleX,circleY+36);
}

void update(int x, int y) {              //denne del finder ud af musen er over knapperne. Og aktiverer true og false statements
  if ( overCircle(circleX, circleY, circleSize) ) {
     circleOver = true;
    rectOver = false;
  } else if ( overRect(rectX - (rectSize + 40)/2, rectY - rectSize/2, rectSize+40, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }
}
  
  
boolean overCircle(int x, int y, int diameter) { //definerer overCircle
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}




boolean overRect(int x,int y,int width, int height){ //definerer overRect
   if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }

}
