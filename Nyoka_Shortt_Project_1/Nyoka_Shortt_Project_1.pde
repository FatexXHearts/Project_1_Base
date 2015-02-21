//Variables For First Bee
int X, Y, step;

//Variables For Second Bee
float xSpeed = 4;
float sx = 20;

//Variables For Cloud
float c = 0;

//Second Cloud
float r = 0;

//Variables For Birds
float b = 0;



//Setup For The Sketch And Variables
void setup(){
  size(600,600);
  X = 0;
  Y = 0;
  frameRate(18);
}

void draw(){
  //Stops Bees From Leaving Trail When Moving
  background(92,172,255);
  
  //Pulls Appearance From Cloud And Makes Them Move
  c = c+1;
  pushMatrix();
    translate(c,0);
    fill(255);
    Cloud();
    if (c == 600) {
     c=0;}
  popMatrix();
  
  //Second Cloud
  r = r+2;
  pushMatrix();
    translate(r,20);
    fill(255);
    Cloud();
    if (r == 600) {
     r=0;}
  popMatrix();
  
  //Pull Appearance From Bird
  //Flock Of Birds
  b = b+3;
  pushMatrix();
    translate(70+b, 400);
    scale(.8);
    Bird();
  popMatrix();
  
  pushMatrix();
    translate(b, 420);
    scale(.6);
    Bird();
  popMatrix();
  
  pushMatrix();
    translate(b, 480);
    Bird();
  popMatrix();
  
  pushMatrix();
    translate(-280+b, 480);
    Bird();
  popMatrix();
  
  pushMatrix();
    translate(-580+b, 500);
    scale(.6);
    Bird();
  popMatrix();
  
   
  //Pull Appearance From Tree 
  Tree();
  
  //Pull Appearance From Hive 
  pushMatrix();
    translate(290,180);
    Hive();
  popMatrix();
  
  //Circle Appearing Over Hive
  pushMatrix();
    translate(200,160);
      fill (0); 
      ellipse (random(200),random(200), 5, 5);
  popMatrix();  
  
  //Creates First Bee To Be controlled
  pushMatrix();
    translate(X,Y);
    Bee();
  popMatrix();
  
  //Pulls Appearance From Second Bee And Set It's Position
  translate(sx, 300);
  Bee();
 
  //Set Speed For Second Bee
   sx += xSpeed;
  //Keeps Second Bee Within Sketch As It Move Back And Forth
  if (sx <= 0) {
    xSpeed *= -1; }
  else 
  if ( sx >= getWidth()) {
    xSpeed *= -1;}
}

//Cause First Bee to follow Mouse
void mouseMoved(){
  X = mouseX;
  Y = mouseY;  
}


//Bee's Apperance
void Bee(){
 //Sets So Orgins Will Be (0,0)
 pushMatrix();
   translate(-300,-300);
    //Bee Wing
    fill(255);
    stroke(255,217,129);
    strokeWeight(2);
    ellipse(290,278,35,40);
  
    //Second Bee Wing (Behind First)
    fill(255);
    stroke(255,217,129);
    strokeWeight(2);
    ellipse(278,275,35,40);
  
    //Bee Body
    fill(255,206,53);
    noStroke();
    ellipse(300,300,90,40);
    
    //Black Line
    beginShape();
    fill(0);
    vertex(282,281);
    vertex(310,281);
    vertex(310,320);
    vertex(282,320);
    endShape(CLOSE);
  
    //Bee Eye
    fill(0);
    ellipse(330,298,12,15);   
  popMatrix();
}


//Appearance Of Cloud
void Cloud(){
  pushMatrix();
  translate(-400,0);
    noStroke();
    ellipse(400,50,80,80);
    ellipse(420,50,50,75);
    ellipse(430,50,75,100);
    ellipse(440,50,100,50);
    ellipse(450,50,50,90);
    ellipse(480,50,50,75);
    ellipse(500,50,50,50);
 popMatrix();
}


//Apperance Of Tree
void Tree(){
//Green On The Tree
noStroke();
fill(10,181,53);
ellipse(120,50,400,100);
ellipse(210,10,400,100);
ellipse(120,90,200,90);

//Base Outline of Tree
beginShape();
  strokeWeight(3);
  stroke(92,45,23);
  fill(181,88,46);
  vertex(90,-10);
  vertex(95,140);
  vertex(120,140);
  vertex(130,150);
  vertex(290,160);
  vertex(280,170);
  vertex(280,190);
  vertex(100,170);
  vertex(90,250);
  vertex(130,630);
  vertex(-50,650);
  vertex(-50,-50);
endShape(CLOSE);

//Green On Branch
pushMatrix();
  noStroke();
  fill(10,181,53);
  ellipse(320,180,200,90);
popMatrix(); 
  
//Keeps Trees Veins Dark Brown 
  stroke(92,45,23);
  noFill();
  
//First Tree Vein Closest to Top
beginShape();
  vertex(40,70);
  vertex(40,90);
  vertex(80,150);
  vertex(85,190);
endShape();

//Second Tree Vein
beginShape();
  vertex(30,190);
  vertex(20,240);
  vertex(70,270);
  vertex(60,370);
  vertex(30,400);
endShape();
 
//Thrid Tree Vein
beginShape();
  vertex(30,460);
  vertex(10,500);
  vertex(10,530);
  vertex(50,580);
endShape();
}


//Appearance Of Bee Hive
void Hive(){
pushMatrix();
translate(-300,-300);
  strokeWeight(2);
  stroke(0);
  fill(255,185,43);
  ellipse(300,300,50,50);
  ellipse(300,420,60,50);
  ellipse(300,400,85,50);
  ellipse(300,320,80,50);
  ellipse(300,340,110,50);
  ellipse(300,380,110,50);
  ellipse(300,360,130,50);
popMatrix();
}

//Appearance For Bird
void Bird(){
pushMatrix();
translate(-300,-300);
  beginShape();
    fill(0);
    vertex(300,300);
    vertex(340,315);
    vertex(300,320);
  endShape(CLOSE);
popMatrix();
}

