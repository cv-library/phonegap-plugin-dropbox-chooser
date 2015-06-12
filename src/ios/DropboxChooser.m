// Copyright (c) 2013 CV-Library Ltd.
// Licensed under the MIT License - see LICENSE file.

#import "DropboxChooser.h"
#import <Cordova/CDV.h>
#import "AppDelegate.h"

@implementation DropboxChooser
    
- (void)launchDropboxChooser:(CDVInvokedUrlCommand*)command
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    UIViewController *topView = appDelegate.viewController;
    __block CDVPluginResult* pluginResult = nil;
    
    // Select link type; defaults to Direct.
    bool usePreviewLink = [[command.arguments objectAtIndex:0] boolValue];
    DBChooserLinkType linkType = usePreviewLink ? DBChooserLinkTypePreview : DBChooserLinkTypeDirect;
    
    [[DBChooser defaultChooser] openChooserForLinkType:linkType
                                        fromViewController:topView completion:^(NSArray *results)
    {
        if ([results count]) {
            // Process results from Chooser
            NSMutableArray *items = [NSMutableArray array];
            
            for (DBChooserResult *result in results) {
                NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
                [dictionary setObject:result.link.absoluteString forKey:@"link"];
                [dictionary setObject:result.name forKey:@"name"];
                [dictionary setObject:[NSNumber numberWithLongLong:result.size] forKey:@"size"];
                [dictionary setObject:result.iconURL.absoluteString forKey:@"iconURL"];
                [items addObject:dictionary];
            }
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:items];
        } else {
            // User canceled the action
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        }
        [self.commandDelegate sendPluginResult: pluginResult callbackId:command.callbackId];
    }];
}
    
@end
