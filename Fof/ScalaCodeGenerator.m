//
//  ScalaCodeGenerator.m
//  Fof
//
//  Created by Ian Brown  on 10/27/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import "ScalaCodeGenerator.h"

@implementation ScalaCodeGenerator

-(NSString*)generate:(NSArray*)points :(NSString*)name{
    NSMutableString* code = [NSMutableString stringWithFormat:@"object %@ {\n", name];
    [code appendString:@"\nval points = Array(\n"];
    for (int i = 0; i < [points count]; i++) {
        
        NSPoint point = [[points objectAtIndex:i] pointValue];
        [code appendFormat:@"\t\t(%f, %f)", point.x, point.y];
        if (i != ([points count] - 1)) {
            [code appendString:@","];
        }
        [code appendString:@"\n"];
    }
    [code appendString:@")\n"];
    NSBundle* bundle = [NSBundle mainBundle];
    NSURL* template = [bundle URLForResource:@"ScalaTemplate" withExtension:@"txt"];
    [code appendString:[NSString stringWithContentsOfURL:template encoding:NSUTF8StringEncoding error:nil]];
    return code;
}

@end
