

class Point {
  
   public PVector p;

   public Point( float x, float y ){
     // TODO: Use code from Project 0
   }

   public Point(PVector _p0 ){
     p = _p0;
   }
   
   public void draw(){
     // TODO: Use code from Project 0
   }
   
   float getX(){ return p.x; }
   float getY(){ return p.y; }
   
   public float distance( Point o ){
     return PVector.dist( p, o.p );
   }
   
   public String toString(){
     return p.toString();
   }
}
