int zoom = 30;
final static byte inc = 2;

int ELEMENT_SIZE = 10;
int[] numbersJ;

void setup(){

  size(1280, 720, P3D);
  smooth();
  rectMode(CENTER);

  numbersJ = new int[100];
  for(int i=0; i<100; i++) {
    numbersJ[i] = i;
  }
  
  print(sumDivisors(6));

}




void draw() {
  
  makeShapeSMotion();
  //shape(makeShapeJ(numbersJ));

}




int sumDivisors(int num)
{
    int result = 0;
    if(num == 1) return result;  
    for (int i=2; i<=sqrt(num); i++){  
        if (num%i==0){
            if (i==(num/i))
                result += i;
            else
                result += (i + num/i);
        }
    }
    return (result + 1 + num);
}


color getColor(int n) {
  int sd = sumDivisors(n) - n; //Substract n for better definition of perfect number ..
  
  if(sd == 1) { //Prime 
    return color(255, 0, 0);
  } else if(sd == n) { //Perfect
    print("blue\n");
    return color(0, 0, 255);
  } else if(sd < n) { //Deficient
    return color(0, 255, 0);
  } else { //Abundant
    return color(0, 255, 255);
  }
}

// code J
//int sumDivisors(int n) {
//  int s = 0;
//  for(int i=0; i<pow(n, 1/2); i++) {
//    if((float(n)/float(i))%1 == 0) {s += i;}
//  }
//  return s;
//}

// code S
