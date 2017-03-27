//
//  UIButton+Additions.h
//  CQArchitecture
//
//  Created by 宇玄丶 on 2017/3/27.
//  Copyright © 2017年 北京116工作室. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ButtonActionBlock)();

@interface UIButton (Additions)

typedef NS_ENUM(NSUInteger, AppButtonEdgeInsetsStyle) {
    AppButtonEdgeInsetsStyleTop, // image在上，label在下
    AppButtonEdgeInsetsStyleLeft, // image在左，label在右
    AppButtonEdgeInsetsStyleBottom, // image在下，label在上
    AppButtonEdgeInsetsStyleRight // image在右，label在左
};

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(AppButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;



@end
