

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
     
  Point midpoint( ){
    return new Point( PVector.lerp( p0.p, p1.p, 0.5f ) );     
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
  
}
