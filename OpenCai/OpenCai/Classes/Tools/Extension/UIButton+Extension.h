//
//  UIButton+UIButton_Extension.h
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/22.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

+ (instancetype)createButtonWithFrame:(CGRect)frame title:(NSString *)title imageName:(NSString *)imageName titleColor:(UIColor *)titleColor titleFontSize:(CGFloat)titleFontSize target:(id)target action:(SEL)action;

@end
