// Copyright (c) 2013 CV-Library Ltd.
// Licensed under the MIT License - see LICENSE file.

#import "AppDelegate.h"

@interface AppDelegate (DropboxChooser)

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url sourceApplication:(NSString *)source annotation:(id)annotation;

@end
