//
//  NetworkController.m
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/10/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import "NetworkController.h"

@interface NetworkController()

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionConfiguration *configuration;

@end

@implementation NetworkController


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration: self.configuration];
        
    }
    return self;
}

- (void) fetchQuestionBasedOnTag: (NSString *) tag completionBlock:(void(^)(NSDictionary *data, NSError *error))completionBlockName {
    NSMutableString *urlString = [NSMutableString stringWithFormat: @"https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged=%@&site=stackoverflow", tag];
    NSURL *url = [[NSURL alloc] initWithString: urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: url];
    request.HTTPMethod = @"GET";
    NSURLSessionDataTask *dataTask = [[self session] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        if ([httpResponse isKindOfClass:[NSHTTPURLResponse class]]) {
            NSInteger code = [httpResponse statusCode];
            if (code <= 299 && code >= 200) {
                NSLog(@"Success");
                completionBlockName(nil, nil);
            }
            else if (code == 400) {
                NSLog(@"%ld: Bad Request - Syntax error likely", code);
            }
            else if (code == 401) {
                NSLog(@"%ld: Unauthorized - Authorization either not provided or incorrect", code);
            }
            else if (code == 403) {
                NSLog(@"%ld: Forbidden - Request valid, but server will not respond", code);
            }
            else if (code == 404) {
                NSLog(@"%ld: Not Found - Resource not found", code);
            }
            else if (code == 429) {
                NSLog(@"%ld: Too many requests - Rate limited", code);
            }
            else if (code <= 599 && code >= 500) {
                NSLog(@"%ld: Server failed", code);
            }
        }
        else {
            NSLog(@"%@", [error description]);
        }
    }];
    [dataTask resume];
}

- (NSDictionary *) parseJSON:(NSData *)JSONData {
    NSError *error;
    NSDictionary *dictionary =[NSJSONSerialization JSONObjectWithData:JSONData options: NSJSONReadingMutableContainers error:&error];
    if ([dictionary isKindOfClass: [NSDictionary class]]) {
        return dictionary;
    }
    else {
        return nil;
    }
}

@end