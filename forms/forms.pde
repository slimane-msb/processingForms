int zoom = 30;
final static byte inc = 2;

int ELEMENT_SIZE = 10;

int[] numbersS;
int[] numbersJ;
ArrayList<Integer> listS = new ArrayList<Integer>();
void setup(){

  size(1280, 720, P3D);
  smooth();
  rectMode(CENTER);
  numbersS = new int[100];
  for(int i=0; i<100; i++) {
    listS.add(i);
  }
  
  numbersJ = new int[100];
  for(int i=0; i<100; i++) {
    numbersJ[i] = i;
  }
 
   

}


//int testingCounter = 0; //debugging

void draw() {
  
  // rotate l'objet pour mieux voir ce que ca donne 
  lights();
  background(0);
  float mX= -(mouseX-1000.0)/500.0;
  float mY= -(mouseY-1000.0)/500.0;
  translate(mouseX,mouseY);
  rotateX(PI*(mX));
  rotateZ(PI*(mY));
  
  //draw S shape
  makeShapeSFinal(20);

   
  
  //background(0);
  //lights();
  
 
  //shape(makeShapeJ(numbersJ));
  
  //fill(color(255, 255, 255));
  //box(100); //debugging
  
  //Place the camera
  //camera(5, 15, 5, 0, 0, 0, 0, 1, 0);
  //camera(width/2, height/2, (height/2) / tan(PI/6), 0, 0, 0, 0, 1, 0);
  
  //testingCounter++; //debugging
}



int sumDivisors(int n) {
  int s = 0;
  for(int i=0; i<pow(n, 1/2); i++) {
    if((float(n)/float(i))%1 == 0) {s += i;}
  }
  return s;
}

color getColor(int n) {
  int sd = sumDivisors(n) - n; //Substract n to avoid the doubling later
  
  if(sd == 1) { //Prime
    return color(0, 255, 0);
  } else if(sd == n) { //Perfect
    return color(255, 0, 255);
  } else if(sd < n) { //Deficient
    return color(255, 0, 0);
  } else { //Abundant
    return color(0, 0, 255);
  }
}

// fonction utilitaire 
// list de squars vers la droite
PShape drawSquareRight(int longeur,int x,int y,int nbSquars,int txtInt){
  PShape shape = createShape();
  for (int j=0; j<(longeur*nbSquars);j+=longeur){
      fill(0,100,0);
      pushMatrix();
      translate(j+x, y, 0); 
      box(longeur);
      popMatrix();
      fill(255,0,0);
      textSize(longeur/3);
      text(""+txtInt++,x+j+longeur/5, y+longeur/2); 
    }
  return shape;
}
// list de squars vers la gauche
PShape drawSquareLeft(int longeur,int x,int y,int nbSquars,int txtInt){
  PShape shape = createShape();
  for (int j=0; j<(longeur*nbSquars);j+=longeur){
      fill(0,100,0);
      pushMatrix();
      translate(-longeur-j+x, y, 0); 
      box(longeur);
      popMatrix();
      fill(255,0,0);
      textSize(longeur/3);
      text(""+txtInt++,x-j-longeur+longeur/5, y+longeur/2); 
    }
  return shape;
}
// list de squars vers la bas
PShape drawSquareDown(int longeur,int x,int y,int nbSquars,int txtInt){
  PShape shape = createShape();
  for (int j=0; j<(longeur*nbSquars);j+=longeur){
      fill(0,100,0);
      pushMatrix();
      translate(x, y+j, 0); 
      box(longeur);
      popMatrix();
      fill(255,0,0);
      textSize(longeur/3);
      text(""+txtInt++,x+longeur/5, y+j+longeur/2); 
    }
  return shape;
}
// list de squars vers la haut
PShape drawSquareUp(int longeur,int x,int y,int nbSquars,int txtInt){
  PShape shape = createShape();
  for (int j=0; j<(longeur*nbSquars);j+=longeur){
      fill(0,100,0);
      pushMatrix();
      translate(x, y-j-longeur, 0); 
      box(longeur);
      popMatrix();
      fill(255,0,0);
      textSize(longeur/3);
      text(""+txtInt++,x+longeur/5, y-j-longeur+longeur/2); 
    }
  return shape;
}


PShape makeShapeSFinal(int surface){
  PShape shape = createShape();
  background(200);
  if (mousePressed)
    if      (mouseButton == LEFT)   zoom += inc+70;
    else if (mouseButton == RIGHT)  zoom -= inc+70;
    int longeur =zoom/10;
  for (int i=surface+150; i>=0;i--){
      pushMatrix();
      translate(0,0,longeur);
      shape(makeShapeS(longeur,i,mouseX,mouseY));
      popMatrix();
  }
  //shape(makeShapeS(longeur,surface+150,mouseX,mouseY));
  //pushMatrix();
  //translate(0,0,longeur);
  //shape(makeShapeS(longeur,surface+150-1,mouseX,mouseY));
  //popMatrix();
   
  return shape;
  
}

