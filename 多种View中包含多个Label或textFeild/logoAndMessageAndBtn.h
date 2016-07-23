//
//  logoAndMessageAndBtn.h
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/6/29.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface logoAndMessageAndBtn : UIView

#pragma mark - 左边为Logo,中间只有一个textFeild或label时,右侧为按钮,按钮有默认和描述信息样式
//按钮为文字描述和普通状态
+(UIView *)setViewWithLogo:(UIImage *)img andMessage:(NSString *)message andRightMessage:(NSString *)rightMsg andRect:(CGRect)rect andTextFieldSelected:(BOOL)selcted;
@end
