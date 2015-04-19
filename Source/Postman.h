@import MessageUI.MFMailComposeViewController;

#import "PostmanAttachment.h"

@protocol PostmanDelegate;

@interface Postman : NSObject

@property (nonatomic, weak) id <PostmanDelegate> delegate;

- (void)sendMailTo:(NSString *)to
           subject:(NSString *)subject
              body:(NSString *)body
        attachment:(PostmanAttachment *)attachment
   usingController:(UIViewController *)controller;

+ (void)applySystemStyle;

@end

@protocol PostmanDelegate <NSObject>

@optional
- (void)postmanDidFinished:(Postman *)postman;

@end
