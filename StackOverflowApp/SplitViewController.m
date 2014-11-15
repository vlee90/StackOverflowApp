//
//  SplitViewController.m
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/12/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import "SplitViewController.h"

@interface SplitViewController ()

@end

@implementation SplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISplitViewController *splitVC = [[self childViewControllers] firstObject];
    splitVC.delegate = self;
}

-(BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    return true;
}
@end
