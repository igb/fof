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
    NSMutableString* code = [NSMutableString stringWithString:@"var points = ["];
    NSString* format = @"\t{x: %f, y: %f}";
    [code appendString:[self pointsArrayToString:format :points]];
    [code appendString:@"]\n"];
    
    [code appendString:[self getTemplate:@"JavaScriptTemplate"]];
    return code;
}

@end
