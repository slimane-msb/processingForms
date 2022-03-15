
ELEMENT_SIZE = 10;

int[] numbersS;
int[] numbersJ;

void setup() {
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
  shape(makeShapeJ(numbersJ));
  
  //Place the camera
  
}

color getColor(int n) {
  return color(127, 127, 127);
}

PShape makeShapeS(int[] numbers) {
  PShape structure = createShape();
  
  //
  
  return structure;
}

PShape makeShapeJ(int[] numbers) {
  PShape structure = createShape();
  
  int level = 0;
  while(len(numbers) > 0) {
    
    float centerY = level*ELEMENT_SIZE;
    
    for(int cell=0; cell<((level == 0) ? 1 : 6*level); cell++) {
      n = numbers.pop(0);
      
      //Extrapolate the coords
      float centerX = 0;
      float centerZ = 0;
      
      //Get color
      c = getColor(n);
      
      //Draw hexagon
      structure.beginShape(QUAD_STRIP);
      structure.endShape();
      
      structure.beginShape();
      structure.endShape();
    }
    
    level++;
  
  return structure;
}
