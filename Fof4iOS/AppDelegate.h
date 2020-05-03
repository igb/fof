//
//  AppDelegate.h
//  Fof4iOS
//
//  Created by Ian Brown  on 4/27/20.
//  Copyright © 2020 Ian Brown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

