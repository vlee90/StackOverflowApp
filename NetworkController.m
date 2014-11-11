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
        self.configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration: self.configuration];
        
    }
    return self;
}

- (void) fetchQuestionBasedOnTag: (NSString *) tag completionBlock:(void(^)(NSDictionary *data, NSError *error))completionBlockName {
    NSMutableString *urlString = [NSMutableString stringWithFormat: @"https://stackoverflow.com/2.2/questions?order=desc&sort=activity&tagged=%@&site=stackoverflow", tag];
    NSURL *url = [[NSURL alloc] initWithString: urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: url];
    request.HTTPMethod = @"GET";
    NSURLSessionDataTask *dataTask = [[self session] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        if ([httpResponse isKindOfClass:[NSHTTPURLResponse class]]) {
            NSLog(@"Success");
            
            completionBlockName(nil, nil);
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