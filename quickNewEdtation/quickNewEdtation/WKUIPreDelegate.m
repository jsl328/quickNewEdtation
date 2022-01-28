//
//  WKUINavigationDelegate.m
//  QPicVideo
//
//  Created by jiangsl on 2022/1/27.
//

#import "WKUIPreDelegate.h"

@implementation WKUIPreDelegate

static WKUIPreDelegate *_WKUIDelegate =nil;
+ (__kindof WKUIPreDelegate *)sharedInstance{
    static dispatch_once_t onceToken;
    //    __strong static id _manager = nil;
    dispatch_once(&onceToken, ^{
        _WKUIDelegate = [[WKUIPreDelegate alloc]init];
    });
    return _WKUIDelegate;
}
// 使用NSObject的copy方法创建对象，会调用此方法
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _WKUIDelegate = [super allocWithZone:zone];
    });
    return _WKUIDelegate;
}
//NSObject的copy方法创建对象，会调用此方法
- (nonnull id)copyWithZone:(struct _NSZone *)zone
{
    return _WKUIDelegate;
}
//NSObject的mutableCopy方法创建对象，会调用此方法
- (nonnull id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return _WKUIDelegate;
}

//alloc init方法会调用此方法
#pragma mark - 初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

//-(void)webView:(WKWebView *)webView contextMenuConfigurationForElement:(WKContextMenuElementInfo *)elementInfo completionHandler:(void (^)(UIContextMenuConfiguration * _Nullable))completionHandler{
//    completionHandler()
//}
- (void)webViewDidClose:(WKWebView *)webView
{
    
}

-(void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    NSLog(@"%@",message);
    completionHandler();
}
-(void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{
    completionHandler(YES);
}
@end
