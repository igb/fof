//
//  JavaScriptCodeGenerator.m
//  Fof
//
//  Created by Ian Brown  on 10/27/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import "JavaScriptCodeGenerator.h"

@implementation JavaScriptCodeGenerator


-(NSString*)generate:(NSArray*)points :(NSString*)name{
    NSString* format = @"\t{x: %f, y: %f}";
    return [NSString stringWithFormat:[self getTemplate:@"JavaScriptTemplate"], [self pointsArrayToString:format :points]];
}

@end
