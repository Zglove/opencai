//
//  TNavigationController.m
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/22.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import "TNavigationController.h"
#import "Header.h"

@interface TNavigationController ()

@end

@implementation TNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [self createImageWithColor:k_NAV_STYLE];
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f,0.0f,1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *myImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return myImage;
}


@end
