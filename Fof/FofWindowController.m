//
//  FofWindowController.m
//  Fof
//
//  Created by Ian Brown  on 10/8/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import "FofWindowController.h"
#import "Grid.h"


@interface FofWindowController ()

@end

@implementation FofWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
- (void) windowDidEnterFullScreen:(NSNotification *)notification {
    Grid* grid = [[[self window] contentViewController] view];
    [grid handleResize];
}

- (void) windowDidExitFullScreen:(NSNotification *)notification {
    Grid* grid = [[[self window] contentViewController] view];
    [grid handleResize];
}
@end
