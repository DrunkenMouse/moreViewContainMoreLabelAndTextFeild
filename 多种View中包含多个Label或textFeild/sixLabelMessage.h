//
//  sixLabelMessage.h
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/6/30.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import <UIKit/UIKit.h>

#define W   [UIScreen mainScreen].bounds.size.width
#define H   [UIScreen mainScreen].bounds.size.height

#pragma mark - 有六个Label显示详细信息的View
@interface sixLabelMessage : UIView
//自定义方法返回一个带有五个Label信息的View
-(void)createViewAndMessasgeArr:(NSArray *)arr andPoint:(CGPoint)point;

@end
