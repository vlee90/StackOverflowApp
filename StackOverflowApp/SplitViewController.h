//
//  SplitViewController.h
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/12/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplitViewController : UIViewController <UISplitViewControllerDelegate>

-(BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController;

@end
