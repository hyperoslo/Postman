#import "Postman.h"

@interface Postman () <MFMailComposeViewControllerDelegate>

@property (nonatomic, weak) UIViewController *parentController;

@end

@implementation Postman

- (void)sendMailTo:(NSString *)to
           subject:(NSString *)subject
              body:(NSString *)body
        attachment:(PostmanAttachment *)attachment
   usingController:(UIViewController *)controller {

    if (![MFMailComposeViewController canSendMail]) {
        [self launchMailAppOnDevice];
        return;
    }

    self.parentController = controller;

    MFMailComposeViewController *mailController = [MFMailComposeViewController new];
    mailController.mailComposeDelegate = self;
    [mailController setSubject:subject];
    [mailController setMessageBody:body isHTML:NO];

    if (to) {
        [mailController setToRecipients:@[to]];
    }

    if (attachment) {
        [mailController addAttachmentData:attachment.data
                                 mimeType:attachment.mimeType
                                 fileName:attachment.fileName];
    }

    if (mailController) {
        [controller presentViewController:mailController
                                 animated:YES
                               completion:nil];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error {
    [self.parentController dismissViewControllerAnimated:YES completion:^{
        if ([self.delegate respondsToSelector:@selector(postmanDidFinished:)]) {
            [self.delegate postmanDidFinished:self];
        }
    }];
}

- (void)applySystemStyle {
    if (![MFMailComposeViewController canSendMail]) return;

    UIColor *defaultColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
    [UINavigationBar appearance].barTintColor = [UIColor whiteColor];
    [UINavigationBar appearance].tintColor = defaultColor;

    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName : defaultColor,
                                                         NSFontAttributeName            : [UIFont boldSystemFontOfSize:17.0f]};

    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : defaultColor,
                                                           NSFontAttributeName            : [UIFont boldSystemFontOfSize:17.0f]}
                                                forState:UIControlStateNormal];
}

- (void)launchMailAppOnDevice {
    NSString *recipients = @"mailto:ola@hyper.no?subject=Hei fra Hyper!";
    NSString *body = @"&body=Let's configure your email to send the report!";

    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

@end
