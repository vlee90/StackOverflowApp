//
//  QuestionTableViewController.m
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/11/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import "QuestionTableViewController.h"

@interface QuestionTableViewController()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) AppDelegate *appDelegate;
@property (weak, nonatomic) NetworkController *networkController;
@property (strong, nonatomic) WebViewController *webViewController;
@property (strong, nonatomic) NSArray *questionArray;
@property (strong, nonatomic) NSString *nameNib;
@property (strong, nonatomic) NSString *cellReuseIdentifier;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;

@end


@implementation QuestionTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.nameNib = @"QuestionTableCell";
    self.cellReuseIdentifier = @"QUESTION_TABLE_CELL";
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    self.networkController = [[self appDelegate] networkController];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.searchBar.delegate = self;
    self.topLabel.text = NSLocalizedString(@"Type in Tag", @"Top Text");
    UINib *nib = [UINib nibWithNibName: self.nameNib bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier: self.cellReuseIdentifier];
    
}

// MARK: SEARCHBAR
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchTerm = [searchBar text];
    if (searchTerm != nil) {
        [[self networkController] fetchQuestionBasedOnTag: searchTerm completionBlock:^(NSMutableArray *questionArray, NSError *error) {
            self.questionArray = questionArray;
            [[self tableView] reloadData];
        }];
    }
}


// MARK: TABLEVIEW
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self questionArray] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QuestionTableCell *cell = [tableView dequeueReusableCellWithIdentifier: self.cellReuseIdentifier forIndexPath:indexPath];
    cell.titleLabel.text = [[[self questionArray] objectAtIndex:[indexPath row]]title];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    Question *question = [self.questionArray objectAtIndex:[indexPath row]];
//    WebViewController *toVC = [[self storyboard] instantiateViewControllerWithIdentifier:@"WEBVIEW"];
//    toVC.url = [question link];
//    [self presentViewController:toVC animated:true completion:nil];
}

@end
