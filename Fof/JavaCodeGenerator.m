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
    
    NSString* format = @"\t\tnew Point2D.Double(%f, %f)";

    return [NSString stringWithFormat:[self getTemplate:@"JavaTemplate"], name, [self pointsArrayToString:format :points]];
  

}


@end
