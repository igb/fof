//
//  PythonCodeGenerator.m
//  Fof
//
//  Created by Ian Brown  on 10/29/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import "PythonCodeGenerator.h"

@implementation PythonCodeGenerator


-(NSString*)generate:(NSArray*)points :(NSString*)name{
    NSMutableString* code = [NSMutableString stringWithString:@"class Fof:\n    def __init__(self):\n"];
    [code appendString:@"        self.points=[\n"];
    NSString* format = @"            Point(%f, %f)";
    [code appendString:[self pointsArrayToString:format :points]];
    [code appendString:@"        ]\n"];
    
    [code appendString:[self getTemplate:@"PythonTemplate"]];
    return code;
}

@end
