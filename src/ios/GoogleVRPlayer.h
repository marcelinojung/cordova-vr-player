#import <Cordova/CDVPlugin.h>
#import "VideoPlayerViewController.h"
#import "PanoramaViewController.h"

@interface GoogleVRPlayer : CDVPlugin {
}

// The hooks for our plugin commands
- (void)playVideo:(CDVInvokedUrlCommand *)command;
- (void)playImage:(CDVInvokedUrlCommand *)command;

@property (readwrite, assign) BOOL hasPendingOperation;

@end
