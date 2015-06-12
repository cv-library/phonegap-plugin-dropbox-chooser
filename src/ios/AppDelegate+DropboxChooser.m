// Copyright (c) 2013 CV-Library Ltd.
// Licensed under the MIT License - see LICENSE file.

#import "AppDelegate+DropboxChooser.h"
#import "DBChooser.h"
#import <objc/runtime.h>

@implementation AppDelegate (DropboxChooser)

+ (void)load
{
    Method original, swizzled;

    original = class_getInstanceMethod(self, @selector(application:openURL:sourceApplication:annotation:));
    swizzled = class_getInstanceMethod(self, @selector(swizzled_application:openURL:sourceApplication:annotation:));
    method_exchangeImplementations(original, swizzled);
}

- (BOOL)swizzled_application:(UIApplication*)application openURL:(NSURL*)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation
{
    if ([[DBChooser defaultChooser] handleOpenURL:url]) {
        // This was a Chooser response and handleOpenURL automatically ran the
        // completion block
        return YES;
    }

    return [self swizzled_application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}
@end
