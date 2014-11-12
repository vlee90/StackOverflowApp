//
//  NetworkController.h
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/10/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Question.h"

@interface NetworkController: NSObject

- (void) fetchQuestionBasedOnTag: (NSString *) tag completionBlock:(void(^)(NSMutableArray *questionArray, NSError *error))completionBlockName;

- (NSDictionary *) parseJSON:(NSData *)JSONData;

@end