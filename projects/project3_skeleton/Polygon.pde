

class Polygon {
  
   ArrayList<Point> p = new ArrayList<Point>();
     
   Polygon( ){  }
   
   void draw(){
     int N = p.size();
     for(int i = 0; i < N; i++ ){
       line( p.get(i).x(), p.get(i).y(), p.get((i+1)%N).x(), p.get((i+1)%N).y() );
     }
   }
   
   void addPoint( Point _p ){ p.add( _p ); }
   
   boolean isClosed(){ return p.size()>=3; }
   boolean isSimple(){ return false; }
   boolean ccw(){ return false; }
   boolean cw(){ return false; }
   
   
   
}
