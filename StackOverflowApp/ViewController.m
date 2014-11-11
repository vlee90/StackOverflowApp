//
//  ViewController.m
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/10/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) AppDelegate *appDelegate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    NetworkController *networkController = [self.appDelegate networkController];
    [networkController fetchQuestionBasedOnTag: @"Swift" completionBlock:^(NSDictionary *data, NSError *error) {
        if (error == nil) {
            NSLog(@"Success");
            NSArray *itemDictionary = (NSArray *)[data objectForKey:@"items"];
            NSLog(@"%@", itemDictionary);
        }
    }];
    
}

@end
