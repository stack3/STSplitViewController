//
//  STSplitView.m
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

#import "STSplitView.h"

@implementation STSplitView {
    CGFloat _detailViewWidth;
    CGFloat _dividerWidth;
    CGFloat _headerViewHeight;
    CGFloat _footerViewHeight;
    
    __strong UIView *_masterView;
    __strong UIView *_detailView;
    __strong UIView *_dividerView;
    __strong UIView *_headerView;
    __strong UIView *_footerView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)layoutSubviews
{
    CGRect bounds = self.bounds;

    CGRect headerViewFrame;
    headerViewFrame.size.width = bounds.size.width;
    headerViewFrame.size.height = _headerViewHeight;
    headerViewFrame.origin.x = 0;
    headerViewFrame.origin.y = 0;
    if (_headerView) {
        _headerView.frame = headerViewFrame;
    }
    
    CGRect footerViewFrame;
    footerViewFrame.size.width = bounds.size.width;
    footerViewFrame.size.height = _footerViewHeight;
    footerViewFrame.origin.x = 0;
    footerViewFrame.origin.y = bounds.size.height - _footerViewHeight;
    if (_footerView) {
        _footerView.frame = footerViewFrame;
    }
    
    CGFloat contentViewHeight = bounds.size.height - _headerViewHeight - _footerViewHeight;
    
    CGRect masterViewFrame;
    masterViewFrame.origin.x = 0;
    masterViewFrame.origin.y = _headerViewHeight;
    masterViewFrame.size.width = bounds.size.width - _detailViewWidth - _dividerWidth;
    masterViewFrame.size.height = contentViewHeight;
    if (_masterView) {
        _masterView.frame = masterViewFrame;
    }
    
    CGRect dividerViewFrame;
    dividerViewFrame.origin.x = masterViewFrame.size.width;
    dividerViewFrame.origin.y = _headerViewHeight;
    dividerViewFrame.size.width = _dividerWidth;
    dividerViewFrame.size.height = contentViewHeight;
    if (_dividerView) {
        _dividerView.frame = dividerViewFrame;
    }
    
    CGRect detailViewFrame;
    detailViewFrame.origin.x = masterViewFrame.size.width + _dividerWidth;
    detailViewFrame.origin.y = _headerViewHeight;
    detailViewFrame.size.width = _detailViewWidth;
    detailViewFrame.size.height = contentViewHeight;
    if (_detailView) {
        _detailView.frame = detailViewFrame;
    }
}

- (void)setDetailViewWidth:(CGFloat)width
{
    _detailViewWidth = width;
    [self setNeedsLayout];
}

- (CGFloat)detailViewWidth
{
    return _detailViewWidth;
}

- (void)setDividerWidth:(CGFloat)width
{
    _dividerWidth = width;
    [self setNeedsLayout];
}

- (CGFloat)dividerWidth
{
    return _dividerWidth;
}

- (void)setHeaderViewHeight:(CGFloat)height
{
    _headerViewHeight = height;
    [self setNeedsLayout];
}

- (CGFloat)headerViewHeight
{
    return _headerViewHeight;
}

- (void)setFooterViewHeight:(CGFloat)height
{
    _footerViewHeight = height;
    [self setNeedsLayout];
}

- (CGFloat)footerViewHeight;
{
    return _footerViewHeight;
}

- (void)setMasterView:(UIView *)masterView
{
    [_masterView removeFromSuperview];
    
    if (masterView) {
        [self addSubview:masterView];
    }
    _masterView = masterView;
    
    [self setNeedsLayout];
}

- (UIView *)masterView
{
    return _masterView;
}

- (void)setDetailView:(UIView *)detailView
{
    [_detailView removeFromSuperview];
    
    if (detailView) {
        [self addSubview:detailView];
    }
    _detailView = detailView;
    
    [self setNeedsLayout];
}

- (UIView *)detailView
{
    return _detailView;
}

- (void)setDividerView:(UIView *)dividerView
{
    [_dividerView removeFromSuperview];
    
    if (dividerView) {
        [self addSubview:dividerView];
    }
    _dividerView = dividerView;
    
    [self setNeedsLayout];
}

- (UIView *)dividerView
{
    return _dividerView;
}

- (void)setHeaderView:(UIView *)headerView
{
    [_headerView removeFromSuperview];
    
    if (headerView) {
        [self addSubview:headerView];
    }
    _headerView = headerView;
    
    [self setNeedsLayout];
}

- (UIView *)heaerView
{
    return _headerView;
}

- (void)setFooterView:(UIView *)footerView
{
    [_footerView removeFromSuperview];
    
    if (footerView) {
        [self addSubview:footerView];
    }
    _footerView = footerView;
    
    [self setNeedsLayout];
}

- (UIView *)footerView
{
    return _footerView;
}

@end
