//
//  STMasterViewController.m
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

#import "STMasterViewController.h"

@implementation STMasterViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = @"Master";
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
    topLabel.text = @"Master";
    topLabel.backgroundColor = [UIColor grayColor];
    
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
    bottomLabel.text = @"Master";
    bottomLabel.backgroundColor = [UIColor grayColor];
    
    CGRect bottomLabelFrame;
    bottomLabelFrame.size = [bottomLabel sizeThatFits:bounds.size];
    bottomLabelFrame.origin.x = bounds.size.width - bottomLabelFrame.size.width;
    bottomLabelFrame.origin.y = bounds.size.height - bottomLabelFrame.size.height;
    bottomLabel.frame = bottomLabelFrame;
    bottomLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin;
    [self.view addSubview:bottomLabel];
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

@end
