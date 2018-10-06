//
//  MyGrid.m
//  Fof
//
//  Created by Ian Brown  on 9/19/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import "Grid.h"
#import "AppDelegate.h"


@implementation Grid


- (void)drawRect:(NSRect)dirtyRect {
    self.size = 20;
    [super drawRect:dirtyRect];
    
    [self.window setBackgroundColor:[NSColor whiteColor]];
    NSRect frame = [self frame];
    
    
    
    // DRAW GRID
    
    [[NSColor blueColor] setStroke];
    CGFloat line = 0.5;
    CGFloat BORDER = 0;

    // DRAW X TICKS
    for (int x=BORDER; x<frame.size.width - BORDER; x = x + self.size)
    {
        

        CGFloat x_start_x = x;
        CGFloat x_start_y = BORDER;
        CGFloat x_end_x = x;
        CGFloat x_end_y = frame.size.height - BORDER;

        
        NSPoint x_start = NSMakePoint(x_start_x, x_start_y);
        NSPoint x_end = NSMakePoint(x_end_x, x_end_y);

        
        
        NSBezierPath *control = [NSBezierPath bezierPath];
        [control moveToPoint: x_start];
        [control lineToPoint: x_end];
        [control setLineWidth:line];
        
        [control stroke];
        
        
        if ( fabs(((frame.size.width - BORDER) / 2) - x) <= self.size) {
            self.xAxis = x;
        }
       
     
    }
    
    
    
    // DRAW Y TICKS

    for (int y=BORDER; y<frame.size.height - BORDER; y = y + self.size)
    {
        CGFloat y_start_x = BORDER;
        CGFloat y_start_y = y;
        CGFloat y_end_x = frame.size.width - BORDER;
        CGFloat y_end_y = y;
        
        NSPoint y_start = NSMakePoint(y_start_x, y_start_y);
        NSPoint y_end = NSMakePoint(y_end_x, y_end_y);
        
        NSBezierPath *control = [NSBezierPath bezierPath];
        [control moveToPoint: y_start];
        [control lineToPoint: y_end];
        
        [control stroke];
        
        
        if ( fabs(((frame.size.height - BORDER) / 2) - y) <= self.size) {
            self.yAxis = y;
        }
        
    }
    
    
    // DRAW X AXiS
    
    CGFloat xAxis_start_x = self.xAxis;
    CGFloat xAxis_start_y = BORDER;
    CGFloat xAxis_end_x = self.xAxis;
    CGFloat xAxis_end_y = frame.size.height - BORDER;
    
    NSPoint xAxis_start = NSMakePoint(xAxis_start_x, xAxis_start_y);
    NSPoint xAxis_end = NSMakePoint(xAxis_end_x, xAxis_end_y);
    
    
    
    NSBezierPath *xAxis = [NSBezierPath bezierPath];
    [xAxis moveToPoint: xAxis_start];
    [xAxis lineToPoint: xAxis_end];
    [xAxis setLineWidth:2.0];
    [[NSColor orangeColor] setStroke];

    [xAxis stroke];
    
    
    // DRAW Y AXiS
    
    CGFloat yAxis_start_x = BORDER;
    CGFloat yAxis_start_y = self.yAxis;
    CGFloat yAxis_end_x = frame.size.width - BORDER;
    CGFloat yAxis_end_y = self.yAxis;
    
    NSPoint yAxis_start = NSMakePoint(yAxis_start_x, yAxis_start_y);
    NSPoint yAxis_end = NSMakePoint(yAxis_end_x, yAxis_end_y);
    
    NSBezierPath *yAxis = [NSBezierPath bezierPath];
    [yAxis moveToPoint: yAxis_start];
    [yAxis lineToPoint: yAxis_end];
    
    
    [yAxis setLineWidth:2.0];
    [[NSColor orangeColor] setStroke];
    
    [yAxis stroke];
    
    
    // DRAW LINE
    
    if (self.path != nil) {
        
        [[NSColor purpleColor] setStroke];

         [self.path setLineWidth:4.0];
        [self.path stroke];
    
    }
 
}


- (void)mouseDown:(NSEvent*)event
{
    // INITIALIZE
    self.path = [NSBezierPath bezierPath];
    [self.path moveToPoint:[event locationInWindow]];
    
    self.points = [[NSMutableArray alloc] init];
    
}

-(void)mouseUp:(NSEvent *)event {
    NSLog(@"mouse up");
    NSLog(@"HALF: %f", [self frame].size.width / 2);
    NSLog(@"points size: %d", [self.points count]);
    NSLog(@"X axis: %f", self.xAxis);
    NSLog(@"Y axis: %f", self.yAxis);
    
    NSMutableString* pointStr = [[NSMutableString alloc] init];
    for (int i = 0; i < [self.points count]; i++) {
        NSValue* pointValue = [self.points objectAtIndex:i];
        NSPoint point = [pointValue pointValue];
        [pointStr appendString:[NSString stringWithFormat:@"NSMakePoint(%f, %f);\n", point.x, point.y]];
        
    }
    
    
    //transform and pass back to app delegate for export
    NSArray *mappedPoints = [self map:self.points];
    AppDelegate* myDelegate = [[NSApplication sharedApplication] delegate];
    [myDelegate setMappedPoints:mappedPoints];
    
    NSLog(@"%@", pointStr);
    
}

-(void)mouseDragged:(NSEvent *)event {
    NSPoint point = [event locationInWindow];
    [self.points addObject:[NSValue valueWithPoint:point]];
    [self.path lineToPoint:point];
    [self setNeedsDisplay:YES];
    
    
}


- (CGFloat) transformX:(CGFloat)xPoint {
    return [self transform:xPoint :self.xAxis :self.size];

    
}
- (CGFloat) transformY:(CGFloat)yPoint {
    return [self transform:yPoint :self.yAxis :self.size];

}

- (CGFloat) transform:(CGFloat)point :(CGFloat)origin :(CGFloat)size{
    return (point - origin) / size;
    
}

- (NSArray*) map:(NSArray*)array {
    NSMutableArray* newArray = [[NSMutableArray alloc] init];
    for (int i =0; i < [array count]; i++) {
        NSValue* pointValue = [self.points objectAtIndex:i];
        NSPoint point = [pointValue pointValue];
        [newArray addObject:[NSValue valueWithPoint:NSMakePoint([self transformX:point.x], [self transformY:point.y])]];
    }
    
    return newArray;
}



@end
