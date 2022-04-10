int zoom = 30;
PGraphics pg;
PGraphics pg2;
PShape myBoxes;
PShape myBoxes2;

int boxSize =20;
int hauteur=31;
int txtDis=20;
int totalBoxes=2000;

//F(X)
int a=0,b=6,c=1;
int a2=0,b2=6,c2=-1;

// chader
PShader monProgrammeShader;
PShader monProgrammeShaderPicking;
PGraphics g1;

PShape pyr1;
PShape pyr2;

void setup(){
  size(1280, 720, P3D);
  g1 = createGraphics(width,height,P3D);
  monProgrammeShader = 
  loadShader("myFragmentShader.glsl", 
             "myVertexShader.glsl"  );
             
  monProgrammeShaderPicking = 
    loadShader("myFragmentShaderPicking.glsl", 
               "myVertexShaderPicking.glsl"  );
  // set up texture 
  pg = createGraphics(500,500);
  reSetBoxes();
}

void reSetBoxes(){
   pg.beginDraw();
   pg.background(255);
    
  for (int j=-1 ; j<totalBoxes/10;j++){
    for (int i=0 ; i<10;i++){
      pg.fill(getColor(f(i)));
      pg.rect(i*txtDis,j*txtDis+txtDis,txtDis,txtDis);
      pg.fill(0);
      pg.text(j*10+i,i*txtDis+4,j*txtDis+txtDis-4);
      
    }
  }
  pg.endDraw();
  
  // set up texture for shape2
  pg2 = createGraphics(500,500);
  pg2.beginDraw();
    pg2.background(255);
    for (int j=-1 ; j<totalBoxes/10;j++){
      for (int i=0 ; i<10;i++){
        pg2.fill(getColor(f2(i)));//testing
        pg2.rect(i*txtDis,j*txtDis+txtDis,txtDis,txtDis);
        pg2.fill(0);
        pg2.text(j*10+i,i*txtDis+4,j*txtDis+txtDis-4);
        
      }
    }
  pg2.endDraw();
  
  // start list boxes
  myBoxes=createShape(GROUP);
  for (int i=0;i<totalBoxes;i++){
    PShape ps =vertexBox(boxSize,pg,i);
    myBoxes.addChild(ps);
    myBoxes.getChild(i).setFill(getColor(f(i)));
  }
  // start list boxes2
  myBoxes2=createShape(GROUP);
  for (int i=0;i<totalBoxes;i++){
    PShape ps =vertexBox(boxSize,pg2,i);
    myBoxes2.addChild(ps);
    myBoxes2.getChild(i).setFill(getColor(f2(i)));
  }
 
  pyr1 = mainShape(myBoxes,hauteur);
  pyr2 = mainShape(myBoxes2,hauteur);
}




void draw() {
  reSetBoxes();
  float rotationSpeed=5.0;
  shader(monProgrammeShaderPicking);
  background(0);
  pushMatrix();
    translate(-150+mouseX,400,-800+mouseY);
    //translate(400,400,0);
    pushMatrix();
      rotateY(frameCount/rotationSpeed);
      translate(10,0,0);
      shape(pyr1);
    popMatrix();
      
    pushMatrix();
      translate(500,0,0);
      rotateY(frameCount/rotationSpeed);
      shape(pyr2);
    popMatrix();
  popMatrix();
  resetShader();
  
  PShape txt = botoun();
  shape(txt);
  
  image(g1,0,100,150,150);
}


void mousePressed(){
   
  //g1.shader(monProgrammeShader);
  g1.beginDraw();
  g1.loadPixels() ;
  reSetBoxes();
  g1.pushMatrix();
  g1.translate(-150,550,-1000+mouseX);
  g1.translate(400,400,0);
  g1.pushMatrix();
  g1.translate(10,0,0);
  g1.shape(pyr1);
  g1.popMatrix();
  g1.pushMatrix();
  g1.translate(500,0,0);
  g1.rotateY(frameCount/6.0);
  g1.shape(pyr2);
  g1.popMatrix();
  g1.popMatrix(); 
  g1.resetShader();
  g1.endDraw();
  
  int c = g1.get(mouseX, mouseY);
  int numberPicked = (int)(red(c)*256*256 + green(c)*256 + blue(c));
  println(numberPicked);
  //pyr1.attrib("idselect", (float)(numberPicked)
    
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
    return color(33, 110, 255);
  } else if(sd == n) { //PerfectmyBoxes
    return color(248, 255, 27);
  } else if(sd < n) { //Deficient
    return color(7, 255, 22);
  } else { //Abundant
    return color(255, 27, 142);
  }
}


PShape botoun(){
  float x=width/1.3;
  PShape res = createShape();
  pushMatrix();
    pushMatrix();
      translate(10,50);
      textSize(27);
      text("f(x)="+a+"x2+"+b+"x+"+c,10,10);
    popMatrix();
    pushMatrix();
      translate(x,50);
      text("f(x)="+a2+"x2+"+b2+"x+"+c2,10,10);
    popMatrix();
    pushMatrix();
      translate(x/2,60);
      text("ajouter une etage",10,10);
    popMatrix();
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
   
      //hauteur ++
   if (mouseX >=width/2-20 && mouseX <=width/2-10+30 && 
      mouseY >0 && mouseY <22 ) {
        if(hauteur<=39) hauteur+=4;
        else println("max hauteur recommendé");
   }
   //hauteur --
   if (mouseX >=width/2-20 && mouseX <=width/2-10+30 && 
      mouseY >22 && mouseY <50 ) {
        if(hauteur>=10) hauteur-=4;
        else println("min hauteur recommendé");    
   } 
}





int f(int i){
  return a*(i*i)+b*(i)+c;
}


int f2(int i){
  return a2*(i*i)+b2*(i)+c2;
}
