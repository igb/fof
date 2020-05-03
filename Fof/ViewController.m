//
//  ViewController.m
//  Fof
//
//  Created by Ian Brown  on 9/16/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ID: %@", self.identifier);
    // Do any additional setup after loading the view.
    
    CGRect myNewRect = CGRectMake(1100, 100, 150, 150);
    
    CGContextRef ctx = [[NSGraphicsContext currentContext] CGContext];
    CGContextSetFillColorWithColor(ctx, [[NSColor redColor] CGColor]);
    CGContextFillRect(ctx, myNewRect);

}


- (void)viewWillDisappear
{
    AppDelegate* myDelegate = [[NSApplication sharedApplication] delegate];
    [myDelegate setIsWindowOpen:false];
    [myDelegate setMappedPoints:[NSArray array]];
    NSLog(@"window closing...");
}
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
