

// The naive O(n^2) method for calucating the intersections of a set of line segments.  
public static void NaiveLineSegmentSetIntersection( ArrayList<Edge> input_edges, ArrayList<Point> output_intersections ){
  output_intersections.clear();
  for( int i = 0; i < input_edges.size(); i++ ){
    for(int j = i+1; j < input_edges.size(); j++ ){
      Point intersection = input_edges.get(i).intersectionPoint(input_edges.get(j));
      if(intersection != null)
        output_intersections.add(intersection);
    }
  }
}


// The naive O(n^2) method for calucating the intersections of a set of line segments that uses the optimized line intersection.  
public static void OptimizedLineSegmentSetIntersection( ArrayList<Edge> input_edges, ArrayList<Point> output_intersections ){
  output_intersections.clear();
  for( int i = 0; i < input_edges.size(); i++ ){
    for(int j = i+1; j < input_edges.size(); j++ ){
      Point intersection = input_edges.get(i).optimizedIntersectionPoint(input_edges.get(j));
      if(intersection != null)
        output_intersections.add(intersection);
    }
  }
}


public static void OptimizedLineSegmentSetIntersectionAABB( ArrayList<Edge> input_edges, ArrayList<Point> output_intersections ){
  // TODO: Implement the optimized AABB method for calucating the intersections of a set of line segments.
  // The implemention does NOT need to use an interval tree. However, performance matters!
  output_intersections.clear();
}
