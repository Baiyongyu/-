//
//  NPKScopeView.m
//  NPK
//
//  Created by 宇玄丶 on 2017/3/27.
//  Copyright © 2017年 北京116工作室. All rights reserved.
//

#import "NPKScopeView.h"
#import "UIButton+Additions.h"

#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height
@implementation NPKScopeView


- (instancetype)initWithFrame:(CGRect)frame
               indicatorValue:(NSArray *)indicatorArr
                     npkScope:(NSString *)npkScope
                 npkNameLabel:(NSString *)npkNameLabel {
    self = [super initWithFrame:frame];
    if (self) {
        self.indicatorArr = indicatorArr;
        self.npkScope = npkScope;
        self.npkNameLabel = npkNameLabel;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSArray *titleArr = [NSArray arrayWithObjects:@"极低", @"偏低", @"适中", @"偏高", nil];
    NSInteger index = 0;
    NSString *str;
    for (int i = 0; i < self.indicatorArr.count; i++) {
        // 黑色块值 大于区间的最小值 取出索引
        if ([self.npkScope floatValue] > [[self.indicatorArr objectAtIndex:i] floatValue]) {
            index = i;
        }
    }

    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 20, 20)];
    nameLabel.text = self.npkNameLabel;
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:nameLabel];
    
    CGFloat width = (SCREEN_WIDTH - 6 - 40)/4;
    NSArray *colorArray = @[[UIColor lightGrayColor],[UIColor greenColor],[UIColor orangeColor],[UIColor redColor]];
    for (int i = 0; i < titleArr.count; i ++) {
        UIButton *dzgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        dzgBtn.frame = CGRectMake(30 + (width+2) * i, 0, width, 20);
        dzgBtn.backgroundColor = colorArray[i];
        dzgBtn.tag = 100 + i;
        dzgBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [dzgBtn setTitle:[titleArr objectAtIndex:i] forState:UIControlStateNormal];
        [self addSubview:dzgBtn];
    }

    switch (index) {
        case 0:
            str = @"极低";
            break;
        case 1:
            str = @"偏低";
            break;
        case 2:
            str = @"适中";
            break;
        case 3:
            str = @"偏高";
            break;
        default:
            break;
    }
    
    
    UIButton *btn = (UIButton *)[self viewWithTag:100 + index];
    
    if ([str isEqualToString:btn.titleLabel.text]) {
        
        UIButton *indicateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat space = [[self.indicatorArr objectAtIndex:index+1] floatValue] - [[self.indicatorArr objectAtIndex:(index)] floatValue];
        
        CGFloat space1 = [self.npkScope floatValue] - [[self.indicatorArr objectAtIndex:(index)]floatValue];
        CGFloat ration = space1 / space;
        
        indicateBtn.frame = CGRectMake(btn.frame.size.width * ration + btn.frame.origin.x, btn.frame.origin.y - 35, 30, 30);
        [indicateBtn setTitle:self.npkScope forState:UIControlStateNormal];
        [indicateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        indicateBtn.titleLabel.font = [UIFont systemFontOfSize:6];
        [indicateBtn setImage:[UIImage imageNamed:@"shuzhi"] forState:UIControlStateNormal];
        [indicateBtn layoutButtonWithEdgeInsetsStyle:AppButtonEdgeInsetsStyleBottom imageTitleSpace:0];
        
        [self addSubview:indicateBtn];
    }
}

@end
