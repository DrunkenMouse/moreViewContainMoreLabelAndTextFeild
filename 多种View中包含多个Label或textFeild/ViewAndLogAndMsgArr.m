
//
//  ViewAndLogAndMsgArr.m
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/7/1.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ViewAndLogAndMsgArr.h"
#define W   [UIScreen mainScreen].bounds.size.width
#define H   [UIScreen mainScreen].bounds.size.height

@implementation ViewAndLogAndMsgArr

#pragma mark - 2个固定Label信息3个可变Label信息1个Logo1个按钮的模板
-(UIView *)setViewWithMsgArray:(NSArray *)array andPoint:(CGPoint)point{
    
    //创建一个信息载体View
    UIView *backView = [[UIView alloc]init];
    
    //创建如建信货币信息
    UIView *topView = [self setViewWithLogo:nil andMessage:array[0] andRect:CGRectMake(5, 5, W, 30)];
    [backView addSubview:topView];
    
    //创建载体View中的分割线
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(20, 50, W-40, 1)];
    lineView.backgroundColor = [UIColor blackColor];
    [backView addSubview:lineView];
    
    //创建“资产”信息
    UIView *asstsView = [self sizeWithMessage:@"资产" andFont:13 andPoint:CGPointMake(20, CGRectGetMaxY(lineView.frame)+15) andSelectedCenter:NO];
    [backView addSubview:asstsView];
    
    //创建资产金额的信息
    UIView *moneyView = [self sizeWithMessage:array[1] andFont:13 andPoint:CGPointMake(CGRectGetMaxX(asstsView.frame)+5, asstsView.frame.origin.y) andSelectedCenter:NO];
    [backView addSubview:moneyView];
    
    //创建“昨日收益”信息
    UIView *yesterView = [self sizeWithMessage:@"昨日收益" andFont:13 andPoint:CGPointMake(W-150, moneyView.frame.origin.y) andSelectedCenter:NO];
    [backView addSubview:yesterView];
    
    //创建昨日收益金额的信息
    UIView *yesterAddView = [self sizeWithMessage:array[2] andFont:13 andPoint:CGPointMake(CGRectGetMaxX(yesterView.frame)+5, yesterView.frame.origin.y) andSelectedCenter:NO];
    [backView addSubview:yesterAddView];
    
    //设置载体View的frame为昨日收益金额下+5距离
    backView.frame = CGRectMake(point.x, point.y, W, CGRectGetMaxY(yesterAddView.frame)+5);
    
    //返回载有信息的View
    return backView;
}
#pragma mark - 通过传入的字符串与字体大小计算所需的Label宽高
-(UILabel *)sizeWithMessage:(NSString *)msgStr andFont:(NSInteger)font andPoint:(CGPoint)point andSelectedCenter:(BOOL)selected{
    
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

#pragma mark - 创建左边是Logo 中间为Label 右边为按钮的View
-(UIView *)setViewWithLogo:(UIImage *)img andMessage:(NSString *)message andRect:(CGRect)rect {
    
    //创建主界面View
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)];
    
    //创建左侧Logo标志，使用按钮设置以免被要求除法点击事件
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 33, 33)];
    
    //如果没有Logo标志，则将按钮的北京颜色设置为黑色
    if (img==nil) {
        leftBtn.backgroundColor = [UIColor blackColor];
    }else{
        [leftBtn setImage:img forState:UIControlStateNormal];
    }
    
    [view addSubview:leftBtn];
    
    
    //自动计算中间信息的长度与高度
    CGSize size = [message sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    CGSize adjustSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
    
    //定义中间信息的rect
    CGRect midRect = CGRectMake(CGRectGetMaxX(leftBtn.frame)+10, 15, adjustSize.width, adjustSize.height);
    
    
    //设置中间信息的Label
    UILabel *midLabel = [[UILabel alloc]initWithFrame:midRect];
    midLabel.text = message;
    midLabel.textColor = [UIColor blackColor];
    [midLabel setFont:[UIFont systemFontOfSize:14]];
    [view addSubview:midLabel];
    
    
    //设置右侧按钮并添加
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(rect.size.width-66-20, 5, 66, 33)];
    //普通状态是黑色，选中状态为蓝色
    [rightBtn setImage:[self createImageWithColor:[UIColor blackColor]] forState:UIControlStateNormal];
    [rightBtn setImage:[self createImageWithColor:[UIColor blueColor]] forState:UIControlStateSelected];
    [view addSubview:rightBtn];
    
    //返回载有按钮的View
    return view;
    
}
#pragma mark - 通过颜色生成图片
-(UIImage*)createImageWithColor:(UIColor*)color{
    
    CGRect rect=CGRectMake(0.0f,0.0f,30,30);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context=UIGraphicsGetCurrentContext();CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage * theImage=UIGraphicsGetImageFromCurrentImageContext();UIGraphicsEndImageContext();
    
    return theImage;
    
}

@end
