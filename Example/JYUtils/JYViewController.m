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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
