//
//  AppDelegate.h
//  Fof
//
//  Created by Ian Brown  on 9/16/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property NSArray* mappedPoints;

- (IBAction)generateCode:(id)sender;
- (void)setMappedPoints:(NSArray*)mappedPoints;

@end

