//
//  UIView+YIVariableViewSize.h
//  YIVariableViewSize
//
//  Created by Yasuhiro Inami on 2013/06/30.
//  Copyright (c) 2013年 Yasuhiro Inami. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (YIVariableViewSize)

- (UIView*)mostBottomVisibleSubview;
- (UIView*)mostRightVisibleSubview;

- (void)sizeToFitWithMaxSize:(CGSize)maxSize;

@end
