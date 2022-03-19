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

void draw() {
  
  //create the PShape
  makeShapeSFinal(8);
  //shape(makeShapeJ(numbersJ));
  
  //Place the camera
  
  // set up zoom 
 

  
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
      textSize(longeur/2);
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
      textSize(longeur/2);
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
      textSize(longeur/2);
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
      textSize(longeur/2);
      text(""+txtInt++,x+longeur/5, y-j-longeur+longeur/2); 
    }
  return shape;
}


PShape makeShapeSFinal(int surface){
  PShape shape = createShape();
  background(200);
  if (mousePressed)
    if      (mouseButton == LEFT)   zoom += inc;
    else if (mouseButton == RIGHT)  zoom -= inc;
  shape(makeShapeS(zoom,surface,mouseX,mouseY));
  return shape;
  
}

PShape makeShapeS(int longeur,int surface, int centerX,int centerY) {
  PShape shape = createShape();
  beginShape();
    // 1. structure 2d
    // draw the center
    drawSquareRight(longeur,centerX,centerY,1,0);
    drawSquareDown(longeur,centerX+longeur,centerY,2,1);
    
    int j=2;
    int caseNb=3;
    int tourNb= 0;
    int i=2;
    
    for (int k=0; k<surface-3;k++){
      if(listS.size()>=0){
        i=listS.remove(0);
        print("\n i"+i+"\n j"+j+"\n caseNb"+caseNb+"\n tourNb"+tourNb);
        //go left
        if (i%4==0){
          drawSquareLeft(longeur,centerX+longeur*(tourNb+1),centerY-longeur*(tourNb-1),j,caseNb);
          caseNb+=j;
          
        }
        // draw up
        if (i%4==1){
          drawSquareUp(longeur,centerX-longeur*(tourNb+1),centerY-longeur*(tourNb-1),j,caseNb);
          caseNb+=j;
        }
        // draw right
        if (i%4==2){
          drawSquareRight(longeur,centerX-longeur*(tourNb),centerY+longeur*(tourNb-1),j,caseNb);
          caseNb+=j;
        }
        // draw down
        if (i%4==3){
          drawSquareDown(longeur,centerX+longeur*(tourNb+2),centerY+longeur*(tourNb),j,caseNb);
          caseNb+=j;
          // tour completed
          tourNb++;
        }
        if(i%2==1){
          j++;
        }
      }
    }
    
  
    
    // 2. structure 3d
    // 3. avec shedar
  endShape();
  
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
