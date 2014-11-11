//
//  NetworkController.h
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/10/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NetworkController: NSObject

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionConfiguration *configuration;

- (void) fetchQuestionBasedOnTag: (NSString *) tag;

@end