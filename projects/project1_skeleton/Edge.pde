

class Edge{
  
   Point p0,p1;
      
   Edge(Point _p0, Point _p1 ){
     p0 = _p0; p1 = _p1;
   }
   
   void draw(){
     line( p0.p.x, p0.p.y, 
           p1.p.x, p1.p.y );
   }
   
   
   boolean intersectionTest( Edge other ){
     // TODO: Implement The Cross Product Based Test To Determine If 2 Edges Intersect
     return false;
   }
   
   Point intersectionPoint( Edge other ){
     // TODO: Implement A Method To Find The Edge Intersection Point
     // Care should be taken to make the implementation CORRECT. Speed doesn't matter.
     return null;
   }
   
   Point optimizedIntersectionPoint( Edge other ){
     // TODO: Implement A Faster Method To Find The Edge Intersection Point
     // The result should be correct, but SPEED MATTERS.
     return null;
   }   
   
}
