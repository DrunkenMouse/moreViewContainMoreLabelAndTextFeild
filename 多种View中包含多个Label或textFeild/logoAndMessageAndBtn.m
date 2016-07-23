//
//  logoAndMessageAndBtn.m
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/6/29.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "logoAndMessageAndBtn.h"

@implementation logoAndMessageAndBtn

#pragma mark - 左边为Logo,中间只有一个textFeild或label时,右侧为按钮,按钮有默认和描述信息样式
+(UIView *)setViewWithLogo:(UIImage *)img andMessage:(NSString *)message andRightMessage:(NSString *)rightMsg andRect:(CGRect)rect andTextFieldSelected:(BOOL)selcted{
    
    //创建主界面View
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)];
    
    //创建左侧Logo标志，使用按钮设置以免被要求除法点击事件
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 33, 33)];
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
    
    //如果selcted为YES,则中间信息为textField的placeholder
    //如果selcted为NO，则中间信息为Label展示
    if (selcted) {
        UITextField *textField = [[UITextField alloc]initWithFrame:midRect];
        textField.placeholder = message;
        [textField setFont:[UIFont systemFontOfSize:14]];
        [view addSubview:textField];
        //        textField.delegate = self;
    }else{
        //若中间信息用Label展示，则还需创建一个覆盖当前View的按钮
        //使用此按钮来响应点击事件确认选择等
        UILabel *midLabel = [[UILabel alloc]initWithFrame:midRect];
        midLabel.text = message;
        midLabel.textColor = [UIColor blackColor];
        [midLabel setFont:[UIFont systemFontOfSize:14]];
        [view addSubview:midLabel];
        
        //创建一个按钮覆盖当前View，用按钮响应点击事件
        UIButton *clickBtn = [[UIButton alloc]initWithFrame:view.bounds];
        [clickBtn addTarget:self action:@selector(clickTakenBtn:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:clickBtn];
    }
    
    
    //设置右侧按钮
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(rect.size.width-66-20, 5, 66, 33)];
    //如果右侧按钮有文字描述则设置为文字描述
    //如果没有则设置为普通状态
    if (rightMsg.length > 0) {
        
        [rightBtn setTitle:rightMsg forState:UIControlStateNormal];
        [rightBtn setFont:[UIFont systemFontOfSize:12]];
        [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }else{
        [rightBtn setImage:[self createImageWithColor:[UIColor blackColor]] forState:UIControlStateNormal];
        [rightBtn setImage:[self createImageWithColor:[UIColor blueColor]] forState:UIControlStateSelected];
        
    }
    
    [view addSubview:rightBtn];
    
    
    
   
    
    return view;
    
}

//通过颜色生成图片
+(UIImage*)createImageWithColor:(UIColor*)color{
    
    CGRect rect=CGRectMake(0.0f,0.0f,30,30);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context=UIGraphicsGetCurrentContext();CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage * theImage=UIGraphicsGetImageFromCurrentImageContext();UIGraphicsEndImageContext();
    
    return theImage;
    
}
//按钮的点击事件
-(void)clickTakenBtn:(UIButton *)sender{
    NSLog(@"clickTakenBtn");
}
@end
