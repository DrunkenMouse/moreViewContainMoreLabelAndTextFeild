//
//  mutableLabelWithRect.h
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/7/1.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mutableLabelWithRect : UIView

#pragma mark  通过传入的rect、信息数组、字体大小动态创建一个包含Lable的View
-(UIView *)creteCountLabel:(CGRect)rect andMessageArr:(NSArray *)mesArr andFont:(CGFloat)font;
@end
