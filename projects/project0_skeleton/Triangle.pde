

class Triangle {
  
   Point p0,p1,p2;
     
   Triangle(Point _p0, Point _p1, Point _p2 ){
     // TODO: Fill in this function
   }
   
   void draw(){
    // TODO: Fill in this function
   }
   
   // check if a triangle is oriented counterclockwise
   boolean ccw(){
     // TODO: Fill in this function
     return false;
   }
   
   // check if a triangle is oriented clockwise
   boolean cw(){
     // TODO: Fill in this function
     return false;
   }
   
   // returns the area (in pixels) of the triangle
   float area(){
     // TODO: Fill in this function
     return 0; 
   }
   
   // returns a PVector where x,y,z are the internal angles of the triangle (in degrees)
   PVector angles(){
     // TODO: Fill in this function
     return new PVector();
   }
   
   void printInfo(){
     println("Triangle ===============");
     println("    Area: " + area() + " px" );
     println("    CW: " + cw() );
     println("    CCW: " + ccw() );
     println("    Internal Angles: " + angles() + " degrees" );
   }
   
}
