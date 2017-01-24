//
//  CardView.m
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/22.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import "CardView.h"


@interface CardView()
@property (strong, nonatomic) NSMutableArray *imageArray;       //存放图片
@property (assign, nonatomic) CGFloat H;                        //自身高度
@end

@implementation CardView
- (CGFloat)getH {
    return _H;
}
- (NSMutableArray *)imageArray {
    if (!_imageArray) {
        NSArray *images = @[@"master", @"feedback", @"more", @"recommend"];
        _imageArray = [NSMutableArray arrayWithArray:images];
       
    }
    return _imageArray;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        
        //设置UI
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
   
    
    int rowNumber = 2;                  //每行几个
    NSUInteger totalCount = self.imageArray.count;
    int row = 0;
    int col = 0;
    int margin = 5;
    int imageViewW = (self.bounds.size.width - (rowNumber + 1) * margin) / rowNumber;
    int imageViewH = imageViewW * 2 / 3;
    for (int i = 0; i < totalCount; i++) {
        row = i / rowNumber;
        col = i % rowNumber;
        CGFloat X = margin + col * (imageViewW + margin);
        CGFloat Y = margin + row * (imageViewH + margin);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(X, Y, imageViewW, imageViewH)];
        imageView.image = [UIImage imageNamed:self.imageArray[i]];
        [self addSubview:imageView];
    }
    NSUInteger totalRow = (totalCount % rowNumber) == 0 ? (totalCount / rowNumber) : (totalCount / rowNumber + 1);
    _H = margin + (imageViewH + margin) * totalRow;
    //NSLog(@"h = %f", _H);
}
@end
