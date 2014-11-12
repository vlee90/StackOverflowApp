//
//  QuestionTableViewController.h
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/11/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionTableCell.h"
#import "AppDelegate.h"

@interface QuestionTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

-(void)viewDidLoad;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;



@end
