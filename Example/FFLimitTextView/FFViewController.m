//
//  FFViewController.m
//  FFLimitTextView
//
//  Created by fanxiaoApple on 04/26/2019.
//  Copyright (c) 2019 fanxiaoApple. All rights reserved.
//

#import "FFViewController.h"
#import "FFCategories.h"
#import "FFLimitTextView.h"

@interface FFViewController ()

@end

@implementation FFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FFLimitTextView *tv = [[FFLimitTextView alloc] init];
    tv.frame = CGRectMake(15, 50, self.view.FF_Width-30, 150);
    [self.view addSubview:tv];
}

@end
