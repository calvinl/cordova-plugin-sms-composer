//
//  SMSComposer.h
//  Helper
//
//  Created by Calvin Lai on 7/17/13.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMessageComposeViewController.h>

@interface SMSComposer : CDVPlugin <MFMessageComposeViewControllerDelegate> {
    
	NSMutableDictionary* callbackIds;    
//    NSString * phoneNumber;
//    NSString * messageText;
    
}

@property (nonatomic, retain) NSMutableDictionary* callbackIds;
//@property (nonatomic, retain) NSString *phoneNumber;
//@property (nonatomic, retain) NSString *messageText;

- (void)showComposer:(CDVInvokedUrlCommand*)command;

@end
