//
//  WKUIDelegate.m
//  QPicVideo
//
//  Created by jiangsl on 2022/1/27.
//

#import "WKUINavigationDelegate.h"

/*
function getTd(){
    var trList = $("#shuju").find("tr");//获取id=shuju下的所有tr
    for (var i=0;i<trList.length;i++) { //遍历tr
        var tdArr = trList.eq(i).find("td");//循环去处tr下的td
        //var id = tdArr.eq(0).text();//获取id
        var prisonerName = $("#prisonerName1").val();//获取该tr下td中的input框id为 prisonerName1的值
        var prisonerSex = $("#prisonerSex1").val();//获取该tr下td中的input框id为 prisonerSex1的值
        var prisonerZjlxName = $("#prisonerZjlxName1").val();//获取该tr下td中的input框id为 prisonerZjlxName1的值
        var prisonerZjlxCode = $("#prisonerZjlxCode1").val();//获取该tr下td中的input框id为 prisonerZjlxCode1的值
        var prisonerBirthDate = $("#prisonerBirthDate"+id+"").val();//获取该tr下td中的input框id为prisonerBirthDate"+id+"的值
}*/



@implementation WKUINavigationDelegate
static WKUINavigationDelegate *_navigationArgent =nil;
+ (__kindof WKUINavigationDelegate *)sharedInstance{
    static dispatch_once_t onceToken;
    //    __strong static id _manager = nil;
    dispatch_once(&onceToken, ^{
        _navigationArgent = [[WKUINavigationDelegate alloc]init];
    });
    return _navigationArgent;
}
// 使用NSObject的copy方法创建对象，会调用此方法
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _navigationArgent = [super allocWithZone:zone];
    });
    return _navigationArgent;
}
//NSObject的copy方法创建对象，会调用此方法
- (nonnull id)copyWithZone:(struct _NSZone *)zone
{
    return _navigationArgent;
}
//NSObject的mutableCopy方法创建对象，会调用此方法
- (nonnull id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return _navigationArgent;
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
-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    decisionHandler(WKNavigationActionPolicyAllow);
}
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
// [NSTimer timerWithTimeInterval:5.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//
//    }];
    [webView evaluateJavaScript:@"getAOfTable();" completionHandler:^(id _Nullable obj, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"obj====%@",obj);
            NSLog(@"加载完毕!");
//            [timer invalidate];
        }
    }];
}
-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    
}
@end
