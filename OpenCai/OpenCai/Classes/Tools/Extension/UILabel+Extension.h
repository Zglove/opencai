//
//  UILabel+Extension.h
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/22.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

+ (instancetype)createLabelWithFrame:(CGRect)frame text:(NSString *)text textFontSize:(CGFloat)textFontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment;

@end
