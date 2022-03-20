int nbCaseInt=0;
// fonction utilitaire
// list de squares vers la gauche
PShape drawSquares(int direction, int longueur, int x, int y, int nbSquares, int txtInt){
  PShape shape = createShape();
  
  for (int j=0; j<(longueur*nbSquares);j+=longueur){
    fill(0,100,0);
    pushMatrix();
    
    switch(direction){
 
     case 0: 
         translate(-longueur-j+x, y, 0);
         break;
 
     case 1:
         translate(x, y-j-longueur, 0);
         break;
 
     case 2:  
         fill(0,0,255);
         translate(j+x, y, 0);
         break;
     default:
         translate(x, y+j, 0);
         break;
   }
    fill(getColorTmp(nbCaseInt));
    box(longueur);
    nbCaseInt++;
    
    popMatrix();
    fill(255,0,0);
    textSize(longueur/3.0);
       
    switch(direction){
 
     case 0: 
         text(""+txtInt++,x-j-longueur+longueur/5.0, y+longueur/2.0,longueur/2.0);
         break;
 
     case 1:
         text(""+txtInt++,x+longueur/5.0, y-j-longueur+longueur/2.0,longueur/2.0);
         break;
 
     case 2:
         text(""+txtInt++,x+j+longueur/5.0, y+longueur/2.0,longueur/2.0);
         break;
     default:
         text(""+txtInt++,x+longueur/5.0, y+j+longueur/2.0,longueur/2.0);
         break;
   }
      
  }
      
  return shape;
}

PShape makeShapeSMotion(){
  PShape shape = createShape();
  // rotate l'objet pour mieux voir ce que ca donne 
  lights();
  background(0);
  
  translate(width/2,height/2,200); 
  rotateX(-PI/2);
  camera( mouseY/4, mouseX/4-200, -100,
          0, 0,   0, 
           0.0,  0.0,  1.0);
  
  makeShapeSFinal(30);
  nbCaseInt=0;
  
  return shape;
  
}


PShape makeShapeSFinal(int surface){
  PShape shape = createShape();
  int longueur = 5;
  int j=0;
  for (int i=6; i<surface;i+=4){
      pushMatrix();
      translate(0,0,longueur*j++);
      shape(makeShapeS(longueur,i,0,0));
      popMatrix();
  }

   
  return shape;
  
}
// un surface en 3D
PShape makeShapeS(int longueur,int quarterTour, int centerX,int centerY) {
  PShape shape = createShape();
  beginShape();
    // 1. structure 2d
    // draw the center
    if (quarterTour<=6){
      pushMatrix();
      translate(0,0,-longueur);
      drawSquares(2, longueur,centerX,centerY,1,0);
      popMatrix();
    }
    drawSquares(3, longueur,centerX+longueur,centerY,2,1);
    beginShape();
    int j=2;
    int caseNb=3;
    int tourNb= 0;
    
    for (int i=0; i<quarterTour-3;i++){
        if (i==quarterTour-4) j--;
        //go left
    int dir=i%4;
     switch(dir){
     
       case 0: 
           drawSquares(dir, longueur,centerX+longueur*(tourNb+1),centerY+longueur*(tourNb+1),j,caseNb);
           break;
     
       case 1:
           drawSquares(dir, longueur,centerX-longueur*(tourNb+1),centerY+longueur*(tourNb+1),j,caseNb);
           break;
     
       case 2:
           drawSquares(dir, longueur,centerX-longueur*(tourNb),centerY-longueur*(tourNb+1),j,caseNb);
           break;
       default:
           drawSquares(dir, longueur,centerX+longueur*(tourNb+2),centerY-longueur*(tourNb),j,caseNb);
           tourNb++; //Lap completed
           break;
   }

        caseNb+=j;
        if(i%2==1){
          j++;
        }
      
    }
    endShape();
    // 3. avec shader
  endShape();
  
  return shape;
}



PShape drawPlan() {
  PShape shape = createShape();
  for (int i=0 ;i<width;i+=10){
    fill(0,0,255);
    line(i, 0, i, height);
    line(0,i,width,i);
  }
  return shape;
}



color getColorTmp(int n) {
  return color(n/2,255-n/2 ,100+n/5 );
 
}
