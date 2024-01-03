import static org.junit.jupiter.api.Assertions.*;
import java.awt.geom.*;
import java.math.*;

import org.junit.jupiter.api.Test;

class TestFof {

    private final Fof fof = new Fof();

    @Test
    void interpolation() {

	Point2D.Double A = new Point2D.Double(1.039062, 0.675977);
	Point2D.Double B = new Point2D.Double(1.067578, 0.704688); 
	double normalizedPrecisionForComparison = BigDecimal.valueOf(fof.interpolate(1.05, A, B)).setScale(8, RoundingMode.HALF_UP).doubleValue();
        assertEquals(0.68698980, normalizedPrecisionForComparison);

	
    }


    @Test
    void yForX() {
	assertEquals(0.783008, fof.getYforX(1.183203));
	assertEquals(-0.771680, fof.getYforX(-0.600391));
	assertEquals(-0.012695, fof.getYforX(0.346875));
    }

    @Test
    void findB() {
	assertNotNull(fof.findB(1.183203, fof.points));
	assertNotEquals(Double.NaN, fof.findB(1.183203, fof.points));
	assertNotEquals(0, fof.findB(1.183203, fof.points));
		   
	assertNotNull(fof.findB(-0.600291, fof.points));
    }

    @Test
      void findA() {
	assertNotNull(fof.findA(1.183203, fof.points));
	assertNotEquals(Double.NaN, fof.findA(1.183203, fof.points));
	assertNotEquals(0, fof.findA(1.183203, fof.points));
	
	assertNotNull(fof.findA(-0.600291, fof.points));
    }

}
