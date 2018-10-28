object Fof {
  val points = Array((1.0, 4.32),(12.456, 12.110), (40.00003,23.32), (50.3452, 400.3)	)
  
  def main(args: Array[String]): Unit = {
    val x: Double  = args(0).toDouble
    val a: Option[(Double, Double)]  = findA(x)
    val b: Option[(Double, Double)]  = findB(x)

    if (a.isDefined && b.isDefined) {
       println("A: " + a.get)
       val y = interpolate(x, a.get, b.get)
       println("   (" + x + ", " + y + ")")
       println("B: " + b.get)
    }
   
  }
  
  def findA(x: Double): Option[(Double, Double)] = {
      var a: Option[(Double, Double)] = Option.empty
      for (i <- 0 until points.length) {
      	  if (x < points(i)._1) {
	     return a
	  } else {
	     a = Option(points(i))
	  }	
       }
       return a  
  }



  def findB(x: Double): Option[(Double, Double)] = {

      for (i <- 0 until points.length) {
      	  if (x <= points(i)._1) {
	     return Option(points(i))
	  } 	
       }
       return Option.empty
  }


  def interpolate(x: Double, a:(Double, Double), b:(Double, Double)): Double = {
		   println( a._2 + " + ((" + b._2 + " - " + a._2 + ") *   ((" + x + " - " + a._1 + ") / (" + b._1 + " - " + a._1 + ")))")
		   a._2 + ((b._2 - a._2) *   ((x - a._1) / (b._1 - a._1)))
		  
	}


/*
	public static Double interpolate(Double x, Point2D.Double a, Point2D.Double b) {
		return a.y + ((b.y - a.y) *   ((x - a.x) / (b.x - a.x)));
	}


	public static Point2D.Double findA(Double x, Point2D.Double[] points) {
		Point2D.Double a = null;
		for (int i = 0; i < points.length; i++) {
			if (points[i].x >= x) {
				return a;

			} else {
				a = points[i];
			}

		}
		return a;
	}

	public static Point2D.Double findB(Double x, Point2D.Double[] points) {
		for (int i = 0; i < points.length; i++) {
			if (points[i].x > x) {
				return points[i];
			}
		
		}
		return null;
	}

	public Double getYforX(Double x) {
		Point2D.Double a = findA(x, points);
		Point2D.Double b = findB(x, points);
		return interpolate(x, a, b);
	}

*/


//interpolate

}