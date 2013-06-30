//
//  VariableSizeView.h
//  YIVariableViewSizeDemo
//
//  Created by Yasuhiro Inami on 2013/06/30.
//  Copyright (c) 2013年 Yasuhiro Inami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YIVariableViewSize.h"

@interface VariableSizeView : UIView <YIVariableViewSize>

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextView *descriptionLabel;

@property (nonatomic) CGFloat maxWidthForSubviews;

@end
