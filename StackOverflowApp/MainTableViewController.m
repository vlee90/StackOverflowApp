//
//  MainTableViewController.m
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/13/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *textArray;

@end

@implementation MainTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"MainTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"MAIN_TABLEVIEW_CELL"];
    self.textArray = [[NSArray alloc] initWithObjects:@"Welcome", @"Find Question", @"Lookup User", nil];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MAIN_TABLEVIEW_CELL" forIndexPath:indexPath];
    [self.textArray objectAtIndex:[indexPath row]];
    NSString *text = NSLocalizedString([self.textArray objectAtIndex:[indexPath row]], "MainMenuText");
    cell.mainTextLabel.text = text;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.textArray count];
}


@end
