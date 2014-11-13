//
//  WebViewController.m
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/12/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (nonatomic, strong) WKWebView *webView;


@end


@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[WKWebView alloc] init];
    self.view = [self webView];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: self.url];
    [[self webView] loadRequest: request];
    
}



@end
