//
//  messageArrView.h
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/6/29.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface messageArrView : UIView

#pragma mark - 左侧有一个Logo，中间有四个展示信息，分别为两大两小 右侧为一个按钮的样式
//用按钮的选中状态来显示是否选中
@property(nonatomic,strong)UIButton *rightButton;
//设置logo与信息
-(void)setLogo:(UIImage *)logoImg andMessageArr:(NSArray <NSString *>*)messageArr;

@end
