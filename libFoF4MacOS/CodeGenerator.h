//
//  CodeGenerator.h
//  Fof
//
//  Created by Ian Brown  on 10/1/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CodeGenerator <NSObject>

-(NSString*)generate:(NSArray*)points :(NSString*) name;

@end
