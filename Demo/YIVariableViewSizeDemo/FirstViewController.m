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
    [self handleSizeToFitButton:sender];
}

@end