

class Edge{
  
   Point p0,p1;
      
   Edge( Point _p0, Point _p1 ){
     p0 = _p0; p1 = _p1;
   }
   
   void draw(){
     line( p0.p.x, p0.p.y, 
           p1.p.x, p1.p.y );
   }
   
   void drawDotted(){
     float steps = p0.distance(p1)/6;
     for(int i=0; i<=steps; i++) {
       float x = lerp(p0.p.x, p1.p.x, i/steps);
       float y = lerp(p0.p.y, p1.p.y, i/steps);
       //noStroke();
       ellipse(x,y,3,3);
     }
  }
   
   public String toString(){
     return "<" + p0 + "" + p1 + ">";
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
     PVector P0 = p0.p;
     PVector P1 = other.p0.p;
     PVector D  = PVector.sub( p1.p, p0.p );
     PVector Q  = PVector.sub( other.p1.p, other.p0.p );
     PVector R  = PVector.sub( P1, P0 );
     
     float u = R.cross(D).z / D.cross(Q).z;
     if( u < 0 || u > 1 ) return null;
     
     float t = 0;
     if( abs(D.x) > abs(D.y) )
       t = (R.x + Q.x*u) / D.x;
     else
       t = (R.y + Q.y*u) / D.y;

     if( t < 0 || t > 1 ) return null;
     
     PVector P = PVector.add( P1, PVector.mult( Q, u ) );
     
     return new Point( P );     
   }
   
   
}
