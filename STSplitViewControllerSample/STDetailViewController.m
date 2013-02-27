//
//  STDetailViewController.m
//  STSplitViewControllerSample
//
//  Created by EIMEI on 2013/02/02.
//  Copyright (c) 2013 stack3. All rights reserved.
//

#import "STDetailViewController.h"

@implementation STDetailViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.view.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect bounds = self.view.bounds;
    //
    // topLabel
    //
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    topLabel.text = @"Detail";
    
    CGRect topLabelFrame;
    topLabelFrame.size = [topLabel sizeThatFits:bounds.size];
    topLabelFrame.origin.x = 0;
    topLabelFrame.origin.y = 0;
    topLabel.frame = topLabelFrame;
    [self.view addSubview:topLabel];
    //
    // bottomLabel
    //
    UILabel *bottomLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    bottomLabel.text = @"Detail";
    
    CGRect bottomLabelFrame;
    bottomLabelFrame.size = [bottomLabel sizeThatFits:bounds.size];
    bottomLabelFrame.origin.x = bounds.size.width - bottomLabelFrame.size.width;
    bottomLabelFrame.origin.y = bounds.size.height - bottomLabelFrame.size.height;
    bottomLabel.frame = bottomLabelFrame;
    bottomLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin;
    [self.view addSubview:bottomLabel];
    //
    // closeButton
    //
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [closeButton setTitle:@"Close" forState:UIControlStateNormal];
    CGRect closeButtonFrame;
    closeButtonFrame.size = [closeButton sizeThatFits:bounds.size];
    closeButtonFrame.origin.x = (bounds.size.width - closeButtonFrame.size.width) / 2;
    closeButtonFrame.origin.y = (bounds.size.height - closeButtonFrame.size.height) / 2;
    closeButton.frame = closeButtonFrame;
    closeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [closeButton addTarget:self action:@selector(closeButtonDidTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"viewDidDisappear");
}

- (void)closeButtonDidTap
{
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
