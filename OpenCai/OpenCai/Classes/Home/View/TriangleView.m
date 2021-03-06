//
//  TriangleView.m
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/23.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import "TriangleView.h"

@implementation TriangleView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    //设置背景颜色
    [[UIColor clearColor]set];
    
    UIRectFill([self bounds]);
                
    //拿到当前视图准备好的画板
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //利用path进行绘制三角形
    CGContextBeginPath(context);//标记
    
    CGContextMoveToPoint(context, 0, self.bounds.size.height * 0.5);//设置起点
    
    CGContextAddLineToPoint(context, self.bounds.size.width, 0);
    
    CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
    
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    
    [[UIColor whiteColor] setFill]; //设置填充色
    
//    [[UIColor whiteColor] setStroke]; //设置边框颜色
     
    CGContextDrawPath(context, kCGPathFillStroke);//绘制路径path
                      
}


@end
