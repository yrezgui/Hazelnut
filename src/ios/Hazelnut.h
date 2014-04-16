

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>
#import <QuickLook/QuickLook.h>

@interface Hazelnut : CDVPlugin <QLPreviewControllerDelegate, QLPreviewControllerDataSource, QLPreviewItem>

@property (strong, nonatomic) NSURL* fileUrl;
@property (readonly) NSURL* previewItemURL;

@property (strong, nonatomic) NSString* filename;
@property (readonly) NSString* previewItemTitle;

@end