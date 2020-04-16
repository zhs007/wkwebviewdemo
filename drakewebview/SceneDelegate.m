//
//  SceneDelegate.m
//  drakewebview
//
//  Created by Zerro Zhao on 2020/4/15.
//  Copyright © 2020 zerrozhao. All rights reserved.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    
//    //创建网页配置对象
//     WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
//     
//     // 创建设置对象
//     WKPreferences *preference = [[WKPreferences alloc]init];
//     //最小字体大小 当将javaScriptEnabled属性设置为NO时，可以看到明显的效果
//     preference.minimumFontSize = 0;
//     //设置是否支持javaScript 默认是支持的
//     preference.javaScriptEnabled = YES;
//     // 在iOS上默认为NO，表示是否允许不经过用户交互由javaScript自动打开窗口
//     preference.javaScriptCanOpenWindowsAutomatically = YES;
//     config.preferences = preference;
//     
//     // 是使用h5的视频播放器在线播放, 还是使用原生播放器全屏播放
//     config.allowsInlineMediaPlayback = YES;
//     //设置视频是否需要用户手动播放  设置为NO则会允许自动播放
//    config.mediaTypesRequiringUserActionForPlayback = YES;
//     //设置是否允许画中画技术 在特定设备上有效
//     config.allowsPictureInPictureMediaPlayback = YES;
//     //设置请求的User-Agent信息中应用程序名称 iOS9后可用
//     config.applicationNameForUserAgent = @"ChinaDailyForiPad";
////      //自定义的WKScriptMessageHandler 是为了解决内存不释放的问题
////     WeakWebViewScriptMessageDelegate *weakScriptMessageDelegate = [[WeakWebViewScriptMessageDelegate alloc] initWithDelegate:self];
//     //这个类主要用来做native与JavaScript的交互管理
//     WKUserContentController * wkUController = [[WKUserContentController alloc] init];
//     //注册一个name为jsToOcNoPrams的js方法
////     [wkUController addScriptMessageHandler:weakScriptMessageDelegate  name:@"jsToOcNoPrams"];
////     [wkUController addScriptMessageHandler:weakScriptMessageDelegate  name:@"jsToOcWithPrams"];
//    config.userContentController = wkUController;
//    
//    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    
//    //初始化
//    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, screenRect.size.width) configuration:config];
//       // UI代理
////    self.webView.UIDelegate = self;
//       // 导航代理
////    self.webView.navigationDelegate = self;
//       // 是否允许手势左滑返回上一级, 类似导航控制的左滑返回
//    self.webView.allowsBackForwardNavigationGestures = YES;
//    
//            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.6vdy.org/"]];
////            [request addValue:[self readCurrentCookieWithDomain:@"http://www.chinadaily.com.cn"] forHTTPHeaderField:@"Cookie"];
//            [self.webView loadRequest:request];
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
