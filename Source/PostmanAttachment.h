@import Foundation;

@interface PostmanAttachment : NSObject

@property (nonatomic) NSData *data;
@property (nonatomic, copy) NSString *mimeType;
@property (nonatomic, copy) NSString *fileName;

@end
