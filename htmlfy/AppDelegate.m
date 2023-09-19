//
//  AppDelegate.m
//  htmlfy
//
//  Created by Cocoa on 19/09/2023.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag {
    if (!flag) {
        [[[[NSApplication sharedApplication] windows] firstObject] makeKeyAndOrderFront:nil];
    }
    return YES;
}

@end
