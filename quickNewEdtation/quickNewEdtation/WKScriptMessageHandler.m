//
//  WKUserContentControllerM.m
//  QPicVideo
//
//  Created by jiangsl on 2022/1/27.
//

#import "WKScriptMessageHandler.h"

@implementation WKScriptMessageHandler
-(instancetype)init{
    if (self = [super init]) {
        // 添加消息处理，注意：self指代的对象需要遵守WKScriptMessageHandler协议，结束时需要移除
        [self addScriptMessageHandler:self name:@"NativeMethod"];
        /// 注入到configuration配置内
        [self addUserScript:[self customUserScript]];
    }
    return self;
}
-(WKUserScript*)customUserScript{
    WKUserScript *script = [[WKUserScript alloc]initWithSource:[self hrefjs] injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:YES];
    return script;
}
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    /// 创建WKUserScript
    //NSLog(@"-----%@",message.body);
}
-(NSString *)hrefjs{
    /// 获取本地JS文件路径
    NSString *ahref = [[NSBundle mainBundle] pathForResource:@"ahref" ofType:@"js"];
   /// 转换为NSData数据
    NSData *ahrefData=[NSData dataWithContentsOfFile:ahref];
   //转换成NSData字符串
    NSString *ahrefString =  [[NSString alloc]initWithData:ahrefData encoding:NSUTF8StringEncoding];
    // 注入到configuration配置内
//    NSLog(@"ahrefString----%@",ahrefString);
    return ahrefString;
}
@end
