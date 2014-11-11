//
//  NetworkController.m
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/10/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import "NetworkController.h"

@implementation NetworkController

- (void) fetchQuestionBasedOnTag: (NSString *) tag {
    [self session]
    NSMutableString *urlString = [NSMutableString stringWithFormat: @"https://stackoverflow.com/2.2/questions?order=desc&sort=activity&tagged=%@&site=stackoverflow", tag];
    NSURL *url = [[NSURL alloc] initWithString: urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: url];
    request.HTTPMethod = @"GET";
    NSURLSessionDataTask *dataTask = [[self session] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (response != nil) {
            NSLog(@"%@", response);
            completionHandler();
        }
        else {
            NSLog(@"ERROR");
        }
    }];
    [dataTask resume];
}

@end