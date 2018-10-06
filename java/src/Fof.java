import java.awt.geom.*;
public class Fof {
	public static Point2D.Double[] points = {
		new Point2D.Double(-0.600391, -0.771680),
		new Point2D.Double(-0.569141, -0.724609),
		new Point2D.Double(-0.540625, -0.695898),
		new Point2D.Double(-0.493750, -0.664453),
		new Point2D.Double(-0.427734, -0.631250),
		new Point2D.Double(-0.376563, -0.579883),
		new Point2D.Double(-0.329688, -0.548438),
		new Point2D.Double(-0.261914, -0.514453),
		new Point2D.Double(-0.212891, -0.465234),
		new Point2D.Double(-0.144727, -0.431055),
		new Point2D.Double(-0.070898, -0.375586),
		new Point2D.Double(-0.003711, -0.341797),
		new Point2D.Double(0.094336, -0.263281),
		new Point2D.Double(0.125586, -0.216211),
		new Point2D.Double(0.199414, -0.142187),
		new Point2D.Double(0.273047, -0.086719),
		new Point2D.Double(0.346875, -0.012695),
		new Point2D.Double(0.400586, 0.059180),
		new Point2D.Double(0.455859, 0.133203),
		new Point2D.Double(0.510742, 0.206641),
		new Point2D.Double(0.561914, 0.258008),
		new Point2D.Double(0.612695, 0.308984),
		new Point2D.Double(0.662695, 0.359180),
		new Point2D.Double(0.740625, 0.437305),
		new Point2D.Double(0.787500, 0.468750),
		new Point2D.Double(0.838672, 0.520117),
		new Point2D.Double(0.867188, 0.548828),
		new Point2D.Double(0.916992, 0.598828),
		new Point2D.Double(0.963867, 0.630273),
		new Point2D.Double(1.010547, 0.661523),
		new Point2D.Double(1.039062, 0.675977),
		new Point2D.Double(1.067578, 0.704688),
		new Point2D.Double(1.080273, 0.717578),
		new Point2D.Double(1.092969, 0.717578),
		new Point2D.Double(1.105859, 0.730664),
		new Point2D.Double(1.118750, 0.730664),
		new Point2D.Double(1.131641, 0.730664),
		new Point2D.Double(1.144531, 0.743750),
		new Point2D.Double(1.157422, 0.756836),
		new Point2D.Double(1.170313, 0.769922),
		new Point2D.Double(1.183203, 0.783008),
	};


    public static Double interpolate(Double x, Point2D.Double a, Point2D.Double b) {

	return a.y + ((b.y - a.y) *   ((x - a.x) / (b.x - a.x)));
    }

	public static void main(String[] args) {
	   Point2D.Double a =   new Point2D.Double(-0.600391, -0.771680);

	   Point2D.Double b =   new Point2D.Double(-0.569141, -0.724609);

	   Double y = interpolate(-0.58, a, b);
	   System.out.println(y);
	    
	}
}
