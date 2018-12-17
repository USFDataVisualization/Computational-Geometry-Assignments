
ArrayList<Point>    points    = new ArrayList<Point>();
ArrayList<Edge>     edges     = new ArrayList<Edge>();
ArrayList<Triangle> triangles = new ArrayList<Triangle>();


void setup(){
  size(800,800,P3D);
  frameRate(30);
}


void draw(){
  //clear the display
  background(255);
  
  // code to convert the display into a RIGHT HAND coordinate system
  // remove if you're ok using a left hand coordinate system
  translate( 0, height, 0);
  scale( 1, -1, 1 );
  
  // TODO: Fill in this function
}


void mousePressed(){
  
  // calculate the mouse poisition in a RIGHT HAND coordinate system
  int mouseXRHC = mouseX;
  int mouseYRHC = height-mouseY;
  
  // Add the click to the point list, considering a RIGHT HAND coordinate system
  points.add( new Point(mouseXRHC,mouseYRHC) );
  //// Use the following line instead, if using a left hand coordinate system
  //points.add( new Point(mouseX,mouseY) );
  
  
  // TODO: Further fill in this function
}

// Special functions to draw text in a RIGHT HAND coordinate system
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

  
