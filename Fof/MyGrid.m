//
//  MyGrid.m
//  Fof
//
//  Created by Ian Brown  on 9/19/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import "MyGrid.h"

@implementation MyGrid

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    CGRect myNewRect = CGRectMake(100, 100, 150, 150);
    
    CGContextRef ctx = [[NSGraphicsContext currentContext] CGContext];
    CGContextSetFillColorWithColor(ctx, [[NSColor redColor] CGColor]);
    CGContextFillRect(ctx, myNewRect);
    // Drawing code here.
}

@end
