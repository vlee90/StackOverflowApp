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
@property (nonatomic, weak) AppDelegate *appDelegate;


@end


@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    self.webView = [[WKWebView alloc] init];
    self.view = [self webView];
    
}



@end
