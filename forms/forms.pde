
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
  
  //shape(makeShapeS(numbersS));
  //shape(makeShapeJ(numbersJ));
  
  //Place the camera
  
}

color getColor(int n) {
  return  color(n, n*1.5, n*0.7);
}

PShape makeShapeS(int[] numbers) {
  PShape structure = createShape();
  
  // 1. structure 2d 
  
  return structure;
}

PShape makeShapeJ(int[] numbers) {
  PShape structure = createShape();
  
  int level = 0;
  int index = 0;
  while(numbers.length > 0) {
    
    float centerY = level*ELEMENT_SIZE;

      for(int cell=0; cell<((level == 0) ? 1 : 6*level); cell++) {
        int n = numbers[index];
        
        //Extrapolate the coords
        float centerX = 0;
        float centerZ = 0;
        
        //Get color
        color c = getColor(n);
        noStroke();
        fill(c);
        
        //Draw hexagon walls
        structure.beginShape(QUAD_STRIP);
        structure.endShape();
        
        //Draw hexagon top and bottom
        structure.beginShape();
        structure.endShape();
        
        index++;
      }
    
    level++;
  }
    return structure;
}
