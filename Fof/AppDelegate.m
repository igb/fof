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



-(IBAction)captureImage:(id)sender {
    
    NSSavePanel *imageSavePanel    = [NSSavePanel savePanel];
    [imageSavePanel setAllowedFileTypes:[NSArray arrayWithObjects:@"png", nil]];
    [imageSavePanel setExtensionHidden:NO];
    
    
    int tvarInt    = [imageSavePanel runModal];
    
    if(tvarInt == NSOKButton){
        NSLog(@"doSaveAs we have an OK button");
    } else if(tvarInt == NSCancelButton) {
        NSLog(@"doSaveAs we have a Cancel button");
        return;
    } else {
        NSLog(@"doSaveAs tvarInt not equal 1 or zero = %3d",tvarInt);
        return;
    } // end if
    
    NSString * tvarDirectory = [imageSavePanel directory];
    NSLog(@"doSaveAs directory = %@",tvarDirectory);
    
    NSString * tvarFilename = [imageSavePanel filename];
    NSLog(@"doSaveAs filename = %@",tvarFilename);
    
    
    
    
    
    NSLog(@"snappers");
    NSView *webFrameViewDocView = [[[[NSApplication sharedApplication] windows] objectAtIndex:0] contentView];
    NSRect cacheRect = [webFrameViewDocView bounds];
    NSBitmapImageRep *bitmapRep = [webFrameViewDocView bitmapImageRepForCachingDisplayInRect:cacheRect];
    [webFrameViewDocView cacheDisplayInRect:cacheRect toBitmapImageRep:bitmapRep];
    
    NSData *data = [bitmapRep representationUsingType: NSPNGFileType properties: nil];
    [data writeToURL:[imageSavePanel URL] atomically: NO];
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
    Grid* grid = [[[[NSApplication sharedApplication] windows] objectAtIndex:0] contentView];
    [grid setSize:(grid.size * 2)];
    [grid handleResize];
}

- (IBAction)decreaseGridScale:(id)sender {
    Grid* grid = [[[[NSApplication sharedApplication] windows] objectAtIndex:0] contentView];
    [grid setSize:(grid.size / 2)];
    [grid handleResize];
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

@end
