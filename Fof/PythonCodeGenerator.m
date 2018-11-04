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
    NSString* format = @"            Point(%f, %f)";
    return [NSString stringWithFormat:[self getTemplate:@"PythonTemplate"], name, [self pointsArrayToString:format :points], name];
}

@end
