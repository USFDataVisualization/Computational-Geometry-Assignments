

class Edge{
  
   Point p0,p1;
   AABB aabb;
   
   Edge(Point _p0, Point _p1 ){
     p0 = _p0;
     p1 = _p1;
     // TODO: Initialize AABB
     // aabb = new AABB( ... );
   }
   
   void draw(){
     line( p0.p.x, p0.p.y, 
           p1.p.x, p1.p.y );
   }
   
   AABB getAABB(){
     return aabb;
   }
   
   boolean intersectionTest( Edge other ){
     PVector v1 = PVector.sub( other.p0.p, p0.p );
     PVector v2 = PVector.sub( p1.p, p0.p );
     PVector v3 = PVector.sub( other.p1.p, p0.p );
     
     float z1 = v1.cross(v2).z;
     float z2 = v2.cross(v3).z;
     
     if( (z1*z2)<0 ) return false;  

     PVector v4 = PVector.sub( p0.p, other.p0.p );
     PVector v5 = PVector.sub( other.p1.p, other.p0.p );
     PVector v6 = PVector.sub( p1.p, other.p0.p );

     float z3 = v4.cross(v5).z;
     float z4 = v5.cross(v6).z;
     
     if( (z3*z4<0) ) return false;  
     
     return true;  
   }
   
   Point intersectionPoint( Edge other ){
     // TODO: Implement A Method To Find The Edge Intersection Point.
     // Should return the intersection point or null, if no intersection exists.
     // Care should be taken to make the implementation CORRECT. Speed doesn't matter.
     return null;
   }
   
   Point optimizedIntersectionPoint( Edge other ){
     // TODO: Implement A Faster Method To Find The Edge Intersection Point.
     // Should return the intersection point or null, if no intersection exists.
     // The result should be correct, but SPEED MATTERS.
     return null;
   }   
   
}
