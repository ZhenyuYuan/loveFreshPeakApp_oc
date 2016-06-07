//
//  AJWebViewController.m
//  loveFreshPeak
//
//  Created by ArJun on 16/6/8.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJWebViewController.h"

@interface AJWebViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) AJActivity *activity;
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation AJWebViewController

- (instancetype)initWithActivity:(AJActivity *)activity
{
    self = [super init];
    self.activity = activity;
    return self;
}

- (void)viewDidLoad{
    self.title = self.activity.name;
    self.webView = [[UIWebView alloc]init];
    [self.view addSubview:self.webView];
    [self.webView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

    NSString *urlStr = [NSString stringWithFormat:@"http://m.beequick.cn/show/active?id=%@&locationHash=dd89f1dQaciSSWjOXvfrV0V7EqgKmdGLU0/YJceSpQ5LLiEVS8oMovWAQ&zchtid=5624&location_time=1458523110&cityid=2&hide_cart=0&show_reload=1&activitygroup=%@&bigids=%@&__v=ios4.13",self.activity.aid,self.activity.ext_params.activitygroup,self.activity.ext_params.bigids];
    NSLog(@"%@",urlStr);
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"%@",error);
}


@end
