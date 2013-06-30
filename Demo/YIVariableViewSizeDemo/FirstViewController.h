//
//  FirstViewController.h
//  YIVariableViewSizeDemo
//
//  Created by Yasuhiro Inami on 2013/06/30.
//  Copyright (c) 2013年 Yasuhiro Inami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VariableSizeView.h"

// https://gist.github.com/inamiy/5429553
static inline NSString* LoremIpsum(NSUInteger count)
{
    NSString* str = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ";
    
    while ([str length] < count) {
        str = [str stringByAppendingString:str];
    }
    
    return [str substringToIndex:count];
}

@interface FirstViewController : UIViewController

@property (strong, nonatomic) IBOutlet VariableSizeView *variableSizeView;

- (IBAction)handleTextButton:(id)sender;
- (IBAction)handleSizeToFitButton:(id)sender;
- (IBAction)handleTextAndSizeToFitButton:(id)sender;

@end
