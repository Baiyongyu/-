//
//  NPKScopeView.h
//  NPK
//
//  Created by 宇玄丶 on 2017/3/27.
//  Copyright © 2017年 北京116工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NPKScopeView : UIView

@property(nonatomic,strong)NSArray *indicatorArr;
@property(nonatomic,copy)NSString *npkScope;
@property(nonatomic,copy)NSString *npkNameLabel;

- (instancetype)initWithFrame:(CGRect)frame
                indicatorValue:(NSArray *)indicatorArr
                  npkScope:(NSString *)npkScope
                 npkNameLabel:(NSString *)npkNameLabel;


@end
