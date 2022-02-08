//
//  ViewController.m
//  QPicVideo
//
//  Created by jiangsl on 2022/1/27.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "WKScriptMessageHandler.h"
#import "WKUIPreDelegate.h"
#import "WKUINavigationDelegate.h"
#import "Regx.h"
#import "VideoDownloadManager.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//#define Space
@interface ViewController ()
@property(nonatomic,strong)WKWebView *webView;
@property(nonatomic,strong)WKWebViewConfiguration *conf;
@property(nonatomic,strong)WKUserContentController *userContent;
@property(nonatomic,strong)WKPreferences *prefs;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    Regx *rg = [[Regx alloc]init];
////    [rg match:@"<a href='xxx'><span>"];
//    [rg match:@""];
//    return;
    
//    VideoDownloadManager *mag = [VideoDownloadManager sharedInstance];
//    [mag videoDownloadManagerUrl:@"http://mpvideo.qpic.cn/0b78cyaacaaa2aajfilx2fqvafwdaelaaaia.f10003.mp4?dis_k=23674c7b0c690683be91b8764aef9c4d&dis_t=1643353774&vid=wxv_2107794399270092802&format_id=10003&support_redirect=0&mmversion=false"];
    
//    return;
    
    /* 加载服务器url的方法*/
    NSString *url = @"https://mp.weixin.qq.com/s/91qi7Q2iEviHK_42K6Oj4A";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
}

-(WKWebView *)webView{
    if (!_webView) {
        //初始化
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 100) configuration:[self conf]];
        // UI代理
        _webView.UIDelegate = [WKUIPreDelegate sharedInstance];;
        // 导航代理
        _webView.navigationDelegate = [WKUINavigationDelegate sharedInstance];
        // 是否允许手势左滑返回上一级, 类似导航控制的左滑返回
        _webView.allowsBackForwardNavigationGestures = YES;
    }
    return _webView;
    
    {
        //页面后退
        //[_webView goBack];
        //页面前进
        // [_webView goForward];
        //刷新当前页面
        //[_webView reload];
        //可返回的页面列表, 存储已打开过的网页
        //WKBackForwardList * backForwardList = [_webView backForwardList];
    }
}

-(WKWebViewConfiguration*)conf{
    if (!_conf) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        config.selectionGranularity = WKSelectionGranularityDynamic;
        config.allowsInlineMediaPlayback = YES;
        config.preferences = [self prefs];
        // 将UserConttentController设置到配置文件
        config.userContentController = [self userContent];
        _conf = config;
    }
    return _conf;
}

-(WKUserContentController*)userContent{
    if (!_userContent) {
        // 创建UserContentController（提供JavaScript向webView发送消息的方法）
        WKScriptMessageHandler* userContent = [[WKScriptMessageHandler alloc] init];
        _userContent = userContent;
    }
    return _userContent;
}

-(WKPreferences*)prefs{
    if (!_prefs) {
        WKPreferences *preferences = [WKPreferences new];
        //是否支持JavaScript
        preferences.javaScriptEnabled = YES;
        //不通过用户交互，是否可以打开窗口
        preferences.javaScriptCanOpenWindowsAutomatically = YES;
        _prefs = preferences;
    }
    return _prefs;
}

@end
