int zoom = 30;
final static byte inc = 2;

int ELEMENT_SIZE = 10;

// int[] numbersS;
int[] numbersJ;
// ArrayList<Integer> listS = new ArrayList<Integer>();
void setup(){

  size(1280, 720, P3D);
  smooth();
  rectMode(CENTER);
  // numbersS = new int[100];
  // for(int i=0; i<100; i++) {
  //   listS.add(i);
  // }
  
  numbersJ = new int[100];
  for(int i=0; i<100; i++) {
    numbersJ[i] = i;
  }
 
  
}


//int testingCounter = 0; //debugging

void draw() {
  

  //shape(makeShapeJ(numbersJ));
  makeShapeSMotion();
  
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
