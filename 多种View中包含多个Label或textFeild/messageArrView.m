//
//  messageArrView.m
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/6/29.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "messageArrView.h"

@implementation messageArrView

#pragma mark - 左侧有一个Logo，中间有四个展示信息，分别为两大两小 右侧为一个按钮的样式

-(void)setLogo:(UIImage *)logoImg andMessageArr:(NSArray <NSString *>*)messageArr{
    //使用Button设置左侧图标
    //若要求图标可以点击，则设置按钮的点击事件
    //若不要求图标的点击，则不设置点击事件
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 30, 30)];
    //若图标存在则显示图标，不存在则显示为灰色
    if (logoImg == nil) {
    
        leftBtn.backgroundColor = [UIColor grayColor];
    }else{
        
        leftBtn.imageView.image = logoImg;
    }
    [self addSubview:leftBtn];
    
    //手动设置四个Label
    //左上侧
    CGPoint point = CGPointMake(CGRectGetMaxX(leftBtn.frame)+5, 2);
    UILabel *topLabel = [self labelWithFont:13.0f andPoint:point andMessage:messageArr[0]];
    [self addSubview:topLabel];
    
    //右上侧
    CGPoint pointTwo = CGPointMake(CGRectGetMaxX(topLabel.frame)+2, topLabel.frame.origin.y+3);
    UILabel *topRightLabel = [self labelWithFont:10.0f andPoint:pointTwo andMessage:messageArr[1]];
    [self addSubview:topRightLabel];
    
    //左下侧
    CGPoint pointThree = CGPointMake(CGRectGetMaxX(leftBtn.frame)+5,CGRectGetMaxY(topLabel.frame)+2);
    UILabel *botLabel = [self labelWithFont:13.0f andPoint:pointThree andMessage:messageArr[2]];
    [self addSubview:botLabel];
    
    //右下侧
    CGPoint pointFour = CGPointMake(CGRectGetMaxX(topLabel.frame)+2, botLabel.frame.origin.y+3);
    UILabel *botRightLabel = [self labelWithFont:10.0f andPoint:pointFour andMessage:messageArr[3]];
    [self addSubview:botRightLabel];
    
    //用按钮的选中状态与否来显示当前银行卡是否被选中
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-80, 5, 30, 30)];
    //通过颜色生成图片
    [rightBtn setImage:[self createImageWithColor:[UIColor blackColor]] forState:UIControlStateNormal];
    [rightBtn setImage:[self createImageWithColor:[UIColor blueColor]] forState:UIControlStateSelected];
    self.rightButton = rightBtn;
    [self addSubview:rightBtn];
}

//通过颜色生成图片
-(UIImage*)createImageWithColor:(UIColor*)color{
    
    CGRect rect=CGRectMake(0.0f,0.0f,30,30);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context=UIGraphicsGetCurrentContext();CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage * theImage=UIGraphicsGetImageFromCurrentImageContext();UIGraphicsEndImageContext();
    
    return theImage;
    
}
//根据字体大小和位置与显示信息生成一个Label
-(UILabel *)labelWithFont:(float)font andPoint:(CGPoint)point andMessage:(NSString *)message {
    
    //自动计算Label所需的宽高
    CGSize size = [message sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}];
    //iOS9.0后为了避免出现“...”现象，需要将值向上取整
    CGSize adjustSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
    
    //根据传入的Point与信息的大小生成一个Label
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(point.x, point.y, adjustSize.width, adjustSize.height)];
    label.text = message;
    label.textColor = [UIColor blackColor];
    [label setFont:[UIFont systemFontOfSize:font]];
    
    return label;
    
}


@end
