#import <UIKit/UIKit.h>

#import "PanoramaViewController.h"
#import "GoogleVRPlayer.h"
#import "GVRPanoramaView.h"

@interface PanoramaViewController () <GVRWidgetViewDelegate>
@property (unsafe_unretained, nonatomic) IBOutlet GVRPanoramaView *panoramaView;
@end

@implementation PanoramaViewController

- (instancetype)init {
    self = [super initWithNibName:nil bundle:nil];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _panoramaView.delegate = self;
    _panoramaView.enableFullscreenButton = YES;
    _panoramaView.enableCardboardButton = YES;
    _panoramaView.enableTouchTracking = YES;
    _panoramaView.displayMode = kGVRWidgetDisplayModeFullscreen;
    
    [_panoramaView loadImage:[UIImage imageNamed:@"andes.jpg"]
                   ofType:kGVRPanoramaImageTypeStereoOverUnder];

}

#pragma mark - GVRWidgetViewDelegate

- (void)widgetView:(GVRWidgetView *)widgetView didLoadContent:(id)content {
    NSLog(@"Finished loading panorama");
}

- (void)widgetView:(GVRWidgetView *)widgetView
didChangeDisplayMode:(GVRWidgetDisplayMode)displayMode{
    if (displayMode != kGVRWidgetDisplayModeFullscreen && displayMode != kGVRWidgetDisplayModeFullscreenVR){
        // Full screen closed, closing the view
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)widgetView:(GVRWidgetView *)widgetView
didFailToLoadContent:(id)content
  withErrorMessage:(NSString *)errorMessage {
    
    NSLog(@"Failed to load panorama: %@", errorMessage);
}

@end
