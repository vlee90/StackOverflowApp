//
//  NetworkController.h
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/10/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Question.h"

@interface NetworkController: NSObject

@property (nonatomic, strong) NSString *token;

- (void) fetchQuestionBasedOnTag: (NSString *) tag completionBlock:(void(^)(NSMutableArray *questionArray, NSError *error))completionBlockName;

- (void) requestOAuth: (NSString *) url;

- (NSDictionary *) parseJSON:(NSData *)JSONData;

@end