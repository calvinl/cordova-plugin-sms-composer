//
//  SMSComposer.m
//  Helper
//
//  Created by Calvin Lai on 7/17/13.
//
//

#import "SMSComposer.h"
#import <Cordova/CDVViewController.h>
#import <Cordova/CDVDebug.h>


@implementation SMSComposer

@synthesize callbackIds = _callbackIds;

- (NSMutableDictionary*)callbackIds {
    if(_callbackIds == nil) {
      _callbackIds = [[NSMutableDictionary alloc] init];
    }
    return _callbackIds;
}

- (void)showComposer:(CDVInvokedUrlCommand*)command {
    NSLog(@"showComposer:%@", command.arguments);

    [self.callbackIds setValue:command.callbackId forKey:@"showComposer"];

    NSDictionary *options = [command.arguments objectAtIndex:0];
    NSArray *phones = [options objectForKey:@"phones"];
    NSString *body = [options objectForKey:@"body"];

    MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];

    picker.messageComposeDelegate = self;
    picker.recipients = phones;
    picker.body = body;

    [self.viewController presentModalViewController:picker animated:YES];
    [picker release];

}


#pragma mark - MFMessageComposeViewControllerDelegate

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {

    NSString *status = @"failed";
    if (result == MessageComposeResultCancelled) {
        NSLog(@"Message cancelled");
        status = @"cancelled";
    } else if (result == MessageComposeResultSent) {
        NSLog(@"Message sent");
        status = @"sent";
    } else {
        NSLog(@"Message failed");
        status = @"failed";
    }

    NSDictionary *results = [NSDictionary dictionaryWithObject: status forKey: @"result"];

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary: results];
    [self writeJavascript:[pluginResult toSuccessCallbackString:[self.callbackIds valueForKey:@"showComposer"]]];
    [self.viewController dismissModalViewControllerAnimated:YES];

}


@end

