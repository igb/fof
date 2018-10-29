//
//  FofCodeGenerator.m
//  Fof
//
//  Created by Ian Brown  on 10/27/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import "FofCodeGenerator.h"

@implementation FofCodeGenerator

-(NSString*)generate:(NSArray*)points :(NSString*)name{
    return @"";
}
-(NSString*)pointsArrayToString:(NSString*)format :(NSArray*)points {
    NSMutableString* stringbuffer = [NSMutableString stringWithString:@""];
    
    for (int i = 0; i < [points count]; i++) {
        
        NSPoint point = [[points objectAtIndex:i] pointValue];
        [stringbuffer appendFormat:format, point.x, point.y];
        if (i != ([points count] - 1)) {
            [stringbuffer appendString:@","];
        }
        [stringbuffer appendString:@"\n"];
    }
    
    return stringbuffer;
}

-(NSString*)getTemplate:(NSString*)name {
    NSBundle* bundle = [NSBundle mainBundle];
    NSURL* template = [bundle URLForResource:name withExtension:@"txt"];
    return [NSString stringWithContentsOfURL:template encoding:NSUTF8StringEncoding error:nil];
}
@end
