// © Artiom Covali 2023

private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = 9.25;  
private double rightCurl = 500.00;  
private double leftCurl = 500.00;   
 boolean increaseRight = false;
 boolean decreaseRight = false;
 boolean increaseLeft = false;
 boolean decreaseLeft = false;
 int r;
 int g;
 int b;
public void setup() 
{   
  size(750,700);    
} 
public void draw() 
{   
  
  background(0, 213, 255);  
  noStroke();
  fill(167, 245, 66);
  ellipse(400,700,1000,300);
  fill(255, 217, 0);
   ellipse(700,10,200,200);
  //stroke(107, 66, 25); 
  stroke(r, g, b); 
  strokeWeight(15);
  
  line(375,430,375,600); 
 // stroke(r, g, b); 
  if (increaseRight==true  ) {
    rightCurl+= .02;
  }
  if (decreaseRight==true  ) {
    rightCurl-= .02;
  }
    if (increaseLeft==true ) {
    leftCurl+= .02;
  }
  if (decreaseLeft==true) {
    leftCurl-= .02;
  }  
  if (Math.round(leftCurl*100.0)/100.0 == 499.68){
    leftCurl = 499.7;
  }
  if (Math.round(rightCurl*100.0)/100.0 == 499.68){
    rightCurl = 499.7;
  }
  if (Math.round(leftCurl*100.0)/100.0 == 502.84){
    leftCurl = 502.8;
    //leftCurl = Math.round(leftCurl*100.0)/100.0;
  }
  if (Math.round(rightCurl*100.0)/100.0 == 502.84){
    rightCurl = 502.8;
    //rightCurl = Math.round(rightCurl*100.0)/100.0;
  }
  Branches(375,430,110,3*Math.PI/2,9);  
// System.out.println("Left Curl"+leftCurl);
 // System.out.println("Right Curl"+rightCurl);
} 
public void Branches(int x,int y, double branchLength, double angle, int strokeWght) 
{   

  branchLength = branchLength*fractionLength;

  double angle1= angle+rightCurl+branchAngle;
  double angle2= angle-leftCurl-branchAngle;
   int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);

  strokeWeight(strokeWght);
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);

  
  if(branchLength>=smallestBranch){
    if(strokeWght>1){
      strokeWght--;
    }
    Branches(endX1,endY1,branchLength,angle1,strokeWght);
    Branches(endX2,endY2,branchLength,angle2,strokeWght);
  }
} 
public void keyPressed(){

  if(key=='w'){
    increaseRight = true;
  }
  if(key=='e'){
    decreaseRight = true;
  }
  if(key=='w'){
    increaseLeft = true;
  }
  if(key=='e'){
    decreaseLeft = true;
  }
}
public void keyReleased(){
  if(key=='w'){
    increaseRight = false;
  }
  if(key=='e'){
    decreaseRight = false;
  }
  if(key=='w'){
    increaseLeft = false;
  }
  if(key=='e'){
    decreaseLeft = false;
  }
}

public void mouseClicked(){
  r = (int)(Math.random()*256);
  g = (int)(Math.random()*256);
  b = (int)(Math.random()*256);
}
