//
//  AppDelegate.m
//  Fof
//
//  Created by Ian Brown  on 9/16/18.
//  Copyright © 2018 Ian Brown. All rights reserved.
//

#import "AppDelegate.h"
#import "CodeGenerator.h"
#import "JavaCodeGenerator.h"
#import "Grid.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)generateCode:(id)sender {
    NSMenuItem* menuItem = sender;
    NSString* lang = [menuItem title];
    
    if (self.mappedPoints != nil) {
       
        // create the save panel
        NSSavePanel *panel = [NSSavePanel savePanel];
        
        
        
        
        // set a new file name
        [panel setNameFieldStringValue:@"Fof.java"];
        
        // display the panel
        [panel beginSheetModalForWindow:[[NSApplication sharedApplication] keyWindow]  completionHandler:^(NSInteger result) {
            
            if (result == NSModalResponseOK) {
                
                
                
                
                // create a file namaner and grab the save panel's returned URL
                NSURL *saveURL = [panel URL];
                NSString* className = [[[panel nameFieldStringValue] componentsSeparatedByString:@"."] objectAtIndex:0];
                // generate code
                
                JavaCodeGenerator* generator = [[JavaCodeGenerator alloc] init];
                NSString* generatedCode = [generator generate:self.mappedPoints :className];
                
                
                
                [generatedCode writeToURL:saveURL atomically:YES];
                NSLog(@"%@", saveURL);
                
               
            }
        }];
        
        
        
    } else {
        [self alertAboutNoData];
    }
}


-(void)alertAboutNoData {
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:@"Alert"];
    [alert setInformativeText:@"Nothing to export! \r Try drawing something!"];
    [alert setAlertStyle:NSInformationalAlertStyle];
    [alert beginSheetModalForWindow:[[NSApplication sharedApplication] keyWindow] completionHandler:nil];
    
}

- (IBAction)increaseGridScale:(id)sender {
    Grid* grid = [[[[NSApplication sharedApplication] windows] objectAtIndex:0] contentView];
    [grid setSize:(grid.size * 2)];
    [grid handleResize];
}

- (IBAction)decreaseGridScale:(id)sender {
    Grid* grid = [[[[NSApplication sharedApplication] windows] objectAtIndex:0] contentView];
    [grid setSize:(grid.size / 2)];
    [grid handleResize];
}
@end
