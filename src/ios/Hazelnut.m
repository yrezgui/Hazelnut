
#import "Hazelnut.h"

@implementation Hazelnut

- (void)Open:(CDVInvokedUrlCommand*)command;
{
    CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];

    __weak Hazelnut* weakSelf = self;
    
    dispatch_queue_t asyncQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(asyncQueue, ^{
        
        NSDictionary* dict  = [command.arguments objectAtIndex:0];
        
        NSString* fullpath  = dict[@"uri"];
        NSString* filename  = dict[@"filename"];

        NSURL* tmpFileUri   = [[NSURL alloc] initFileURLWithPath:fullpath];

        weakSelf.fileUri    = tmpFileUri;
        weakSelf.filename   = filename;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            QLPreviewController* cntr = [[QLPreviewController alloc] init];
            cntr.delegate = weakSelf;
            cntr.dataSource = weakSelf;
            
            UIViewController* root = [[[UIApplication sharedApplication] keyWindow] rootViewController];
            [root presentViewController:cntr animated:YES completion:nil];
        });
        
        
        [weakSelf.commandDelegate sendPluginResult:commandResult callbackId:command.callbackId];
    });
}

#pragma mark - QLPreviewController data source

- (NSInteger) numberOfPreviewItemsInPreviewController: (QLPreviewController *) controller
{
    return 1;
}

- (id <QLPreviewItem>) previewController: (QLPreviewController *) controller previewItemAtIndex: (NSInteger) index
{
    return self;
}

#pragma mark - QLPreviewItem protocol

- (NSURL*)previewItemURL
{
    return self.fileUri;
}

- (NSString*)previewItemTitle
{
    return self.filename;
}

@end
