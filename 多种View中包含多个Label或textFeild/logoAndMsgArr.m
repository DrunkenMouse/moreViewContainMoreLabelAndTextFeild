//
//  logoAndMsgArr.m
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/7/1.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "logoAndMsgArr.h"

#define W   [UIScreen mainScreen].bounds.size.width

@interface logoAndMsgArr()
@property(nonatomic,assign)CGFloat buttonTag;

@end

@implementation logoAndMsgArr




-(instancetype)init{
    if (self = [super init]) {
        self.buttonTag = 0;
    }
    return self;
}

#pragma mark - 根据信息数组的count创建View中的提示信息数与内容
-(UIView *)createImgAndRect:(CGRect)rect andMsgArr:(NSArray *)array{
    
    //设置装载的View
    UIView *backView = [[UIView alloc]initWithFrame:rect];
    
    //创建临时保存信息的View
    UIView *msgView;
    for (int i = 0 ; i<array.count; i++) {
        
        //设置信息的View并添加到装载View
        msgView = [logoAndMsgArr createViewAndLogoAndButtonMsg:CGPointMake(10+rect.size.width/array.count*i, 0) AndMsg:array[i] AndLogo:nil andFont:14];
        [backView addSubview:msgView];
        
        //给信息添加一个可点击的按钮接收点击事件并处理
        UIButton *btn = [[UIButton alloc]initWithFrame:msgView.frame];
        btn.backgroundColor = [UIColor clearColor];
        //按钮通过tag值区分
        //tag值设为全局变量CGFloat类型，防止每次调用导致按钮的tag值相同
        btn.tag = ++self.buttonTag;
        [btn addTarget:self action:@selector(clickMsgBtn:) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:btn];
    }
    
    //通过自定义抽取的方法添加垂直分割线
    [logoAndMsgArr viewNeedVerLine:backView andLineNum:array.count-1];
    return backView;
    
}

#pragma mark - 左边一个Logo右边提示信息根据point、font与信息创建
+(UIView *)createViewAndLogoAndButtonMsg:(CGPoint)point AndMsg:(NSString *)str AndLogo:(UIImage *)img andFont:(CGFloat)font{
    
    //设置一个装载信息的View
    UIView *backView = [[UIView alloc]init];
    
    //设置左侧Logo，用按钮设置防止Logo要求点击
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(5, 8, 30, 30)];
    //如果没有Logo则设置背景颜色为黑色
    if (img==nil) {
        btn.backgroundColor = [UIColor blackColor];
    }else{
        [btn setImage:img forState:UIControlStateNormal];
    }
    //添加设置好的按钮
    [backView addSubview:btn];
    
    //根据字符串的内容获取一个size
    CGRect bounds = [str boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]} context:nil];
    //设置Label
    UILabel *msgLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(btn.frame)+5, 15, bounds.size.width, bounds.size.height)];
    msgLabel.text = str;
    msgLabel.textColor = [UIColor blackColor];
    msgLabel.font = [UIFont systemFontOfSize:font];
    //添加Label
    [backView addSubview:msgLabel];
    
    //设置装载信息的View的frame
    if (CGRectGetMaxY(msgLabel.frame)<CGRectGetMaxY(btn.frame)) {
        
        backView.frame = CGRectMake(point.x, point.y, CGRectGetMaxX(msgLabel.frame)+5, CGRectGetMaxY(btn.frame)+10);
        
    }else{
        
        backView.frame = CGRectMake(point.x, point.y, CGRectGetMaxX(msgLabel.frame)+5, CGRectGetMaxY(msgLabel.frame)+10);
        
    }
    
    
    //返回装载View
    return backView;
    
    
}


#pragma mark - 垂直分割线设置
+(void)viewNeedVerLine:(UIView *)view andLineNum:(NSInteger)num{
    
    CGFloat x = W/(num+1);
    for (NSInteger i=0; i<num; i++) {
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(x*(i+1), 5, 1, view.frame.size.height-10)];
        lineView.backgroundColor = [UIColor grayColor];
        [view addSubview:lineView];
    }
    
    
}

@end
