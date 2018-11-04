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
    NSString* format = @"\t\t(%f, %f)";
    [code appendString:[self pointsArrayToString:format :points]];
    [code appendString:@")\n"];
    [code appendString:[self getTemplate:@"ScalaTemplate"]];
    return code;
}

@end
