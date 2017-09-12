//
//  LLLayer.h
//  Line
//
//  Created by liushaohua on 2017/9/11.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface LLLayer : CALayer


/**
 进度Layer

 @param frame layer的frame
 @param one 百分比
 @param two 百分比
 @param three 百分比
 @return layer
 */
+ (instancetype)layerWithFrame:(CGRect)frame one:(CGFloat)one two:(CGFloat)two three:(CGFloat)three;

+ (instancetype)layerWithFrame:(CGRect)frame colors:(NSMutableArray <UIColor *>*)colors nums:(NSMutableArray <NSNumber *> *)nums;

@end
