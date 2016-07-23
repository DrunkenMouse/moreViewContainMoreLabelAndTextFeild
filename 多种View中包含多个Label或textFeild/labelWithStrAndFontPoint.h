//
//  labelWithStrAndFontPoint.h
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/7/1.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import <UIKit/UIKit.h>

#define W   [UIScreen mainScreen].bounds.size.width
#define H   [UIScreen mainScreen].bounds.size.height


@interface labelWithStrAndFontPoint : UIView

#pragma mark - 通过传入的字符串、字体大小与坐标点和是否居中创建Label
+(UILabel *)sizeWithMessage:(NSString *)msgStr andFont:(NSInteger)font andPoint:(CGPoint)point andSelectedCenter:(BOOL)selected;

@end
