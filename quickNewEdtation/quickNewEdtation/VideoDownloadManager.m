//
//  VideoDownloadManager.m
//  QPicVideo
//
//  Created by jiangsl on 2022/1/28.
//

#import "VideoDownloadManager.h"

@implementation VideoDownloadManager

static VideoDownloadManager *_manager =nil;
+ (__kindof VideoDownloadManager *)sharedInstance{
    static dispatch_once_t onceToken;
    //    __strong static id _manager = nil;
    dispatch_once(&onceToken, ^{
        _manager = [[VideoDownloadManager alloc]init];
    });
    return _manager;
}
// 使用NSObject的copy方法创建对象，会调用此方法
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [super allocWithZone:zone];
    });
    return _manager;
}
//NSObject的copy方法创建对象，会调用此方法
- (nonnull id)copyWithZone:(struct _NSZone *)zone
{
    return _manager;
}
//NSObject的mutableCopy方法创建对象，会调用此方法
- (nonnull id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return _manager;
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
-(void)videoDownloadManagerUrl:(NSString *)reqUrl{
    [self loadData:reqUrl];
}
- (void)loadData:(NSString *)reqUrl
{
    // 1. 创建url
    NSString *urlString = reqUrl;
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:urlString];
    // 2. 创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 3. 创建会话 (使用单例初始化, 启动任务)
    NSURLSession *session = [NSURLSession sharedSession];
    // 会话创建任务
    NSURLSessionDownloadTask *dataTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
//            NSString *file =@"/Users/mac/Desktop/video";
            NSString *file =[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:response.suggestedFilename];
            NSLog(@"----%@",file);
            NSFileManager *mgr = [NSFileManager defaultManager];
            [mgr moveItemAtURL:location toURL:[NSURL fileURLWithPath:file] error: nil];
        }else{
            NSLog(@"error is %@", error.localizedDescription);
        }
    }];
    // 恢复线程, 启动任务
    [dataTask resume];
}



@end
