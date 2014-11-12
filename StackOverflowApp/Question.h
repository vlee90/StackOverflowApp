//
//  Question.h
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/10/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property NSInteger ID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSURL *link;

- (instancetype)initWithDictionary: (NSDictionary *)dict;


@end
