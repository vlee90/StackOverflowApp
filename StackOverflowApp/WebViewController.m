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

@property (nonatomic, strong) NSString *oAuthURL;
@property (nonatomic, strong) NSString *oAuthDomain;
@property (nonatomic, strong) NSString *clientID;
@property (nonatomic, strong) NSString *urlString;

@end


@implementation WebViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.oAuthDomain = @"https://stackexchange.com/oauth/login_success";
        self.oAuthURL = @"https://stackexchange.com/oauth/dialog";
        self.clientID = @"3856";
        self.urlString = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@", self.oAuthURL, self.clientID, self.oAuthDomain];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[WKWebView alloc] init];
    self.webView.navigationDelegate = self;
    self.view = [self webView];
    NSURL *url = [[NSURL alloc] initWithString:self.urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: url];
    [[self webView] loadRequest: request];
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    // Allows navigations to continue
    decisionHandler(WKNavigationActionPolicyAllow);
    
    // Stringy the url from the request.
    NSString *stringURL = [[[navigationAction request] URL] absoluteString];
    if ([stringURL containsString:@"access_token"]) {
        NSArray *firstPart = [stringURL componentsSeparatedByString:@"="];
        NSArray *secondPart = [firstPart[1] componentsSeparatedByString:@"&"];
        NSString *token = secondPart[0];
        [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"token"];
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        NetworkController *networkController = [appDelegate networkController];
        networkController.token = token;
        [self dismissViewControllerAnimated:true completion:nil];
    }
    
    
    
}



@end