PShape makeShapeS(int longeur,int surface, int centerX,int centerY) {
  PShape shape = createShape();
  beginShape();
    // 1. structure 2d
    // draw the center
    if (surface==0){
      drawSquareRight(longeur,centerX,centerY,1,0);
      return shape;
    }
    if (surface==1){
      drawSquareDown(longeur,centerX+longeur,centerY,2,1);
      return shape;
    }
    drawSquareRight(longeur,centerX,centerY,1,0);
    drawSquareDown(longeur,centerX+longeur,centerY,2,1);
    beginShape();
    int j=2;
    int caseNb=3;
    int tourNb= 0;
    
    
    for (int i=0; i<surface-3;i++){
       
        //go left
        if (i%4==0){
          drawSquareLeft(longeur,centerX+longeur*(tourNb+1),centerY+longeur*(tourNb+1),j,caseNb);
          caseNb+=j;
          
          
        }
        // draw up
        if (i%4==1){
          drawSquareUp(longeur,centerX-longeur*(tourNb+1),centerY+longeur*(tourNb+1),j,caseNb);
          caseNb+=j;
        }
        // draw right
        if (i%4==2){
          drawSquareRight(longeur,centerX-longeur*(tourNb),centerY-longeur*(tourNb+1),j,caseNb);
          caseNb+=j;
        }
        // draw down
        if (i%4==3){
          drawSquareDown(longeur,centerX+longeur*(tourNb+2),centerY-longeur*(tourNb),j,caseNb);
          caseNb+=j;
          // tour completed
          tourNb++;
        }
        if(i%2==1){
          j++;
        }
      
    }
    endShape();
    
  
    
    // 2. structure 3d
    // 3. avec shedar
  endShape();
  
  return shape;
}


PShape makeShapeJ(int[] numbers) {
  PShape structure = createShape();
  
  int level = 0;
  int index = 0;
  while(index <= numbers.length) {
    
    float centerY = level*ELEMENT_SIZE;

      for(int cell=0; cell<((level == 0) ? 1 : 6*level); cell++) {
        
        if(index >= numbers.length) {break;}
        int n = numbers[index];
        
        //Extrapolate the coords
        float centerX = 0;
        float centerZ = 0;
        
        //Get color
        color c = getColor(n);
        c = color(255, 255, 255); //debugging
        noStroke();
        fill(c);
        
        //Draw hexagon walls
        structure.beginShape(QUAD_STRIP);
        structure.endShape();
        
        //Draw hexagon top and bottom
        structure.beginShape();
        vertex(-150, 0, 0); //pas encore un hexagone, je sais c'est juste pour le debugging
        vertex(0, 0, 50);
        vertex(150, 0, 0);
        vertex(0, 0, -50);
        structure.endShape();
        
        index++;
      }
    
    if(index >= numbers.length) {break;}
    
    level++;
  }
    return structure;
}











//void setup(){
//  size(800,800,P3D);
 
//}

//void draw(){
//  lights();
//  background(0);
//  float mX= -(mouseX-1000.0)/500.0;
//  float mY= -(mouseY-1000.0)/500.0;
//  print(mX+"\n");
//  rotateX(PI*(mX));
//  rotateY(PI*(mY));
  
//  //use tp last my work to fix the camera 
//   for (int i=0 ;i<10;i++){
//    pushMatrix();
//    translate(200+i*50, 192, 0); 
//    box(50);
//    popMatrix();
//  }
 
//}

/**
 * Move Eye. 
 * by Simon Greenwold.
 * 
 * The camera lifts up (controlled by mouseY) while looking at the same point.
// */

//void setup() {
//  size(1000, 1000, P3D);
//  //fill(204);
//}

//void draw() {
//  lights();
//  background(0);
  
//  // Change height of the camera with mouseY
//  //camera(mouseX/3, mouseY*2, 200.0, // eyeX, eyeY, eyeZ
//  //       0.0, 0.0, 0.0, // centerX, centerY, centerZ
//  //       0.0, 1.0, 0.0); // upX, upY, upZ
//  translate(400,400);
  
//  float mX= -(mouseX-1000.0)/500.0;
//  float mY= -(mouseY-1000.0)/500.0;
//  print(mX+"\n");
//  rotateX(PI*(mX));
//  rotateY(PI*(mY));
  
  
//  //noStroke();
//  box(90);
//  //stroke(255);
//  //line(-100, 0, 0, 100, 0, 0);
//  //line(0, -100, 0, 0, 100, 0);
//  //line(0, 0, -100, 0, 0, 100);
//}













// move eyes
/**
 * Move Eye. 
 * by Simon Greenwold.
 * 
 * The camera lifts up (controlled by mouseY) while looking at the same point.
 */
