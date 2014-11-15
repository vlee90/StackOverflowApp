//
//  Question.m
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/10/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import "Question.h"

@implementation Question

- (instancetype)initWithDictionary: (NSDictionary *) dict
{
    self = [super init];
    if (self) {
        self.title = [dict objectForKey:@"title"];
        self.link = [dict objectForKey:@"link"];
    }
    return self;
}

@end