//
//  FofCodeGenerator.h
//  Fof
//
//  Created by Ian Brown  on 10/27/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CodeGenerator.h"

@interface FofCodeGenerator : NSObject <CodeGenerator>
-(NSString*)pointsArrayToString:(NSString*)format :(NSArray*)points;
-(NSString*)getTemplate:(NSString*)name;

@end
