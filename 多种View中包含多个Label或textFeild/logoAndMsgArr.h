//
//  logoAndMsgArr.h
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/7/1.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface logoAndMsgArr : UIView

#pragma mark - 左边一个Logo右边提示信息根据point、font与信息创建
+(UIView *)createViewAndLogoAndButtonMsg:(CGPoint)point AndMsg:(NSString *)str AndLogo:(UIImage *)img andFont:(CGFloat)font;

#pragma mark - 垂直分割线设置
+(void)viewNeedVerLine:(UIView *)view andLineNum:(NSInteger)num;

#pragma mark - 根据信息数组的count创建View中的提示信息数与内容
-(UIView *)createImgAndRect:(CGRect)rect andMsgArr:(NSArray *)array;

@end
