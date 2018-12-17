

// Module for testing performance of naive and optimized implementations
// works by testing may random sets of edges.
void performanceTest( ){
  int numOfEdges = 1000;
  int iterations = 4000; 
  
  println("Running Performance Test");
  for( int nE = 10; nE <= numOfEdges; nE*=10, iterations/=8 ){
    
    println( "  " + nE + " edges per test; " + iterations + " iterations" );
    int start = millis();
    for(int i = 0; i < iterations; i++ ){
      makeRandomSegments( nE );
      NaiveLineSegmentSetIntersection( edges, intersectionsNaive );
    }
    int tNaive = (millis()-start);
    println( "    Naive Implementation: " + tNaive + " ms" );
  
    start = millis();
    for(int i = 0; i < iterations; i++ ){
      makeRandomSegments( nE );
      OptimizedLineSegmentSetIntersection( edges, intersectionsOpt );
    }
    int tOpt  = (millis()-start);
    println( "    Optimized Implementation: " + tOpt + " ms" );
    println( "    Improvement: " + (int)( 100.0f *(tNaive-tOpt)/(tNaive) ) + "%" );
  }
}



// module for testing the correctness of the naive and optimized implementations
// works by comparing the resulting points from naive and optimized algorithm run on the same set of edges.
void compareOutput( ){

  println("Running Correctness Test");
  for( int nE = 2; nE <= 256; nE*=2 ){
    
    println("  Testing " + nE + " edges" );
    
    for( int iter = 0; iter < 10; iter++ ){
      makeRandomSegments( nE );
      NaiveLineSegmentSetIntersection( edges, intersectionsNaive );
      OptimizedLineSegmentSetIntersection( edges, intersectionsOpt );
      
      if( intersectionsNaive.size() != intersectionsOpt.size() ){
        println( "  ERROR: Size differences!  Naive: " + intersectionsNaive.size() + "; Optimized: " + intersectionsOpt.size() );
        return;
      }
      
      sortPoints( intersectionsNaive );
      sortPoints( intersectionsOpt );
      
      for( int i = 0; i < intersectionsNaive.size(); i++ ){
        float d = intersectionsNaive.get(i).distance( intersectionsOpt.get(i) );
        if( d > 0.01f ){ 
          println( "  ERROR: Point Sets Don't Match!" );
          return;
        }
        if( d > 0 ){
          println( "  Warning: Points Don't Match Exactly" );
        }
      }
    }
    
  }  
  
}



// support functionality
void sortPoints( ArrayList<Point> pnts ){
  Collections.sort( pnts, new Comparator<Point>(){
    public int compare( Point p0, Point p1 ){
      if( p0.p.x < p1.p.x ) return -1;
      if( p0.p.x > p1.p.x ) return  1;
      if( p0.p.y < p1.p.y ) return -1;
      if( p0.p.y > p1.p.y ) return  1;
      return 0;
    }
  });
}
