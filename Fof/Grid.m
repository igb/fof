//
//  MyGrid.m
//  Fof
//
//  Created by Ian Brown  on 9/19/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import "Grid.h"

@implementation Grid



- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    [self.window setBackgroundColor:[NSColor whiteColor]];
    NSRect frame = [self frame];
    
    [[NSColor blueColor] setStroke];
    CGFloat line = 0.5;
    CGFloat size = 20;

    // draw X ticks
    for (int x=0; x<frame.size.width; x++)
    {
        

        CGFloat x_start_x = x * size;
        CGFloat x_start_y = 0;
        CGFloat x_end_x = x * size;
        CGFloat x_end_y = frame.size.height;

        
        NSPoint x_start = NSMakePoint(x_start_x, x_start_y);
        NSPoint x_end = NSMakePoint(x_end_x, x_end_y);

        
        
        NSBezierPath *control = [NSBezierPath bezierPath];
        [control moveToPoint: x_start];
        [control lineToPoint: x_end];
        [control setLineWidth:line];
        [control stroke];
       
     
    }
    
    // draw Y ticks

    for (int y=0; y<frame.size.height; y++)
    {
        CGFloat y_start_x = 0;
        CGFloat y_start_y = y * size;
        CGFloat y_end_x = frame.size.width;
        CGFloat y_end_y = y * size;
        
        NSPoint y_start = NSMakePoint(y_start_x, y_start_y);
        NSPoint y_end = NSMakePoint(y_end_x, y_end_y);
        
        NSBezierPath *control = [NSBezierPath bezierPath];
        [control moveToPoint: y_start];
        [control lineToPoint: y_end];
        
        [control stroke];
        
    }
    
   
 
}


- (void)mouseDown:(NSEvent*)theEvent;
{
    self.lastMousePoint = [theEvent locationInWindow];
    [self setNeedsDisplay:YES];
}





@end
