//
//  ViewController.m
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/6/29.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ViewController.h"
#import "logoAndMessage.h"
#import "logoAndMessageAndBtn.h"
#import "messageArrView.h"
#import "sixLabelMessage.h"
#import "mutableLabelWithRect.h"
#import "labelWithStrAndFontPoint.h"
#import "logoAndMsgArr.h"
#import "ViewAndLogAndMsgArr.h"

#define W   [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@end
/**
 *  页面的展示可以通过此几种模式彼此组合展示
 *  比如提示信息的数量可在原有基础上进行增减
 *  或对某个View添加点击事件等
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    
    
#pragma mark - 左侧为一个Logo，中间有一个Label或textFeild
    //中间为Label
    UIView *logoMessage = [logoAndMessage createImport:@"建信货币" AndFrame:CGRectMake(2, 66, W-4, 44) AndPlaceholder:@"test" labelBool:NO];
    
    //中间为textFeild
    UIView *logoMessage2 = [logoAndMessage createImport:@"建信货币" AndFrame:CGRectMake(2, 66+44+20, W-4, 44) AndPlaceholder:@"test" labelBool:YES];
    
   
    
    
    
    
#pragma mark - 左边为Logo,中间只有一个textFeild或label时,右侧为按钮,按钮有默认和描述信息样式
    //中间为textFeild
    UIView *taken = [logoAndMessageAndBtn setViewWithLogo:nil andMessage:@"最多取出XXXXXX元" andRightMessage:@"全部取出" andRect:CGRectMake(2, 66+44+44+40, W-4, 44) andTextFieldSelected:YES];

   
    //左边有Logo,中间为Label,右侧按钮为描述信息
    UIView *taken2 = [logoAndMessageAndBtn setViewWithLogo:nil andMessage:@"最多取出XXXXXX元" andRightMessage:@"全部取出" andRect:CGRectMake(2, 66+44+44+44+60, W-4, 44) andTextFieldSelected:NO];
  
    //左边有Logo,中间为Label,右侧按钮为默认
    UIView *taken3 = [logoAndMessageAndBtn setViewWithLogo:nil andMessage:@"最多取出XXXXXX元" andRightMessage:nil andRect:CGRectMake(2, 66+44+44+44+44+60, W-4, 44) andTextFieldSelected:NO];
   
    
    
    
    
    
#pragma mark - 左侧有一个Logo，中间有四个展示信息，分别为两大两小 右侧为一个按钮的样式
    messageArrView *mesArrView = [[messageArrView alloc]initWithFrame:CGRectMake(2, 66+44+44+44+44+44+80, W-4, 44)];
    //设置展示信息，信息按照一大一小格式
    NSArray *array = @[@"招商银行",@"尾号1010",@"可赎回:",@"xxx元"];
    [mesArrView setLogo:nil andMessageArr:array];
    
    
    
    
    
#pragma mark - 有六个Label显示详细信息的View
    sixLabelMessage *botMsgView = [[sixLabelMessage alloc]init];
    NSArray *arr = @[@"赎回",@"建信保本5号(11111111)",@"交易状态:确认中",@"20000.00元",@"2016-05-12"];
    [botMsgView createViewAndMessasgeArr:arr andPoint:CGPointMake(0, CGRectGetMaxY(mesArrView.frame)+20)];
    
    
    
    
#pragma mark - 通过传入的rect、信息数组、字体大小动态创建一个包含Lable的View
    mutableLabelWithRect *labelWithRect = [[mutableLabelWithRect alloc]init];
    NSArray *timeArr = @[@"需要几个",@"那就几个",@"平均分配",@"只需Rect"];
    UIView *labelWithRectView = [labelWithRect creteCountLabel:CGRectMake(2, CGRectGetMaxY(botMsgView.frame)+20, W-20, 20) andMessageArr:timeArr andFont:14];
    labelWithRectView.layer.borderWidth = 2;
    

    




#pragma mark - 通过传入的字符串、字体大小与坐标点和是否居中创建Label
    UILabel *strFontAndNoCenterLabel = [labelWithStrAndFontPoint sizeWithMessage:@"不居中创建的Label,通过传入的字符串、字体大小与坐标点计算得出" andFont:15 andPoint: CGPointMake(2, CGRectGetMaxY(labelWithRectView.frame)+20) andSelectedCenter:NO];
   
    
    UILabel *strFontAndCenterLabel = [labelWithStrAndFontPoint sizeWithMessage:@"居中时创建的Label" andFont:15 andPoint: CGPointMake(2, CGRectGetMaxY(strFontAndNoCenterLabel.frame)+20) andSelectedCenter:YES];
    
    
    
   
    
    
#pragma mark - 根据信息数组的count创建View中的提示信息数与内容
     NSArray *arr4 = @[@"银行卡 1张",@"风险测评 保守型"];
    logoAndMsgArr * logoAndMgArrs = [[logoAndMsgArr alloc]init];
    UIView *logoView = [logoAndMgArrs createImgAndRect:CGRectMake(0, CGRectGetMaxY(strFontAndCenterLabel.frame)+10, W, 44) andMsgArr:arr4];
    logoView.layer.borderColor = [UIColor blackColor].CGColor;
    logoView.layer.borderWidth = 2;
    
    
#pragma mark - 左边一个Logo右边提示信息根据point、font与信息创建   
    UIView *logoView2 = [logoAndMsgArr createViewAndLogoAndButtonMsg:CGPointMake(0, CGRectGetMaxY(logoView.frame)+10) AndMsg:@"我的客户号" AndLogo:nil andFont:14];
    logoView2.layer.borderColor = [UIColor blackColor].CGColor;
    logoView2.layer.borderWidth = 2;
    

    
    
    
#pragma mark - 2个固定Label信息3个可变Label信息1个Logo1个按钮的模板
    NSArray *arr3 = @[@"建信货币 (1212121)",@"20000.00元",@"+20.00元"];
    ViewAndLogAndMsgArr *ViewAndLogAndMsgArrView= [[ViewAndLogAndMsgArr alloc]init];
    UIView *ViewAndLogAndMsgArrs = [ViewAndLogAndMsgArrView setViewWithMsgArray:arr3 andPoint:CGPointMake(0, CGRectGetMaxY(logoView2.frame)+20)];
    ViewAndLogAndMsgArrs.layer.borderWidth = 2;
    ViewAndLogAndMsgArrs.layer.borderColor = [UIColor purpleColor].CGColor;
    

    
    
    
    
    
    
    
    //边框的设置可以通过View的layer属性设置完成，方法只是随便写写
    //   设置边框宽度 self.view.layer.borderWidth
    //   设置边框颜色 self.view.layer.borderColor
    
    //给View添加分割线
    [self createLine:logoMessage];
    [self createLine:logoMessage2];
    [self createLine:taken];
    [self createLine:taken2];
    [self createLine:mesArrView];
    [self createLine:taken3];

    

    
    //添加创建的View
    [scrollView addSubview:logoMessage];
    [scrollView addSubview:logoMessage2];
    [scrollView addSubview:taken];
    [scrollView addSubview:taken2];
    [scrollView addSubview:taken3];
    [scrollView addSubview:mesArrView];
    [scrollView addSubview:botMsgView];
    [scrollView addSubview:labelWithRectView];
    [scrollView addSubview:strFontAndNoCenterLabel];
    [scrollView addSubview:strFontAndCenterLabel];
    [scrollView addSubview:logoView];
    [scrollView addSubview:logoView2];
    [scrollView addSubview:ViewAndLogAndMsgArrs];
    
    
    //设置scrollView的偏移量并添加
    scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(ViewAndLogAndMsgArrs.frame)+20);
    [self.view addSubview:scrollView];
}

#pragma mark - 垂直分割线设置
//    通过类方法调用，传入要加分割线的View与分割线的数量
//    logoAndMsgArr viewNeedVerLine:<#(UIView *)#> andLineNum:<#(NSInteger)#>

#pragma mark - 随便写写的方法，给View创建上下左右分割线
-(void)createLine:(UIView *)View{
    
    //创建左分割线并添加
    UIView *leftLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 1, View.frame.size.height)];
    leftLine.backgroundColor = [UIColor grayColor];
    [View addSubview:leftLine];
    
    //创建右分割线并添加
    UIView *rightLine = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(View.frame)-1, 0, 1, View.frame.size.height)];
    rightLine.backgroundColor = [UIColor grayColor];
    [View addSubview:rightLine];
    
    //信息输入框的上分割线
    UIView *topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, View.frame.size.width+View.frame.origin.x,1)];
    topLine.backgroundColor = [UIColor blackColor];
    [View addSubview:topLine];
    
    //信息输入框的下分割线
    UIView *botLine = [[UIView alloc]initWithFrame:CGRectMake(0, View.frame.size.height, View.frame.size.width+View.frame.origin.x, 1)];
    botLine.backgroundColor = [UIColor blackColor];
    [View addSubview:botLine];
    
}




@end
