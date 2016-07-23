//
//  ViewAndLogAndMsgArr.h
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/7/1.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewAndLogAndMsgArr : UIView

#pragma mark - 2个固定Label信息3个可变Label信息1个Logo1个按钮的模板
-(UIView *)setViewWithMsgArray:(NSArray *)array andPoint:(CGPoint)point;
@end
