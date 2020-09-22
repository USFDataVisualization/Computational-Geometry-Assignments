

// Function to make a set of random edges
void makeRandomSegments( int numOfEdges, float max_length ){
  points.clear();
  edges.clear();
  intersectionsNaive.clear();
  intersectionsOpt.clear();
  
  for( int i = 0; i < numOfEdges; i++ ){
    Point p0 = new Point( random(150,650), random(150,650) );
    Point p1 = new Point( PVector.fromAngle( random(0,2*PI) )
                                 .mult( random(10,max_length) )
                                 .add(p0.p) );
    points.add( p0 );
    points.add( p1 );
    edges.add( new Edge( points.get(i*2), points.get(i*2+1) ) );
  }
}


// Module for testing performance of naive and optimized implementations
// works by testing may random sets of edges.
void performanceTest( ){
  int numOfEdges = 1000;
  int iterations = 4000; 
  
  println("Running Performance Test");
  for( int nE = 10; nE <= numOfEdges; nE*=10, iterations/=8 ){
    
    println( "  " + nE + " edges per test; " + iterations + " iterations" );
    
    // NAIVE
    int start = millis();
    for(int i = 0; i < iterations; i++ ){
      makeRandomSegments( nE, 150 );
      NaiveLineSegmentSetIntersection( edges, intersectionsNaive );
    }
    int tNaive = (millis()-start);
    println( "    Naive Implementation: " + tNaive + " ms" );
  
    // OPT
    start = millis();
    for(int i = 0; i < iterations; i++ ){
      makeRandomSegments( nE, 150 );
      OptimizedLineSegmentSetIntersection( edges, intersectionsOpt );
    }
    int tOpt  = (millis()-start);
    println( "    Optimized Implementation: " + tOpt + " ms" );
    println( "    Improvement over naive: " + (int)( 100.0f *(tNaive-tOpt)/(tNaive) ) + "%" );
    
    // AABB
    start = millis();
    for(int i = 0; i < iterations; i++ ){
      makeRandomSegments( nE, 150 );
      OptimizedLineSegmentSetIntersectionAABB( edges, intersectionsAABB );
    }
    int tAABB  = (millis()-start);
    println( "    AABB Optimized Implementation: " + tAABB + " ms" );
    println( "    Improvement over naive: " + (int)( 100.0f *(tNaive-tAABB)/(tNaive) ) + "%" );
    
  }
  
}



// module for testing the correctness of the naive and optimized implementations
// works by comparing the resulting points from naive and optimized algorithm run on the same set of edges.
void compareOutput( ){

  println("Running Correctness Test");
  for( int nE = 2; nE <= 256; nE*=2 ){
    
    println("  Testing " + nE + " edges" );
    
    for( int iter = 0; iter < 10; iter++ ){
      makeRandomSegments( nE, 150 );
      NaiveLineSegmentSetIntersection( edges, intersectionsNaive );
      OptimizedLineSegmentSetIntersection( edges, intersectionsOpt );
      OptimizedLineSegmentSetIntersectionAABB( edges, intersectionsAABB );
      
      if( intersectionsNaive.size() != intersectionsOpt.size() ||  intersectionsNaive.size() != intersectionsAABB.size() ){
        println( "  ERROR: Size differences!  Naive: " + intersectionsNaive.size() + "; Optimized: " + intersectionsOpt.size() + "; AABB: " + intersectionsAABB.size() );
        return;
      }
      
      sortPoints( intersectionsNaive );
      sortPoints( intersectionsOpt );
      sortPoints( intersectionsAABB );
      
      for( int i = 0; i < intersectionsNaive.size(); i++ ){
        float dOpt = intersectionsNaive.get(i).distance( intersectionsOpt.get(i) );
        float dAABB = intersectionsNaive.get(i).distance( intersectionsAABB.get(i) );
        if( dOpt > 0.01f ){ 
          println( "  ERROR: Naive/Optimized Point Sets Don't Match!" );
          return;
        }
        if( dOpt > 0 ){
          println( "  Warning: Naive/Optimized Points Don't Match Exactly" );
        }
        if( dAABB > 0.01f ){ 
          println( "  ERROR: Naive/AABB Point Sets Don't Match!" );
          return;
        }
        if( dAABB > 0 ){
          println( "  Warning: Naive/AABB Points Don't Match Exactly" );
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
