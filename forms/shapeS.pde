// fonction utilitaire
// list de squares vers la gauche
PShape drawSquares(int direction, int longueur, int x, int y, int nbSquares, int txtInt){
  PShape shape = createShape();
  for (int j=0; j<(longueur*nbSquares);j+=longueur){
      fill(0,100,0);
      pushMatrix();
      if(direction == 0) {translate(-longueur-j+x, y, 0);}
      else if(direction == 1) {translate(x, y-j-longueur, 0);}
      else if(direction == 2) {translate(j+x, y, 0);}
      else {translate(x, y+j, 0);}

      box(longueur);
      popMatrix();
      fill(255,0,0);
      textSize(longueur/3);
      
      if(direction == 0) {text(""+txtInt++,x-j-longueur+longueur/5, y+longueur/2);}
      else if(direction == 1) {text(""+txtInt++,x+longueur/5, y-j-longueur+longueur/2);}
      else if(direction == 2) {text(""+txtInt++,x+j+longueur/5, y+longueur/2);}
      else {text(""+txtInt++,x+longueur/5, y+j+longueur/2);}
      
  }
      
  return shape;
}

PShape makeShapeSFinal(int surface){
  PShape shape = createShape();
  background(200);
  if (mousePressed)
    if      (mouseButton == LEFT)   zoom += inc+70;
    else if (mouseButton == RIGHT)  zoom -= inc+70;
    int longueur =zoom/10;
  for (int i=surface+150; i>=0;i--){
      pushMatrix();
      translate(0,0,longueur);
      shape(makeShapeS(longueur,i,mouseX,mouseY));
      popMatrix();
  }
  //shape(makeShapeS(longueur,surface+150,mouseX,mouseY));
  //pushMatrix();
  //translate(0,0,longueur);
  //shape(makeShapeS(longueur,surface+150-1,mouseX,mouseY));
  //popMatrix();
   
  return shape;
  
}

PShape makeShapeS(int longueur,int surface, int centerX,int centerY) {
  PShape shape = createShape();
  beginShape();
    // 1. structure 2d
    // draw the center
    if (surface==0){
      drawSquares(2, longueur,centerX,centerY,1,0);
      return shape;
    }
    if (surface==1){
      drawSquares(3, longueur,centerX+longueur,centerY,2,1);
      return shape;
    }
    drawSquares(2, longueur,centerX,centerY,1,0);
    drawSquares(3, longueur,centerX+longueur,centerY,2,1);
    beginShape();
    int j=2;
    int caseNb=3;
    int tourNb= 0;
    
    for (int i=0; i<surface-3;i++){
       
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
