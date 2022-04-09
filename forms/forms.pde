int zoom = 30;
PGraphics pg;
PShape myBoxes;
PShape myBoxes2;

int boxSize =15;
int hauteur=35;

//F(X)
int a=1,b=1,c=1;
int a2=1,b2=1,c2=1;

// chader
PShader monProgrammeShader;
PGraphics g1;

PShape pyr1;
PShape pyr2;

void setup(){
  size(1280, 720, P3D);
  g1 = createGraphics(width,height,P3D);
  smooth(2);
  // shader
  monProgrammeShader = 
  loadShader("myFragmentShader.glsl", 
             "myVertexShader.glsl"  );

  // set up graphics 
  pg = createGraphics(500,500);
  pg.beginDraw();
    pg.background(255);
    for (int j=0 ; j<9;j++){
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
  //shader(monProgrammeShader);
    background(200);
    
    pushMatrix();

      translate(-150,550,-1000+mouseX);
      
      pushMatrix();
        translate(10,0,0);
        shape(pyr1);
      popMatrix();
        
      pushMatrix();
          
        translate(500,0,0);
        rotateY(frameCount/6.0);
        shape(pyr2);
      popMatrix();
    popMatrix();
  //resetShader();
  
  PShape txt = botoun();
  shape(txt);
  
  image(g1,0.0,0.0,400.0,400.0);

}


void mousePressed(){
   
  
  g1.beginDraw();
  g1.loadPixels() ;
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
  
    
    g1.pushMatrix();
    g1.translate(-150,550,-1000+mouseX);
      
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
    

 // il faudra peut-etre recréer les modèles ici 
  g1.shape(pyr1);
  g1.resetShader();
  g1.endDraw();
  
  int c = g1.get(mouseX, mouseY);
    
  int numberPicked = (int)(red(c)*256*256 + green(c)*256 + blue(c));
  println(numberPicked);

  
  image(g1,0.0,0.0,400.0,400.0);
  
  
  
  
  
  //to get the number use the ,methode green red blue and mutilply by 255 
  // recupere la couleur et *255 on aura le nombre 
  // la couleur au pixel qui a ete cliqué
    
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
        hauteur+=4;
        
        
   }
   //hauteur --
   if (mouseX >=width/2-20 && mouseX <=width/2-10+30 && 
      mouseY >22 && mouseY <50 ) {
        hauteur-=4; 
        
   }
   setup();
   
}





int f(int i){
  return a*(i*i)+b*(i)+c;
}


int f2(int i){
  return a2*(i*i)+b2*(i)+c2;
}
