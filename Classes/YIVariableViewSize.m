//
//  YIVariableViewSize.m
//  YIVariableViewSize
//
//  Created by Yasuhiro Inami on 2013/06/30.
//  Copyright (c) 2013年 Yasuhiro Inami. All rights reserved.
//

#import "YIVariableViewSize.h"
#import "JRSwizzle.h"


@implementation YIVariableViewSize

+ (void)install
{
    [self installToUIViewSubclass:[UIView class]];
}

+ (void)installToUIViewSubclass:(Class)c
{
    if (![c isSubclassOfClass:[UIView class]]) {
        [NSException raise:NSInvalidArgumentException
                    format:@"YIVariableViewSize must be installed to UIView itself or subclass."];
        return;
    }
    
    [c jr_swizzleMethod:@selector(sizeThatFits:)
             withMethod:@selector(YIVariableViewSize_sizeThatFits:)
                  error:NULL];
    
    [c jr_swizzleMethod:@selector(layoutSubviews)
             withMethod:@selector(YIVariableViewSize_layoutSubviews)
                  error:NULL];
}

@end
