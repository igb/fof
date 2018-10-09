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
    NSLog(@"%@", sender);
    if (self.mappedPoints != nil) {
        JavaCodeGenerator* generator = [[JavaCodeGenerator alloc] init];
        NSString* generatedCode = [generator generate:self.mappedPoints];
        
        // create the save panel
        NSSavePanel *panel = [NSSavePanel savePanel];
        
        // set a new file name
        [panel setNameFieldStringValue:@"Fof.java"];
        
        // display the panel
        [panel beginSheetModalForWindow:[[NSApplication sharedApplication] keyWindow]  completionHandler:^(NSInteger result) {
            
            if (result == NSModalResponseOK) {
                
                // create a file namaner and grab the save panel's returned URL
                NSURL *saveURL = [panel URL];
                [generatedCode writeToURL:saveURL atomically:YES];
                NSLog(@"%@", saveURL);
                
                // then copy a previous file to the new location
               // [manager copyItemAtURL:self.myURL toURL:saveURL error:nil];
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



@end
