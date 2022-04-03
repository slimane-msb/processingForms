int zoom = 30;
PGraphics pg;
PShape myBoxes;
PShape myBoxes2;

int boxSize =15;
int hauteur=40;

//F(X)
int a=1,b=1,c=1;
int a2=1,b2=1,c2=1;

// chader
PShader monProgrammeShader;

//main shapes
PShape pyr1;
PShape pyr2;

void setup(){
  size(1280, 720, P3D);
  // shader
  monProgrammeShader = 
  loadShader("myFragmentShader.glsl", 
             "myVertexShader.glsl"  );
  // set up graphics 
  pg = createGraphics(500,500);
  pg.beginDraw();
    pg.background(255);
    for (int j=0 ; j<10;j++){
      for (int i=0 ; i<10;i++){
        
        pg.fill(getColor(f(i)));//testing
        pg.rect(i*20,j*20+20,20,20);
        
        pg.fill(0);
        pg.text(j*10+i,i*20+4,j*20+20-4);
        
      }
    }
  pg.endDraw();

  // start list boxes
  myBoxes=createShape(GROUP);
  for (int i=0;i<10000;i++){
    PShape ps =vertexBox(boxSize,pg,i);
    myBoxes.addChild(ps);
    myBoxes.getChild(i).setFill(getColor(f(i)));
  }
  // start list boxes2
  myBoxes2=createShape(GROUP);
  for (int i=0;i<10000;i++){
    PShape ps =vertexBox(boxSize,pg,i);
    myBoxes2.addChild(ps);
    myBoxes2.getChild(i).setFill(getColor(f2(i)));
  }
 
  pyr1 = mainShape(myBoxes,hauteur);
  pyr2 = mainShape(myBoxes2,hauteur);

  

}




void draw() {
 
  pushMatrix();
    translate(-150,550,20);
    pushMatrix();
      translate(10,0,0);
      shape(pyr1);
    popMatrix();
      
    pushMatrix();
      translate(500,0,0);
      shape(pyr2);
    popMatrix();
  popMatrix();
  
  
  PShape txt = botoun();
  shape(txt);
  //shader
  //shader(monProgrammeShader);
    //shape(pyr1);
    //shape(myBoxes);
  //resetShader();
  //shader(monProgrammeShader); 
  //resetShader();
}




int sommeDesDeviseur(int n)
{
    int res = 0;
    if(n == 1) return res;  
    for (int i=2; i<=sqrt(n); i++){  
        if (n%i==0){
            if (i==(n/i))
                res += i;
            else
                res += (i + n/i);
        }
    }
    return (res + 1 + n);
}


color getColor(int n) {
  int sd = sommeDesDeviseur(n) - n; 
  
  if(sd == 1) { //Prime 
    return color(230, 0, 0);
  } else if(sd == n) { //PerfectmyBoxes
    return color(0, 0, 212);
  } else if(sd < n) { //Deficient
    return color(0, 225, 0);
  } else { //Abundant
    return color(0, 221, 212);
  }
}





PShape botoun(){
  float x=width/1.3;
  PShape res = createShape();
  pushMatrix();
    pushMatrix();
      translate(10,50);
      textSize(35);
      text("f(x)="+a+"x2+"+b+"x+"+c,10,10);
    popMatrix();
    translate(x,50);
    text("f(x)="+a2+"x2+"+b2+"x+"+c2,10,10);
  popMatrix();
  
  
  // a up
  fill(0, 122, 0);
  rect(80, 20, 20, 15);
  
  // a down
  fill(0, 122, 0);
  rect(80, 65, 20, 15);
  
  // b up
  fill(0, 122, 0);
  rect(80+60, 20, 20, 15);
  
  // b down
  fill(0, 122, 0);
  rect(80+60, 65, 20, 15);
  
  // c up
  fill(0, 122, 0);
  rect(80+120, 20, 20, 15);
  
  // c down
  fill(0, 122, 0);
  rect(80+120, 65, 20, 15);

  
  
  
  // f(x)2
  
  // a up
  fill(0, 122, 0);
  rect(x+80, 20, 20, 15);
  
  // a down
  fill(0, 122, 0);
  rect(x+80, 65, 20, 15);
  
  // b up
  fill(0, 122, 0);
  rect(x+80+60, 20, 20, 15);
  
  // b down
  fill(0, 122, 0);
  rect(x+80+60, 65, 20, 15);
  
  // c up
  fill(0, 122, 0);
  rect(x+80+120, 20, 20, 15);
  
  // c down
  fill(0, 122, 0);
  rect(x+80+120, 65, 20, 15);
  
    // hauteur ++
  fill(0, 122, 0);
  triangle(width/2, 5, width/2-10, 20, width/2+10, 20);


  // hauteur --
  fill(0, 122, 0);
  triangle(width/2, 40, width/2-10, 25, width/2+10, 25);

  
  return res;
  
}



void mouseClicked(){
  float x=width/1.3;
   if (mouseX >= 80 && mouseX <= 80+20 && 
      mouseY >20 && mouseY <20+15 ) {
        a++;
   }
   if (mouseX >= 80 && mouseX <= 80+20 && 
      mouseY >65 && mouseY <65+15) {
        a--;
   }
   if (mouseX >= 80+60 && mouseX <= 80+60+20 && 
      mouseY >20 && mouseY <20+15 ) {
        b++;
   }
   if (mouseX >= 80+60 && mouseX <= 80+60+20 && 
      mouseY >65 && mouseY <65+15) {
        b--;
   }
   if (mouseX >= 80+120 && mouseX <= 80+120+20 && 
      mouseY >20 && mouseY <20+15 ) {
        c++;
   }
   if (mouseX >= 80+120 && mouseX <= 80+120+20 && 
      mouseY >65 && mouseY <65+15 ) {
        c--;
   }
   
   
   // f(x)2
 
   if (mouseX >= x+80 && mouseX <= x+80+20 && 
      mouseY >20 && mouseY <20+15 ) {
        a2++;
   }
   if (mouseX >= x+80 && mouseX <= x+80+20 && 
      mouseY >65 && mouseY <65+15) {
        a2--;
   }
   if (mouseX >=x+80+60 && mouseX <= x+80+60+20 && 
      mouseY >20 && mouseY <20+15 ) {
        b2++;
   }
   if (mouseX >=x+80+60 && mouseX <= x+80+60+20 && 
      mouseY >65 && mouseY <65+15) {
        b2--;
   }
   if (mouseX >= x+80+120 && mouseX <= x+80+120+20 && 
      mouseY >20 && mouseY <20+15 ) {
        c2++;
   }
   if (mouseX >=x+ 80+120 && mouseX <=x+ 80+120+20 && 
      mouseY >65 && mouseY <65+15 ) {
        c2--;
   }
   setup();
   
      //hauteur ++
   if (mouseX >=width/2-20 && mouseX <=width/2-10+30 && 
      mouseY >0 && mouseY <22 ) {
        hauteur+=4;
        
        
   }
   //hauteur --
   if (mouseX >=width/2-20 && mouseX <=width/2-10+30 && 
      mouseY >22 && mouseY <50 ) {
        hauteur-=4; 
        
   }
   
   
  
}


int f(int i){
  return a*(i*i)+b*(i)+c;
}


int f2(int i){
  return a2*(i*i)+b2*(i)+c2;
}
