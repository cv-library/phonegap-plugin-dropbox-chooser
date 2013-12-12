// Copyright (c) 2013 CV-Library Ltd.
// Licensed under the MIT License - see LICENSE file.

#import "AppDelegate+DropboxChooser.h"
#import "DBChooser.h"

@implementation AppDelegate (DropboxChooser)

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url sourceApplication:(NSString *)source annotation:(id)annotation
    {
        if ([[DBChooser defaultChooser] handleOpenURL:url]) {
            // This was a Chooser response and handleOpenURL automatically ran the
            // completion block
            return YES;
        }

        return NO;
    }
@end
