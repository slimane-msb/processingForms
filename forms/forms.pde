
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

void draw() {
  
  //create the PShape
  shape(makeShapeS(numbersS));
  //shape(makeShapeJ(numbersJ));
  
  //Place the camera
  
}

color getColor(int n) {
  return  color(n, n*1.5, n*0.7);
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
    if (i%4=0){
    }
    // draw down
    if (i%4=1){
    }
    // draw left
    if (i%4=2){
    }
    // draw up
    if (i%4=3){
    }
  }
  
  
  // 2. structure 3d
  // 3. avec shedar
  
  return shape;
}

PShape makeShapeJ(int[] numbers) {
  PShape structure = createShape();
  
  int level = 0;
  while(numbers.length > 0) {
    
    float centerY = level*ELEMENT_SIZE;
      int index=0;
      for(int cell=0; cell<((level == 0) ? 1 : 6*level); cell++) {
        // pour supprimer un element d'un tableau en java, ce n'est pas avec pop. 
        // 1. pour avoir l'element 
        int n = numbers[index];
        //2. pour supprimer ( a une complixite O(n) donc tu le supprime pas, supprime tous le tableau a la fin
        
        //Extrapolate the coords
        float centerX = 0;
        float centerZ = 0;
        
        //Get color
        color c = getColor(n);
        
        //Draw hexagon
        structure.beginShape(QUAD_STRIP);
        structure.endShape();
        
        structure.beginShape();
        structure.endShape();
        index++;
      }
    
    level++;
  }
    return structure;
}
