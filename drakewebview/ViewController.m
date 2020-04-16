//
//  ViewController.m
//  drakewebview
//
//  Created by Zerro Zhao on 2020/4/15.
//  Copyright © 2020 zerrozhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <WKNavigationDelegate>

@property (strong, nonatomic) IBOutlet WKWebView *webview;
@property NSTimer *timer;
@property BOOL timeFinished;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
        //创建网页配置对象
         WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
         
         // 创建设置对象
         WKPreferences *preference = [[WKPreferences alloc]init];
         //最小字体大小 当将javaScriptEnabled属性设置为NO时，可以看到明显的效果
         preference.minimumFontSize = 0;
         //设置是否支持javaScript 默认是支持的
         preference.javaScriptEnabled = YES;
         // 在iOS上默认为NO，表示是否允许不经过用户交互由javaScript自动打开窗口
         preference.javaScriptCanOpenWindowsAutomatically = YES;
         config.preferences = preference;
         
         // 是使用h5的视频播放器在线播放, 还是使用原生播放器全屏播放
         config.allowsInlineMediaPlayback = YES;
         //设置视频是否需要用户手动播放  设置为NO则会允许自动播放
        config.mediaTypesRequiringUserActionForPlayback = YES;
         //设置是否允许画中画技术 在特定设备上有效
         config.allowsPictureInPictureMediaPlayback = YES;
         //设置请求的User-Agent信息中应用程序名称 iOS9后可用
         config.applicationNameForUserAgent = @"ChinaDailyForiPad";
    //      //自定义的WKScriptMessageHandler 是为了解决内存不释放的问题
    //     WeakWebViewScriptMessageDelegate *weakScriptMessageDelegate = [[WeakWebViewScriptMessageDelegate alloc] initWithDelegate:self];
         //这个类主要用来做native与JavaScript的交互管理
         WKUserContentController * wkUController = [[WKUserContentController alloc] init];
         //注册一个name为jsToOcNoPrams的js方法
    //     [wkUController addScriptMessageHandler:weakScriptMessageDelegate  name:@"jsToOcNoPrams"];
    //     [wkUController addScriptMessageHandler:weakScriptMessageDelegate  name:@"jsToOcWithPrams"];
        config.userContentController = wkUController;
        
//        CGRect screenRect = [[UIScreen mainScreen] bounds];
        
//        //初始化
//        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, screenRect.size.width) configuration:config];
           // UI代理
    //    self.webView.UIDelegate = self;
           // 导航代理
    //    self.webView.navigationDelegate = self;
           // 是否允许手势左滑返回上一级, 类似导航控制的左滑返回
//        self.webView.allowsBackForwardNavigationGestures = YES;
    
//    NSString *strScript = @"      let lstdiv = document.getElementsByTagName('div'); \
//    for (let i = 0; i < lstdiv.length; ++i) { \
//      if ( \
//        lstdiv[i].id == lstdiv[i].className && \
//        lstdiv[i].id.indexOf('l') == 0 \
//      ) { \
//        if (lstdiv[i].style.display != 'none') { \
//          console.log(' hide ' + lstdiv[i].id); \
//          lstdiv[i].style.display = 'none'; \
//        } \
//      } \
//    };";
    
//    //用于进行JavaScript注入
//    WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:strScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
//    [config.userContentController addUserScript:wkUScript];
        
                NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.6vdy.org/"]];
    //            [request addValue:[self readCurrentCookieWithDomain:@"http://www.chinadaily.com.cn"] forHTTPHeaderField:@"Cookie"];
    [self.webview loadRequest:request];
    
//    [self.webview evaluateJavaScript:strScript completionHandler:nil];
    
//    UIWindow *showWindow = [[[UIApplication sharedApplication]windows] objectAtIndex:0];
//    [showWindow addSubview:self.webView];
    
//    self.view.subviews
    
    self.webview.UIDelegate = self;
    
    self.timeFinished = NO;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(onTimerJS:)
                                   userInfo:nil
                                    repeats:YES];
    
//    [self.view addSubview:(self.webView)];
}

- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
{
//    NSString *strScript = @"      let lstdiv = document.getElementsByTagName('div'); \
//    for (let i = 0; i < lstdiv.length; ++i) { \
//      if ( \
//        lstdiv[i].id == lstdiv[i].className && \
//        lstdiv[i].id.indexOf('l') == 0 \
//      ) { \
//        if (lstdiv[i].style.display != 'none') { \
//          console.log(' hide ' + lstdiv[i].id); \
//          lstdiv[i].style.display = 'none'; \
//        } \
//      } \
//    } \
//    document.addEventListener('DOMNodeInserted', function () { \
//      let lstdiv = document.getElementsByTagName('div'); \
//      for (let i = 0; i < lstdiv.length; ++i) { \
//        if ( \
//          lstdiv[i].id == lstdiv[i].className && \
//          lstdiv[i].id.indexOf('l') == 0 \
//        ) { \
//          if (lstdiv[i].style.display != 'none') { \
//            console.log(' hide ' + lstdiv[i].id); \
//            lstdiv[i].style.display = 'none'; \
//          } \
//        } \
//      } \
//    });";
    
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
        
        if (self.timer == nil) {
            self.timeFinished = NO;
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(onTimerJS:)
                                           userInfo:nil
                                            repeats:YES];
        }
        
//        [webView evaluateJavaScript:strScript completionHandler:nil];
    }
    
    return nil;
}

- (void)onTimerJS:(NSTimer *)theTimer
{
    NSString *strScript = @" { let isok = false; \
    let lstdiv = document.getElementsByTagName('div'); \
    for (let i = 0; i < lstdiv.length; ++i) { \
      if ( \
        lstdiv[i].id == lstdiv[i].className && \
        lstdiv[i].id.indexOf('l') == 0 \
      ) { \
        if (lstdiv[i].style.display != 'none') { \
          console.log(' hide ' + lstdiv[i].id); \
          lstdiv[i].style.display = 'none'; \
          isok = true; \
        } \
      } \
    } \
    isok;\
    }";
    
//    __block NSString *resultString = nil;
//    __block BOOL finished = NO;

    [self.webview evaluateJavaScript:strScript completionHandler:^(id result, NSError *error) {
        if (error == nil) {
            if (result != nil) {
                NSString *resultString = [NSString stringWithFormat:@"%@", result];
                NSLog(@"evaluateJavaScript result : %@", resultString);
                if ([resultString isEqualToString:@"1"]) {
                    NSLog(@"evaluateJavaScript finished!");
                    self.timeFinished = YES;
                }
            }
        } else {
            NSLog(@"evaluateJavaScript error : %@", error.localizedDescription);
        }
//        finished = YES;
    }];
    
    NSLog(self.timeFinished ? @"Yes" : @"No");
    
    if (self.timeFinished) {
        NSLog(@"end timer");
        
        [self.timer invalidate];
        self.timer = nil;
    }
    
//    [self.webview evaluateJavaScript:strScript completionHandler:nil];
}


@end
