//
//  FirstViewController.m
//  YIVariableViewSizeDemo
//
//  Created by Yasuhiro Inami on 2013/06/30.
//  Copyright (c) 2013年 Yasuhiro Inami. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
#if defined(__IPHONE_7_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    self.edgesForExtendedLayout = UIRectEdgeNone;
#endif
    
    self.variableSizeView.maxWidthForSubviews = 260;
    [self.variableSizeView sizeToFit];
}

- (IBAction)handleTextButton:(id)sender
{
    self.variableSizeView.titleLabel.text = LoremIpsum(arc4random_uniform(30));
    self.variableSizeView.descriptionLabel.text = LoremIpsum(arc4random_uniform(500));
}

- (IBAction)handleSizeToFitButton:(id)sender
{
    [self.variableSizeView sizeToFit];
}

- (IBAction)handleTextAndSizeToFitButton:(id)sender
{
    [self handleTextButton:sender];
    
#if defined(__IPHONE_7_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    //
    // NOTE: needs a little delay here for iOS7, or text sometimes gets cropped when label-frame expanded (for some reason)
    //
    double delayInSeconds = 0.01;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self handleSizeToFitButton:sender];
    });
#else
    [self handleSizeToFitButton:sender];
#endif
}

@end