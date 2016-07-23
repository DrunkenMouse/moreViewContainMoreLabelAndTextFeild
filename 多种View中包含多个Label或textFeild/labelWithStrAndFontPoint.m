//
//  labelWithStrAndFontPoint.m
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/7/1.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "labelWithStrAndFontPoint.h"

@implementation labelWithStrAndFontPoint

#pragma mark - 通过传入的字符串、字体大小与坐标点和是否居中创建Label
//如果需要根据坐标点往左创建Label,则先获取返回的Label再重新设置X为View的宽度-Label的宽度

+(UILabel *)sizeWithMessage:(NSString *)msgStr andFont:(NSInteger)font andPoint:(CGPoint)point andSelectedCenter:(BOOL)selected{
    
    //通过传入的字符串与字体大小计算所需的Label宽高
    //最大宽度为屏幕的宽
    CGRect Bounds = [msgStr boundingRectWithSize:CGSizeMake(W, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]} context:nil];
    
    //用来动态保存创建的Label
    UILabel *label;
    //若要求居中，则让Label的位置为整个屏幕的中间
    if (selected) {
        //只能设置为整个屏幕的中间位置
        label  = [[UILabel alloc]initWithFrame:CGRectMake(W/2 - Bounds.size.width/2, point.y, Bounds.size.width, Bounds.size.height)];
        
    }else{
        //不居中时则通过传入的点与计算出的size创建Label

        label = [[UILabel alloc]initWithFrame:CGRectMake(point.x, point.y, Bounds.size.width, Bounds.size.height)];
    }
    //设置Label内容与字体大小
    label.text = msgStr;
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:font];
    
    return label;
}

@end
