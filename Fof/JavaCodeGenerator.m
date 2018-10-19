//
//  JavaCodeGenerator.m
//  Fof
//
//  Created by Ian Brown  on 10/1/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import "JavaCodeGenerator.h"

@implementation JavaCodeGenerator

-(NSString*)generate:(NSArray*)points :(NSString*)name{
    NSMutableString* stringBuffer = [[NSMutableString alloc] init];
    
    [stringBuffer appendString:@"import java.awt.geom.*;\n\n"];
    [stringBuffer appendString:@"public class "];
     [stringBuffer appendString:name];
     [stringBuffer appendString:@" {\n"];
    [stringBuffer appendString:@"\tpublic static Point2D.Double[] points = {\n"];
    for (int i =0; i < points.count; i++) {
        NSPoint point = [[points objectAtIndex:i] pointValue];
        [stringBuffer appendFormat:@"\t\tnew Point2D.Double(%f, %f),\n", point.x, point.y];
        
    }
    [stringBuffer appendString:@"\t};\n\n"];
    
    
    // LINEAR INTERPOLATION METHOD
    [stringBuffer appendString:@"\tpublic static Double interpolate(Double x, Point2D.Double a, Point2D.Double b) {\n"];
    [stringBuffer appendString:@"\t\treturn a.y + ((b.y - a.y) *   ((x - a.x) / (b.x - a.x)));\n"];
    [stringBuffer appendString:@"\t}\n\n"];
    
    
    
    //find A
    
    [stringBuffer appendString:@"\tpublic static Point2D.Double findA(Double x, Point2D.Double[] points) {\n"];
    [stringBuffer appendString:@"\t\tPoint2D.Double a = null;\n"];
    [stringBuffer appendString:@"\t\tfor (int i = 0; i < points.length; i++) {\n"];
    [stringBuffer appendString:@"\t\t\tif (points[i].x > x) {\n"];
    [stringBuffer appendString:@"\t\t\t\treturn a;\n"];
    [stringBuffer appendString:@"\n"];
    [stringBuffer appendString:@"\t\t\t} else {\n"];
    [stringBuffer appendString:@"\t\t\t\ta = points[i];\n"];
    [stringBuffer appendString:@"\t\t\t}\n"];
    [stringBuffer appendString:@"\n"];
    [stringBuffer appendString:@"\t\t}\n"];
    [stringBuffer appendString:@"\t\treturn a;\n"];
    [stringBuffer appendString:@"\t}\n\n"];
    
    
    //find B

    [stringBuffer appendString:@"\tpublic static Point2D.Double findB(Double x, Point2D.Double[] points) {\n"];
    [stringBuffer appendString:@"\t\tfor (int i = 0; i < points.length; i++) {\n"];
    [stringBuffer appendString:@"\t\t\tif (points[i].x > x) {\n"];
    [stringBuffer appendString:@"\t\t\t\treturn points[i];\n"];
    [stringBuffer appendString:@"\t\t\t}\n"];
    [stringBuffer appendString:@"\t\t\n"];
    [stringBuffer appendString:@"\t\t}\n"];
    [stringBuffer appendString:@"\t\treturn null;\n"];
    [stringBuffer appendString:@"\t}\n\n"];

    
    // get y for x
    
    [stringBuffer appendString:@"\tpublic Double getYforX(Double x) {\n"];
    [stringBuffer appendString:@"\t\tPoint2D.Double a = findA(x, points);\n"];
    [stringBuffer appendString:@"\t\tPoint2D.Double b = findB(x, points);\n"];
    [stringBuffer appendString:@"\t\treturn interpolate(x, a, b);\n"];
    [stringBuffer appendString:@"\t}\n\n"];

    // PSVM
    [stringBuffer appendString:@"\tpublic static void main(String[] args) {\n"];
    [stringBuffer appendString:@"\t\tDouble x = Double.parseDouble(args[0]);\n"];
    [stringBuffer appendString:@"\t\tPoint2D.Double a = findA(x, points);\n"];
    [stringBuffer appendString:@"\t\tPoint2D.Double b = findB(x, points);\n"];
    [stringBuffer appendString:@"\t\tDouble y = interpolate(x, a, b);\n"];
    [stringBuffer appendString:@"\t\tSystem.out.println(y);\n"];
        

    
    [stringBuffer appendString:@"\t}\n\n"];
    [stringBuffer appendString:@"}\n"];
    
    return stringBuffer;

}


@end
