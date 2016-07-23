//
//  logoAndMessage.m
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/6/29.
//  Copyright © 2016年 王奥东. All rights reserved.
//
#define W   [UIScreen mainScreen].bounds.size.width
#import "logoAndMessage.h"

@implementation logoAndMessage

#pragma mark 左侧为一个Logo，中间有一个Label或textFeild
+(UIView *) createImport:(NSString *)text AndFrame:(CGRect)rect AndPlaceholder:(NSString *)placeholder labelBool:(BOOL)selected{
    
    //信息输入框的主界面
    UIView *view = [[UIView alloc]initWithFrame:rect];
    view.backgroundColor = [UIColor whiteColor];
    
    //信息输入框中的文本信息
    //如果text有值，则创建一个Label放在左侧显示text内容
    //如果text没有值，则设置左侧Label的frame为(0,0,0,0)
    UILabel *label;
    if (text) {
        label = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 66, 44)];
        label.text = text;
        label.textColor = [UIColor blackColor];
        [label setFont:[UIFont systemFontOfSize:14]];
        [view addSubview:label];
    }
    else{
        label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    }
    
    
    //如果selected为YES，代表需要一个信息输入框textField
    if (selected) {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(label.frame.size.width+10, 0, W-label.frame.size.width-5, 44)];
        textField.placeholder = placeholder;
        [textField setFont:[UIFont systemFontOfSize:14]];
        [view addSubview:textField];
       
    }else{
        //否则用Label来代替信息输入框显示数据
        UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(label.frame.size.width+10, 0, W-label.frame.size.width-5, 44)];
        textLabel.text = placeholder;
        [textLabel setFont:[UIFont systemFontOfSize:14]];
        [view addSubview:textLabel];
        
    }
    
    return view;
}


@end
