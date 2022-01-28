//
//  WKUINavigationDelegate.h
//  QPicVideo
//
//  Created by jiangsl on 2022/1/27.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKUIPreDelegate : NSObject<WKUIDelegate>
+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
