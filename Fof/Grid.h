//
//  MyGrid.h
//  Fof
//
//  Created by Ian Brown  on 9/19/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Grid : NSView
    @property NSBezierPath* path;
    @property NSMutableArray* points;
    @property CGFloat xAxis;
    @property CGFloat yAxis;
    @property CGFloat size;
    @property CGFloat maxX;
    @property BOOL showXnumbers;
    @property BOOL showYnumbers;




- (CGFloat) transformX:(CGFloat)xPoint;
- (CGFloat) transformY:(CGFloat)yPoint;
- (CGFloat) transform:(CGFloat)point :(CGFloat)origin :(CGFloat)size;
- (NSArray*) map:(NSArray*)array;
- (void)handleResize;
- (void)setSize:(CGFloat)size;




@end
