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
         translate(j+x, y, 0);
         break;
     default:
         translate(x, y+j, 0);
         break;
   }

    box(longueur);
    popMatrix();
    fill(255,0,0);
    textSize(longueur/3);
       
    switch(direction){
 
     case 0: 
         text(""+txtInt++,x-j-longueur+longueur/5, y+longueur/2,longueur/2);
         break;
 
     case 1:
         text(""+txtInt++,x+longueur/5, y-j-longueur+longueur/2,longueur/2);
         break;
 
     case 2:
         text(""+txtInt++,x+j+longueur/5, y+longueur/2,longueur/2);
         break;
     default:
         text(""+txtInt++,x+longueur/5, y+j+longueur/2,longueur/2);
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
  float mX= -(mouseX-1000.0)/500.0;
  float mY= -(mouseY-1000.0)/500.0;
  translate(mouseX,mouseY);
  rotateX(PI*(mX));
  rotateZ(PI*(mY));
  
  //draw S shape
  
 makeShapeSFinal(150);
   
  return shape;
  
}


PShape makeShapeSFinal(int surface){
  PShape shape = createShape();
  //background(200);
  //if (mousePressed)
  //  if      (mouseButton == LEFT)   zoom += inc+70;
  //  else if (mouseButton == RIGHT)  zoom -= inc+70;
  //int longueur =zoom/10;
  int longueur = 10;
  int j=0;
 
  for (int i=surface; i>=0;i-=4){
      pushMatrix();
      translate(0,0,longueur*j++);
      shape(makeShapeS(longueur,i,width/2,height/2));
      //shape(makeShapeS(longueur,i,mouseX,mouseY));
      popMatrix();
  }
   
  return shape;
  
}

PShape makeShapeS(int longueur,int quarterTour, int centerX,int centerY) {
  PShape shape = createShape();
  beginShape();
    // 1. structure 2d
    // draw the center
    if (quarterTour==0){
      drawSquares(2, longueur,centerX,centerY,1,0);
      return shape;
    }
    if (quarterTour==1){
      drawSquares(3, longueur,centerX+longueur,centerY,2,1);
      return shape;
    }
    drawSquares(2, longueur,centerX,centerY,1,0);
    drawSquares(3, longueur,centerX+longueur,centerY,2,1);
    beginShape();
    int j=2;
    int caseNb=3;
    int tourNb= 0;
    
    for (int i=0; i<quarterTour-3;i++){
       
        //go left
        if (i%4==0){
          drawSquares(i%4, longueur,centerX+longueur*(tourNb+1),centerY+longueur*(tourNb+1),j,caseNb);
        } else if (i%4==1){
          drawSquares(i%4, longueur,centerX-longueur*(tourNb+1),centerY+longueur*(tourNb+1),j,caseNb);
        } else if (i%4==2){
          drawSquares(i%4, longueur,centerX-longueur*(tourNb),centerY-longueur*(tourNb+1),j,caseNb);
        } else if (i%4==3){
          drawSquares(i%4, longueur,centerX+longueur*(tourNb+2),centerY-longueur*(tourNb),j,caseNb);
          tourNb++; //Lap completed
        }
        caseNb+=j;
        if(i%2==1){
          j++;
        }
      
    }
    endShape();
    // 2. structure 3d
    // 3. avec shader
  endShape();
  
  return shape;
}
