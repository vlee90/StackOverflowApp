//
//  Question.h
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/10/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *answer;
@property (nonatomic, strong) NSString *comments;

@end
