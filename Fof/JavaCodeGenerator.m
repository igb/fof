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
    NSMutableString* code = [[NSMutableString alloc] init];
    
    [code appendString:@"import java.awt.geom.*;\n\n"];
    [code appendString:@"public class "];
    [code appendString:name];
    [code appendString:@" {\n"];
    [code appendString:@"\tpublic static Point2D.Double[] points = {\n"];
    
    NSString* format = @"\t\tnew Point2D.Double(%f, %f)";
    [code appendString:[self pointsArrayToString:format :points]];
    [code appendString:@"\t};\n\n"];
    [code appendString:[self getTemplate:@"JavaTemplate"]];
    return code;
    
    
    return code;

}


@end
