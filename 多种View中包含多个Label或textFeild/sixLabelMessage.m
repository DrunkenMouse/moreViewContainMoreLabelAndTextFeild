//
//  sixLabelMessage.m
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/6/30.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "sixLabelMessage.h"

@implementation sixLabelMessage


#pragma mark - 有六个Label显示详细信息的View
//自定义方法返回一个带有五个Label信息的View
-(void)createViewAndMessasgeArr:(NSArray *)arr andPoint:(CGPoint)point{
    
    //为统一设置，将View中的Label信息分为左右两种
    //左边的Label为第一种
    UILabel *oneLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    //右边的Label为第二种
    UILabel *twoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    //通过遍历传过来的数组信息创建Label并设置内容
    //内容前三个为左边的Label信息，后两个为右边的Label信息
    for (int i = 0; i<arr.count; i++) {
        //左边的三种
        if (i<3) {
            //创建并设置Label并保存，用于之后的设计
            UILabel *labelOne = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(oneLabel.frame)+5, 200, 40)];
            labelOne.text = arr[i];
            
            oneLabel = labelOne;
            //添加创建好的Label
            [self addSubview:labelOne];
            
        }else if(i==3){
            //右边第一种Label的宽度要根据内容的填充而变化
            //所以要单独创建，但为了统一设置，仍用labelTwo保存一下
            
            //固定高度的情况下算出所需宽度
            CGSize size = [arr[i] sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:CGSizeMake(MAXFLOAT, 35)];
            CGSize adjustSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
            //创建并设置Label
            UILabel *labelTwo = [[UILabel alloc]initWithFrame:CGRectMake(W-30-adjustSize.width,CGRectGetMaxY(twoLabel.frame)+30, adjustSize.width, 35)];
            labelTwo.text = arr[i];
            //保存并添加Label
            twoLabel = labelTwo;
            [self addSubview:labelTwo];
            
        }else{
            //最后一个表示时间的Label
            UILabel *labelTwo = [[UILabel alloc]initWithFrame:CGRectMake(W-100,CGRectGetMaxY(twoLabel.frame)+30, 80, 35)];
            labelTwo.text = arr[i];
            twoLabel = labelTwo;
            
            [self addSubview:labelTwo];
        }
        //统一设置右边两个Label的字体大小为13
        twoLabel.font = [UIFont systemFontOfSize:13];
    }
    
    //设置完Label后根据内容与传过来的Point设置自身的大小
    self.frame = CGRectMake(point.x, point.y, W, CGRectGetMaxY(oneLabel.frame));
    
    //添加一个边框
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 1;
    
    
}

@end
