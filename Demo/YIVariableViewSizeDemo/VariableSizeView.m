//
//  VariableSizeView.m
//  YIVariableViewSizeDemo
//
//  Created by Yasuhiro Inami on 2013/06/30.
//  Copyright (c) 2013年 Yasuhiro Inami. All rights reserved.
//

#import "VariableSizeView.h"
#import "YIVariableViewSize.h"
#import "ViewUtils.h"
#import <QuartzCore/QuartzCore.h>

#define SYNTHESIZE_PADDING_RIGHT    0

@interface VariableSizeView ()

@end


@implementation VariableSizeView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.titleLabel.layer.borderColor = [UIColor orangeColor].CGColor;
    self.titleLabel.layer.borderWidth = 3;
    
    self.descriptionLabel.layer.borderColor = [UIColor yellowColor].CGColor;
    self.descriptionLabel.layer.borderWidth = 3;
}

// change subview's frame.size & drawing contents
- (void)resizeSubviewsWithFittingSize:(CGSize)fittingSize
{
    //
    // NOTE:
    // UIKit's '-sizeToFit' uses current bounds.size as fitting size
    // which will either shrink or stay the same for most of the time,
    // so call '-sizeToFitWithMaxSize:' instead.
    //
//    [self.titleLabel sizeToFit];
//    [self.descriptionLabel sizeToFit];
    
    [self.titleLabel sizeToFitWithMaxSize:CGSizeMake(self.maxWidthForSubviews, CGFLOAT_MAX)];
    [self.descriptionLabel sizeToFitWithMaxSize:CGSizeMake(self.maxWidthForSubviews, CGFLOAT_MAX)];
}

// change subview's frame.origin
- (void)positionSubviews
{
    self.titleLabel.top = 10;
    self.titleLabel.left = (self.width-self.titleLabel.width)/2;
    
    self.descriptionLabel.top = self.titleLabel.bottom+10;
    self.descriptionLabel.left = (self.width-self.descriptionLabel.width)/2;
}

- (CGFloat)paddingBottomForVariableViewSize
{
    return 10;
}

@end
