//
//  JavaCodeGenerator.m
//  Fof
//
//  Created by Ian Brown  on 10/1/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import "JavaCodeGenerator.h"

@implementation JavaCodeGenerator

-(NSString*)generate:(NSArray*)points {
    NSMutableString* stringBuffer = [[NSMutableString alloc] init];
    
    [stringBuffer appendString:@"import java.awt.geom.*;\n\n"];
    [stringBuffer appendString:@"public class Fof {\n"];
    [stringBuffer appendString:@"\tpublic static Point2D.Double[] points = {\n"];
    for (int i =0; i < points.count; i++) {
        NSPoint point = [[points objectAtIndex:i] pointValue];
        [stringBuffer appendFormat:@"\t\tnew Point2D.Double(%f, %f),\n", point.x, point.y];
        
    }
    [stringBuffer appendString:@"\t};\n\n"];

    [stringBuffer appendString:@"\tpublic static void main(String[] args) {\n"];

    
    [stringBuffer appendString:@"\t}\n"];
    [stringBuffer appendString:@"}\n"];
    
    return stringBuffer;

}


@end
