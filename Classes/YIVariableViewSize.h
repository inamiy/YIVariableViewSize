//
//  YIVariableViewSize.h
//  YIVariableViewSize
//
//  Created by Yasuhiro Inami on 2013/06/30.
//  Copyright (c) 2013年 Yasuhiro Inami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+YIVariableViewSize.h"

//
// How to implement YIVariableViewSize Protocol in UIView subclass:
//
//    - (CGSize)sizeThatFits:(CGSize)size
//    {
//        [self resizeSubviewsWithFittingSize:size];
//        [self positionSubviews];
//
//        size.height = self.mostBottomVisibleSubview.bottom + self.paddingBottomForVariableViewSize;
//
//        return size;
//    }
//
//    - (void)layoutSubviews
//    {
//        [super layoutSubviews];
//        [self positionSubviews];  // don't resize, just set origin
//    }
//
//    // change subview's frame.size & drawing contents
//    - (void)resizeSubviewsWithFittingSize:(CGSize)fittingSize
//    {
//        [self.subview1 sizeToFitWithMaxSize:fittingSize];
//        [self.subview2 sizeToFitWithMaxSize:fittingSize];
//    }
//
//    // change subview's frame.origin
//    - (void)positionSubviews
//    {
//        self.subview2.top = self.subview1.bottom;
//    }
//
//    - (CGFloat)paddingBottomForVariableViewSize
//    {
//        return 10;
//    }
//
@protocol YIVariableViewSize <NSObject>

@optional

- (void)resizeSubviewsWithFittingSize:(CGSize)fittingSize; // fittingSize = argument of -sizeThatFits:
- (void)positionSubviews;

- (CGFloat)paddingBottomForVariableViewSize;
- (CGFloat)paddingRightForVariableViewSize;

@end


//
// installer (optional)
//
// NOTE:
// [YIVariableViewSize install] will automatically implement '-sizeThatFits:' and '-layoutSubviews' for you,
// but make sure your view class conforms to <YIVariableViewSize> protocol
// and synthesize paddingBottom/RightForVariableViewSize whenever needed.
//
@interface YIVariableViewSize : NSObject

+ (void)install;
+ (void)installToUIViewSubclass:(Class)c;

@end
