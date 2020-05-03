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
#import "ScalaCodeGenerator.h"
#import "JavaScriptCodeGenerator.h"
#import "PythonCodeGenerator.h"
#import "Grid.h"
#import "ViewController.h"
#import "FofWindowController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.isWindowOpen = true;
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
        
        FofCodeGenerator* generator = nil;
        
        if ([lang isEqualToString:@"Java"]) {
            generator = [[JavaCodeGenerator alloc] init];
            [panel setNameFieldStringValue:@"Fof.java"];
        } else if ([lang isEqualToString:@"Scala"]) {
            generator = [[ScalaCodeGenerator alloc] init];
            [panel setNameFieldStringValue:@"Fof.scala"];
        } else if ([lang isEqualToString:@"JavaScript"]) {
            generator = [[JavaScriptCodeGenerator alloc] init];
            [panel setNameFieldStringValue:@"Fof.js"];
        } else if ([lang isEqualToString:@"Python"]) {
            generator = [[PythonCodeGenerator alloc] init];
            [panel setNameFieldStringValue:@"Fof.py"];
        }
        
        
        
     
        // display the panel
        [panel beginSheetModalForWindow:[[NSApplication sharedApplication] keyWindow]  completionHandler:^(NSInteger result) {
            
            if (result == NSModalResponseOK) {
                
                
                
                
                // create a file namaner and grab the save panel's returned URL
                NSURL *saveURL = [panel URL];
                NSString* className = [[[panel nameFieldStringValue] componentsSeparatedByString:@"."] objectAtIndex:0];
                
                // generate code
                
               
                
                NSString* generatedCode = [generator generate:self.mappedPoints :className];
                
                
                
                [generatedCode writeToURL:saveURL atomically:YES];
                NSLog(@"%@", saveURL);
                
               
            }
        }];
        
        
        
    } else {
        [self alertAboutNoData];
    }
}

-(NSWindow*) getCurrentActiveWindow {
    NSArray* windows = [[NSApplication sharedApplication] windows];
    for (int i=0; i < [windows count]; i++) {
        NSWindow* window = [windows objectAtIndex:i];
        if ([window isVisible]) {
            return window;
        }
    }
    return nil;
}

-(IBAction)captureImage:(id)sender {
    
    NSSavePanel *imageSavePanel    = [NSSavePanel savePanel];
    [imageSavePanel setAllowedFileTypes:[NSArray arrayWithObjects:@"png", nil]];
    [imageSavePanel setExtensionHidden:NO];
    [imageSavePanel setNameFieldStringValue:@"snapshot.png"];
    
    
    long tvarInt    = [imageSavePanel runModal];
    
    if(tvarInt == NSModalResponseOK){
        NSLog(@"doSaveAs we have an OK button");
    } else if(tvarInt == NSModalResponseCancel) {
        NSLog(@"doSaveAs we have a Cancel button");
        return;
    } else {
        NSLog(@"doSaveAs tvarInt not equal 1 or zero = %3ld",tvarInt);
        return;
    } // end if
    
    NSURL * tvarDirectory = [imageSavePanel directoryURL];
    NSLog(@"doSaveAs directory = %@",tvarDirectory);
    
    NSURL * tvarFilename = [imageSavePanel URL];
    NSLog(@"doSaveAs filename = %@",tvarFilename);
    
    
    
    
    
    NSLog(@"snappers");
    NSView *webFrameViewDocView = [[self getCurrentActiveWindow] contentView];
    NSRect cacheRect = [webFrameViewDocView bounds];
    NSBitmapImageRep *bitmapRep = [webFrameViewDocView bitmapImageRepForCachingDisplayInRect:cacheRect];
    [webFrameViewDocView cacheDisplayInRect:cacheRect toBitmapImageRep:bitmapRep];
    
    NSData *data = [bitmapRep representationUsingType: NSPNGFileType properties: nil];
    [data writeToURL:[imageSavePanel URL] atomically: YES];
    NSLog(@"done %@", webFrameViewDocView);
    
    
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
    Grid* grid = [[self getCurrentActiveWindow] contentView];
    [grid setSize:(grid.size * 2)];
    [grid handleResize];
}

- (IBAction)decreaseGridScale:(id)sender {
    Grid* grid =  [[self getCurrentActiveWindow]  contentView];
    
    if (grid.size == 1.250000) { //adding this check because at a certain scale the UI hangs as it tries to render impossibly small ticks
        // do nothing
        NSLog(@"too small!");
    } else {
        [grid setSize:(grid.size / 2)];
        [grid handleResize];
    }
}

-(IBAction)showTickNumbers:(id)sender {
    Grid* grid = [[[[NSApplication sharedApplication] windows] objectAtIndex:0] contentView];
    [grid setShowXnumbers:!grid.showXnumbers];
    [grid setShowYnumbers:!grid.showYnumbers];
    if (grid.showXnumbers && grid.showYnumbers) {
        [sender setState:NSControlStateValueOn];
    } else {
        [sender setState:NSControlStateValueOff];
    }
    [grid handleResize];

}

-(IBAction)newDocument:(id)sender {
    
    
    NSArray* windows =  [[NSApplication sharedApplication] windows];
    NSLog(@"Window count %d", [windows count]);
   
    int i = 0;
    BOOL isActiveSession = NO;
    
    
    for (int i =0; i < [windows count]; i++) {
        NSWindow* window = [windows objectAtIndex:i];
        if ([window isVisible]) {
            isActiveSession = YES;
        }
    }
    
    if (!isActiveSession) {
        NSStoryboard *storyboard = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
        FofWindowController* fofController = [storyboard instantiateControllerWithIdentifier:@"BLARG"];
    
        NSLog( [[fofController window] isVisible] ? @"blarg visible" : @"blarg inviz");
        [[fofController window] setIsVisible:1];
    } else {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:@"Alert"];
        [alert setInformativeText:@"Only one session/window is allowed at a time. \r Close the current window if you want to open a new window."];
        [alert setAlertStyle:NSInformationalAlertStyle];
        [alert beginSheetModalForWindow:[[NSApplication sharedApplication] keyWindow] completionHandler:nil];
    }
}
        
        
        
        

        
    
    



@end
