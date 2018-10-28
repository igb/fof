object Fof {
  val points = Array((1.0, 4.32),(12.456, 12.110), (40.00003,23.32), (50.3452, 400.3)	)
  
  def main(args: Array[String]): Unit = {
    val x: Double  = args(0).toDouble
    val y: Double = getYforX(x)
    
       println(y)
      
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
      		   if (x == a._1) {
		      a._2
		   } else {
		      a._2 + ((b._2 - a._2) *   ((x - a._1) / (b._1 - a._1)))
		   }
	}



  def getYforX(x: Double): Double = {
  
	val a = findA(x)
	val b = findB(x)
	if (a.isDefined && b.isDefined) {
	   interpolate(x, a.get, b.get)
	} else {
	   Double.NaN
	}
  
  }


}