//
//  Header.h
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/22.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

//屏幕宽高
#define k_SCREEN_W             ([UIScreen mainScreen].bounds.size.width)
#define k_SCREEN_H             ([UIScreen mainScreen].bounds.size.height)

//RGB设置
#define k_RGB(R, G, B)                    ([UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:1])
#define k_RGBA(R, G, B, A)                ([UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A])
#define k_NAV_STYLE                       (k_RGB(238, 0, 25))
