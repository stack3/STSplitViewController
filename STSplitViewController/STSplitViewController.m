//
//  STSplitViewController.m
//  STSplitViewController
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

#import "STSplitViewController.h"
#import "STSplitView.h"

#define _STDefaultDetailViewWidth (600)
#define _STDividerWidth (1)

@implementation STSplitViewController {
    __strong UIViewController *_masterViewController;
    __strong UIViewController *_detailViewController;
    __strong UIViewController *_headerViewController;
    __strong UIViewController *_footerViewController;
}

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _portraitDetailViewWidth = _STDefaultDetailViewWidth;
        _landscapeDetailViewWidth = _STDefaultDetailViewWidth;
    }
    return self;
}

- (STSplitView *)splitView
{
    return (STSplitView *)self.view;
}

#pragma mark - Override UIViewController Methods

- (void)loadView
{
    self.view = [[STSplitView alloc] initWithFrame:CGRectZero];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.splitView.detailViewWidth = _portraitDetailViewWidth;
    self.splitView.dividerWidth = _STDividerWidth;
    self.splitView.dividerView = [self createDividerView];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (self.interfaceOrientation == toInterfaceOrientation) return;

    if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
        self.splitView.detailViewWidth = _portraitDetailViewWidth;
    } else {
        self.splitView.detailViewWidth = _landscapeDetailViewWidth;
    }
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

#pragma mark - Custom Methods

- (CGFloat)masterViewWidthForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    CGSize size = self.view.bounds.size;
    if (UIInterfaceOrientationIsPortrait(interfaceOrientation)) {
        return size.width - _portraitDetailViewWidth - self.splitView.dividerWidth;
    } else {
        return size.width - _landscapeDetailViewWidth - self.splitView.dividerWidth;
    }
}

- (void)setMasterViewController:(UIViewController *)masterViewController
{
    if (masterViewController == _masterViewController) return;
    
    if (_masterViewController) {
        [_masterViewController removeFromParentViewController];
    }
    _masterViewController = masterViewController;
    if (_masterViewController) {
        [self addChildViewController:_masterViewController];
    }
    self.splitView.masterView = _masterViewController.view;
}

- (UIViewController *)masterViewController
{
    return _masterViewController;
}

- (void)setPortraitDetailViewWidth:(CGFloat)portraitDetailViewWidth
{
    _portraitDetailViewWidth = portraitDetailViewWidth;
    if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
        self.splitView.detailViewWidth = _portraitDetailViewWidth;
    }
}

- (void)setLandscapeDetailViewWidth:(CGFloat)landscapeDetailViewWidth
{
    _landscapeDetailViewWidth = landscapeDetailViewWidth;
    if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
        self.splitView.detailViewWidth = _landscapeDetailViewWidth;
    }
}

- (void)setDetailViewController:(UIViewController *)detailViewController
{
    if (detailViewController == _detailViewController) return;
    
    if (_detailViewController) {
        [_detailViewController removeFromParentViewController];
    }
    _detailViewController = detailViewController;
    if (_detailViewController) {
        [self addChildViewController:_detailViewController];
    }

    self.splitView.detailView = _detailViewController.view;
}

- (UIViewController *)detailViewController
{
    return _detailViewController;
}

- (void)setHeaderViewController:(UIViewController *)headerViewController
{
    if (headerViewController == _headerViewController) return;
    
    if (_headerViewController) {
        [_headerViewController removeFromParentViewController];
    }
    _headerViewController = headerViewController;
    if (_headerViewController) {
        [self addChildViewController:_headerViewController];
    }
    
    self.splitView.headerView = _headerViewController.view;
}

- (UIViewController *)headerViewController
{
    return _headerViewController;
}

- (void)setFooterViewController:(UIViewController *)footerViewController
{
    if (footerViewController == _footerViewController) return;
    
    if (_footerViewController) {
        [_footerViewController removeFromParentViewController];
    }
    _footerViewController = footerViewController;
    if (_footerViewController) {
        [self addChildViewController:_footerViewController];
    }
    
    self.splitView.footerView = _footerViewController.view;
}

- (UIViewController *)footerViewController
{
    return _footerViewController;
}

- (void)setHeaderViewHeight:(CGFloat)height
{
    self.splitView.headerViewHeight = height;
}

- (CGFloat)headerViewHeight
{
    return self.splitView.headerViewHeight;
}

- (void)setFooterViewHeight:(CGFloat)height
{
    self.splitView.footerViewHeight = height;
}

- (CGFloat)footerViewHeight
{
    return self.splitView.footerViewHeight;
}

- (UIView *)createDividerView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    view.backgroundColor = [UIColor blackColor];
    return view;
}

- (void)setDividerWidth:(CGFloat)width
{
    self.splitView.dividerWidth = width;
}

- (CGFloat)dividerWidth
{
    return self.splitView.dividerWidth;
}

@end
