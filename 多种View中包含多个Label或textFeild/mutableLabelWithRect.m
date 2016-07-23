//
//  mutableLabelWithRect.m
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/7/1.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "mutableLabelWithRect.h"

@implementation mutableLabelWithRect
#pragma mark  通过传入的rect、信息数组、字体大小动态创建一个包含Lable的View
//Lable的数量为数组的count
-(UIView *)creteCountLabel:(CGRect)rect andMessageArr:(NSArray *)mesArr andFont:(CGFloat)font{
    
    //创建一个View装载创建好的Label提示信息
    UIView *labelView = [[UIView alloc]initWithFrame:rect];
    
    //通过传入的数组长度来创建对应的Label
    //并设置Label的信息
    for (int i = 0; i<mesArr.count; i++) {
        
        //获取Label的信息内容，通过内容计算宽高
        NSString *str = mesArr[i];
        CGSize size = [str sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]}];
        CGSize adjustSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
        

        
        
        //通过计算的宽高动态设置Label的属性
        UILabel *mesLabel = [[UILabel alloc]initWithFrame:CGRectMake((labelView.frame.size.width/mesArr.count-10)*i, 0, adjustSize.width, labelView.frame.size.height)];
        
        //设置Label的信息
        mesLabel.text = mesArr[i];
        mesLabel.textColor = [UIColor blackColor];
        mesLabel.font = [UIFont systemFontOfSize:font];
        
        //添加Label
        [labelView addSubview:mesLabel];
    }
    
    
    return labelView;
}


@end
