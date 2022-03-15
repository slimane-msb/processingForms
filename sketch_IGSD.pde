


int[] numbersS;
int[] numbersJ;

void setup() {
  size(1280, 720);
  
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
  makeShapeS(numbersS);
  makeShapeJ(numbersJ);
  
  //Draw the PShapes
  
  //Place the camera
  
}

PShape makeShapeS(int[] numbers) {
}

PShape makeShapeJ(int[] numbers) {
}
