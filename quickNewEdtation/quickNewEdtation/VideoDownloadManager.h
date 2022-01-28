//
//  VideoDownloadManager.h
//  QPicVideo
//
//  Created by jiangsl on 2022/1/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoDownloadManager : NSObject
+ (instancetype)sharedInstance;
-(void)videoDownloadManagerUrl:(NSString *)reqUrl;
@end

NS_ASSUME_NONNULL_END
