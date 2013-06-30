//
//  UIView+YIVariableViewSize.m
//  YIVariableViewSize
//
//  Created by Yasuhiro Inami on 2013/06/30.
//  Copyright (c) 2013年 Yasuhiro Inami. All rights reserved.
//

#import "UIView+YIVariableViewSize.h"
#import "YIVariableViewSize.h"
#import "ViewUtils.h"
#import <objc/runtime.h>


@implementation UIView (YIVariableViewSize)

- (UIView*)mostBottomVisibleSubview
{
    UIView* view = nil;
    CGFloat bottom = -CGFLOAT_MAX;
    
    for (UIView* subview in self.subviews) {
        if (!subview.hidden && subview.alpha > 0.01 && subview.bottom > bottom) {
            bottom = subview.bottom;
            view = subview;
        }
    }
    
    return view;
}

- (UIView*)mostRightVisibleSubview
{
    UIView* view = nil;
    CGFloat right = -CGFLOAT_MAX;
    
    for (UIView* subview in self.subviews) {
        if (!subview.hidden && subview.alpha > 0.01 && subview.right > right) {
            right = subview.right;
            view = subview;
        }
    }
    
    return view;
}

- (void)sizeToFitWithMaxSize:(CGSize)maxSize
{
    self.size = [self sizeThatFits:maxSize];
}

@end


#pragma mark -


@interface UIView (YIVariableViewSizeSwizzling) <YIVariableViewSize>
@end


@implementation UIView (YIVariableViewSizeSwizzling)

- (CGSize)YIVariableViewSize_sizeThatFits:(CGSize)size
{
    if ([self respondsToSelector:@selector(resizeSubviewsWithFittingSize:)]) {
        [self resizeSubviewsWithFittingSize:size];
    }
    
    if ([self respondsToSelector:@selector(positionSubviews)]) {
        [self positionSubviews];
    }
    
    if ([self respondsToSelector:@selector(paddingBottomForVariableViewSize)]) {
        size.height = self.mostBottomVisibleSubview.bottom + self.paddingBottomForVariableViewSize;
    }
    
    if ([self respondsToSelector:@selector(paddingRightForVariableViewSize)]) {
        size.width = self.mostRightVisibleSubview.right + self.paddingRightForVariableViewSize;
    }
    
    return size;
}

- (void)YIVariableViewSize_layoutSubviews
{
    [self YIVariableViewSize_layoutSubviews];
    
    if ([self respondsToSelector:@selector(positionSubviews)]) {
        [self positionSubviews];
    }
}

@end
