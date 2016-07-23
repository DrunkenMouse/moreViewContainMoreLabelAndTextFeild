//
//  logoAndMessage.h
//  多种View中包含多个Label或textFeild
//
//  Created by 王奥东 on 16/6/29.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface logoAndMessage : UIView
#pragma mark 左侧为一个Logo，中间有一个Label或textFeild
+(UIView *) createImport:(NSString *)text AndFrame:(CGRect)rect AndPlaceholder:(NSString *)placeholder labelBool:(BOOL)selected;

@end
