//
//  JYViewController.m
//  JYUtils
//
//  Created by yaoliangjun on 10/26/2019.
//  Copyright (c) 2019 yaoliangjun. All rights reserved.
//

#import "JYViewController.h"
#import <JYUtils/JYUtils.h>

@interface JYViewController ()

@end

@implementation JYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"JYUtils Current Millisecond Date: %@", [NSDate millisecondWithCurrentDate]);
    
    UIButton *btn = [UIButton buttonWithTitle:NSLocalizedString(@"去拍照", nil) titleColor:[UIColor blackColor] highlightedTitleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:16] backgroundColor:[UIColor yellowColor] highlightedBackgroundColor:[UIColor yellowColor] borderColor:nil borderWidth:0 cornerRadius:2 target:self selector:nil];
    btn.frame = CGRectMake(20, 100, [UIScreen mainScreen].bounds.size.width - 40, 44);
    [self.view addSubview:btn];
    [btn.layer insertSublayer:[CAGradientLayer gradientLayerWithFrame:btn.bounds startColor:[UIColor redColor] endColor:[UIColor orangeColor]] atIndex:0];
}

@end
