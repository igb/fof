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
    NSString* format = @"\t\t(%f, %f)";
   return [NSString stringWithFormat:[self getTemplate:@"ScalaTemplate"], name, [self pointsArrayToString:format :points]];
}

@end
