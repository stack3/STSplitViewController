//
//  STSplitViewController.h
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

#import <UIKit/UIKit.h>

@protocol STSplitViewControllerDelegate;

/**
 * The SplitViewController could have master view, detail view, header view and footer view.
 */
@interface STSplitViewController : UIViewController

/** The detail view width when portrait orientation.  */
@property (nonatomic, readwrite) CGFloat portraitDetailViewWidth;
/** The detail view width when landscape orientation.  */
@property (nonatomic, readwrite) CGFloat landscapeDetailViewWidth;
/** The SplitViewController delegate */
@property (weak, nonatomic, readwrite) id<STSplitViewControllerDelegate> delegate;

/**
 * Initialize.
 */
- (id)init;
/**
 * The header view height.
 */
- (void)setHeaderViewHeight:(CGFloat)height;
- (CGFloat)headerViewHeight;
/**
 * The footer view height.
 */
- (void)setFooterViewHeight:(CGFloat)height;
- (CGFloat)footerViewHeight;
/**
 * The divider width between master view and detail view.
 */
- (void)setDividerWidth:(CGFloat)width;
- (CGFloat)dividerWidth;
/**
 * The master view width for interface orientation.
 */
- (CGFloat)masterViewWidthForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
/**
 * The master view controller.
 */
- (void)setMasterViewController:(UIViewController *)masterViewController;
- (UIViewController *)masterViewController;
/**
 * The detail view controller.
 */
- (void)setDetailViewController:(UIViewController *)detailViewController;
- (UIViewController *)detailViewController;
/**
 * The header view controller.
 */
- (void)setHeaderViewController:(UIViewController *)headerViewController;
- (UIViewController *)headerViewController;
/**
 * The footer view controller.
 */
- (void)setFooterViewController:(UIViewController *)detailViewController;
- (UIViewController *)footerViewController;
/**
 * You can implement this method on subclass to create custom divider view.
 */
- (UIView *)createDividerView;

@end

/**
 * STSplitViewController delegate.
 */
@protocol STSplitViewControllerDelegate <NSObject>

@optional
/**
 * You can create custom divider view on this method.
 */
- (UIView *)createDividerViewForSplitViewController:(STSplitViewController *)sender;

@end
