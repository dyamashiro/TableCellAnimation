//
//  TableCellAnimationViewController.m
//  TableCellAnimation
//
//  Created by dyamashiro on 2014/02/01.
//  Copyright (c) 2014年 dyamashiro. All rights reserved.
//

#import "TableCellAnimationViewController.h"

@interface TableCellAnimationViewController ()
@property (assign, nonatomic) BOOL isExpanded;
@end

@implementation TableCellAnimationViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"title";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (section == 0)? 1 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
}

- (IBAction)expand:(id)sender {
    self.isExpanded = !self.isExpanded;
    // 高さの再計算
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section != 0) return tableView.rowHeight;
    return self.isExpanded? 300 : 100;
}

@end
