
int ELEMENT_SIZE = 10;

int[] numbersS;
int[] numbersJ;

void setup(){
  size(1280, 720, P3D);
  
  numbersS = new int[100];
  for(int i=0; i<100; i++) {
    numbersS[i] = i;
  }
  
  numbersJ = new int[100];
  for(int i=0; i<100; i++) {
    numbersJ[i] = i;
  }
}

int testingCounter = 0; //debugging

void draw() {
  
  background(0);
  lights();
  
  shape(makeShapeS(numbersS));
  //shape(makeShapeJ(numbersJ));
  
  fill(color(255, 255, 255));
  //box(100); //debugging
  
  //Place the camera
  //camera(5, 15, 5, 0, 0, 0, 0, 1, 0);
  //camera(width/2, height/2, (height/2) / tan(PI/6), 0, 0, 0, 0, 1, 0);
  
  testingCounter++; //debugging
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
      square(j+x, y, longeur);
      fill(255,0,0);
      textSize(longeur/5);
      text(""+txtInt++,x+j+longeur/5, y+longeur/2); 
    }
  return shape;
}
// list de squars vers la gauche
PShape drawSquareLeft(int longeur,int x,int y,int nbSquars,int txtInt){
  PShape shape = createShape();
  for (int j=0; j<(longeur*nbSquars);j+=longeur){
      fill(0,100,0);
      square(-longeur-j+x, y, longeur);
      fill(255,0,0);
      textSize(longeur/5);
      text(""+txtInt++,x-j-longeur+longeur/5, y+longeur/2); 
    }
  return shape;
}
// list de squars vers la bas
PShape drawSquareDown(int longeur,int x,int y,int nbSquars,int txtInt){
  PShape shape = createShape();
  for (int j=0; j<(longeur*nbSquars);j+=longeur){
      fill(0,100,0);
      square(x, y+j, longeur);
      fill(255,0,0);
      textSize(longeur/5);
      text(""+txtInt++,x+longeur/5, y+j+longeur/2); 
    }
  return shape;
}
// list de squars vers la haut
PShape drawSquareUp(int longeur,int x,int y,int nbSquars,int txtInt){
  PShape shape = createShape();
  for (int j=0; j<(longeur*nbSquars);j+=longeur){
      fill(0,100,0);
      square(x, y-j-longeur, longeur);
      fill(255,0,0);
      textSize(longeur/5);
      text(""+txtInt++,x+longeur/5, y-j-longeur+longeur/2); 
    }
  return shape;
}



PShape makeShapeS(int[] numbers) {
  PShape shape = createShape();
  int surface=20;
  // 1. structure 2d
  for (int i=0; i<surface;i++){
    //go right
    if (i%4==0){
    }
    // draw down
    if (i%4==1){
    }
    // draw left
    if (i%4==2){
    }
    // draw up
    if (i%4==3){
    }
  }
  
  
  // 2. structure 3d
  // 3. avec shedar
  
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
