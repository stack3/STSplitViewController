//
//  STMainMenuViewController.m
//  STSplitViewControllerSample
//
//  Created by EIMEI on 2013/02/02.
//  Copyright (c) 2013 stack3.net (http://stack3.net/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "STMainMenuViewController.h"
#import "STSplitViewController.h"
#import "STMasterViewController.h"
#import "STDetailViewController.h"
#import "STHeaderViewController.h"
#import "STFooterViewController.h"

@implementation STMainMenuViewController {
    __strong NSArray *_menuItems;
    __weak UITableView *_tableView;
}

#define _STMenuItemMasterAndDetail @"Master and Detail"
#define _STMenuItemHeader @"Header"
#define _STMenuItemFooter @"Footer"
#define _STMenuItemHeaderAndFooter @"Header and Footer"

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"Main Menu";
        _menuItems = @[_STMenuItemMasterAndDetail, _STMenuItemHeader, _STMenuItemFooter, _STMenuItemHeaderAndFooter];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect bounds = self.view.bounds;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:bounds];
    _tableView = tableView;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *menuItem = [_menuItems objectAtIndex:indexPath.row];
    
    NSString *cellId = @"cellId";
    UITableViewCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = menuItem;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat dividerWidth = 5;
    NSString *menuItem = [_menuItems objectAtIndex:indexPath.row];
    UIViewController *con = nil;
    if ([menuItem isEqualToString:_STMenuItemMasterAndDetail]) {
        STSplitViewController *splitViewCon = [[STSplitViewController alloc] init];
        splitViewCon.dividerWidth = dividerWidth;
        UIViewController *masterViewCon = [[STMasterViewController alloc] init];
        UIViewController *detailViewCon = [[STDetailViewController alloc] init];
        splitViewCon.masterViewController = masterViewCon;
        splitViewCon.detailViewController = detailViewCon;
        con = splitViewCon;
    } else if ([menuItem isEqualToString:_STMenuItemHeader]) {
        STSplitViewController *splitViewCon = [[STSplitViewController alloc] init];
        splitViewCon.dividerWidth = dividerWidth;
        splitViewCon.masterViewController = [[STMasterViewController alloc] init];
        splitViewCon.detailViewController = [[STDetailViewController alloc] init];
        splitViewCon.headerViewController = [[STHeaderViewController alloc] init];
        splitViewCon.headerViewHeight = 80;
        con = splitViewCon;
    } else if ([menuItem isEqualToString:_STMenuItemFooter]) {
        STSplitViewController *splitViewCon = [[STSplitViewController alloc] init];
        splitViewCon.dividerWidth = dividerWidth;
        splitViewCon.masterViewController = [[STMasterViewController alloc] init];
        splitViewCon.detailViewController = [[STDetailViewController alloc] init];
        splitViewCon.footerViewController = [[STFooterViewController alloc] init];
        splitViewCon.footerViewHeight = 80;
        con = splitViewCon;
    } else if ([menuItem isEqualToString:_STMenuItemHeaderAndFooter]) {
        STSplitViewController *splitViewCon = [[STSplitViewController alloc] init];
        splitViewCon.dividerWidth = dividerWidth;
        splitViewCon.masterViewController = [[STMasterViewController alloc] init];
        splitViewCon.detailViewController = [[STDetailViewController alloc] init];
        splitViewCon.headerViewController = [[STHeaderViewController alloc] init];
        splitViewCon.headerViewHeight = 80;
        splitViewCon.footerViewController = [[STFooterViewController alloc] init];
        splitViewCon.footerViewHeight = 80;
        con = splitViewCon;
    }
    
    if (con) {
        [self presentViewController:con animated:YES completion:nil];
    }
}

@end
