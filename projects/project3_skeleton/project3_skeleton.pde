
import java.util.*;

ArrayList<Point>    points     = new ArrayList<Point>();
ArrayList<Edge>     edges      = new ArrayList<Edge>();
Polygon             convexHull = new Polygon();


boolean saveImage = false;

int numOfPoints = 4;


void generateRandomPoints(){
  for( int i = 0; i < numOfPoints; i++){
    points.add( new Point( random(100,width-100), random(100,height-100) ) );
  }
}

void calculateConvexHull(){
  convexHull = ConvexHullGiftWrapped( points );
}



void setup(){
  size(800,800,P3D);
  frameRate(30);
}


void draw(){
  background(255);
  
  translate( 0, height, 0);
  scale( 1, -1, 1 );
  
  strokeWeight(3);
  
  fill(0);
  noStroke();
  for( Point p : points ){
    p.draw();
  }
  
  noFill();
  stroke(100);
  for( Edge e : edges ){
    e.draw();
  }
  
  stroke( 100, 100, 100 );
  if( convexHull.ccw() ) stroke( 100, 200, 100 );
  if( convexHull.cw()  ) stroke( 200, 100, 100 ); 
  convexHull.draw();
  
  
  
  fill(0);
  stroke(0);
  textSize(18);
  
  textRHC( "Controls", 10, height-20 );
  textRHC( "+/-: Increase/Decrease Number of Random Points Generated", 10, height-40 );
  textRHC( "g: Generate " + numOfPoints + " Random Point(s)", 10, height-60 );
  textRHC( "c: Clear Points", 10, height-80 );
  textRHC( "s: Save Image", 10, height-100 );
  
  for( int i = 0; i < points.size(); i++ ){
    textRHC( i+1, points.get(i).p.x+5, points.get(i).p.y+15 );
  }
  
  if( saveImage ) saveFrame( ); 
  saveImage = false;
  
}


void keyPressed(){
  if( key == 's' ) saveImage = true;
  if( key == '+' ){ numOfPoints++; calculateConvexHull(); }
  if( key == '-' ){ numOfPoints = max( numOfPoints-1, 1 ); calculateConvexHull(); }
  if( key == 'g' ){ generateRandomPoints(); calculateConvexHull(); }
  if( key == 'c' ){ points.clear(); calculateConvexHull(); }
}



void textRHC( int s, float x, float y ){
  textRHC( Integer.toString(s), x, y );
}


void textRHC( String s, float x, float y ){
  pushMatrix();
  translate(x,y);
  scale(1,-1,1);
  text( s, 0, 0 );
  popMatrix();
}

Point sel = null;

void mousePressed(){
  int mouseXRHC = mouseX;
  int mouseYRHC = height-mouseY;
  
  float dT = 6;
  for( Point p : points ){
    float d = dist( p.p.x, p.p.y, mouseXRHC, mouseYRHC );
    if( d < dT ){
      dT = d;
      sel = p;
    }
  }
  
  if( sel == null ){
    sel = new Point(mouseXRHC,mouseYRHC);
    points.add( sel );
    calculateConvexHull();
  }
}

void mouseDragged(){
  int mouseXRHC = mouseX;
  int mouseYRHC = height-mouseY;
  if( sel != null ){
    sel.p.x = mouseXRHC;   
    sel.p.y = mouseYRHC;
    calculateConvexHull();
  }
}

void mouseReleased(){
  sel = null;
}




  
