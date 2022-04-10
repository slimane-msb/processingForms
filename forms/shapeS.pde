// =================> variables <================== //
int caseNumber=0;

// ===========> fonctions utilitaires <============ // 

// dessiner des series de box 
void dessinerListeDeBox(PShape myboxes,PShape b, int dir, int lengthBox, int x, int y, int listLength){ 
  for (int j=0; j<(lengthBox*listLength);j+=lengthBox){
    pushMatrix();
    PShape bb = myboxes.getChild(caseNumber);
      switch(dir){
       case 0: 
           bb.translate(-lengthBox-j+x, y, 0);
           break;
       case 1:
           bb.translate(x, y-j-lengthBox, 0);
           break;
       case 2:  
           bb.translate(j+x, y, 0);
           break;
       default:
           bb.translate(x, y+j, 0);
           
           break;
      }
      if(caseNumber==0) bb.translate(0,0,-lengthBox);
      b.addChild(bb);
      caseNumber++;
    popMatrix();
  }
}

PShape mainShape(PShape myboxes,int hauteur){
  caseNumber=0;
  lights();
  background(0);
  pushMatrix();
    PShape shape =shapeSample(myboxes,hauteur);
    shape.rotateX(-PI/2);
    caseNumber=0;
  popMatrix();
  return shape;
  
}


PShape shapeSample(PShape myboxes,int hauteur){
  PShape shape = createShape(GROUP);
  int j=0;
  
  for (int i=6; i<hauteur;i+=4){
      PShape et = etage(myboxes,boxSize,i,0,0);
      et.translate(0,0,boxSize*j++);
      shape.addChild(et);

  }
  return shape;
  
}
// un hauteur en 3D
PShape etage(PShape myboxes,int lengthBox,int tourNbBy4, int X,int Y) {
  PShape shape = createShape(GROUP);
  
    if (tourNbBy4<=6){
      dessinerListeDeBox(myboxes,shape, 2, lengthBox,X,Y,1);
    }
    dessinerListeDeBox(myboxes,shape, 3, lengthBox,X+lengthBox,Y,2);
    int j=2;
    int caseNb=3;
    int tourNb= 0;
    
    for (int i=0; i<tourNbBy4-3;i++){
      if (i==tourNbBy4-4) j--;
      //go left
      int dir=i%4;
       switch(dir){
       
         case 0: 
             dessinerListeDeBox(myboxes,shape, dir, lengthBox,X+lengthBox*(tourNb+1),Y+lengthBox*(tourNb+1),j);
             break;
       
         case 1:
             dessinerListeDeBox(myboxes,shape, dir, lengthBox,X-lengthBox*(tourNb+1),Y+lengthBox*(tourNb+1),j);
             break;
       
         case 2:
             dessinerListeDeBox(myboxes,shape, dir, lengthBox,X-lengthBox*(tourNb),Y-lengthBox*(tourNb+1),j);
             break;
         default:
             dessinerListeDeBox(myboxes,shape, dir, lengthBox,X+lengthBox*(tourNb+2),Y-lengthBox*(tourNb),j);
             tourNb++; 
             break;
       }
          caseNb+=j;
          if(i%2==1){
            j++;
          }
      
    }
  
  return shape;
}




// return a box with a number on it

PShape vertexBox(int lengthBox,PGraphics pg,int nb){
 PShape res = createShape();
 pushMatrix();
   res.translate(-lengthBox/2,-lengthBox/2,-lengthBox/2);
   res.beginShape(QUADS);
 //res.noStroke();
      //behind
      //int x=10;
      //int y=5;
      //if (nb<50){
      //  x = (nb%10)*txtDis;
      //  y = (nb/10)*txtDis;
      //}
      //res.texture(pg);
      int x=0;
      int y=0;
      //if (nb<50){
        x = (nb%10)*txtDis;
        y = (nb/10)*txtDis;
        res.texture(pg);
      //}
      res.attrib("idnum", (float)(nb));
      res.vertex(0, 0,0,x,y);
      res.vertex(lengthBox,0,0,x+txtDis,y);
      res.vertex(lengthBox,lengthBox,0,x+txtDis,y+txtDis);
      res.vertex(0,lengthBox,0,x,y+txtDis  );
      //front
      res.vertex(0, 0,lengthBox,x,y);
      res.vertex(lengthBox,0,lengthBox,x+txtDis,y);
      res.vertex(lengthBox,lengthBox,lengthBox,x+txtDis,y+txtDis);
      res.vertex(0,lengthBox,lengthBox,x,y+20 );
      //right
      res.vertex(lengthBox, 0,0,x,y);
      res.vertex(lengthBox,lengthBox,0,x+txtDis,y);
      res.vertex(lengthBox,lengthBox,lengthBox,x+txtDis,y+txtDis);
      res.vertex(lengthBox, 0,lengthBox,x,y+20  );
       //left
      res.vertex(0, 0,0,x,y);
      res.vertex(0,lengthBox,0,x+txtDis,y);
      res.vertex(0,lengthBox,lengthBox,x+txtDis,y+txtDis);
      res.vertex(0, 0,lengthBox,x,y+20 );
      //up
      res.vertex(0, 0,0,x,y);
      res.vertex(lengthBox,0,0,x+txtDis,y);
      res.vertex(lengthBox,0,lengthBox,x+txtDis,y+txtDis);
      res.vertex(0, 0,lengthBox,x,y+20);
      //down
      res.vertex(0, lengthBox,0,x,y);
      res.vertex(lengthBox,lengthBox,x+txtDis,y);
      res.vertex(lengthBox,lengthBox,lengthBox,x+txtDis,y+txtDis);
      res.vertex(0, lengthBox,lengthBox,x,y+20);
      
    res.endShape();
  popMatrix();
  return res;

}
