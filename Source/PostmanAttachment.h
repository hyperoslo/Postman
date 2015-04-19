@import Foundation;

@interface PostmanAttachment : NSObject

@property (nonatomic, strong) NSData *data;
@property (nonatomic, strong) NSString *mimeType;
@property (nonatomic, strong) NSString *fileName;

@end
