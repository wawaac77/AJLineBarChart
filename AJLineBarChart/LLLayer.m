//
//  LLLayer.m
//  Line
//
//  Created by liushaohua on 2017/9/11.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "LLLayer.h"

@implementation LLLayer

+ (instancetype)layerWithFrame:(CGRect)frame one:(CGFloat)one two:(CGFloat)two three:(CGFloat)three{
    
    
    LLLayer *layer = [[LLLayer alloc]init];
    //layer.frame = frame;
    layer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        
    // 创建path
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 添加路径[1条点(100,100)到点(200,100)的线段]到path
    
    //    假设总长度 300;
    CGFloat allLength = frame.size.width;
    NSLog(@"allLength %f", allLength);
    CGFloat height = frame.size.height;
    NSLog(@"height %f", height);
    
    CAShapeLayer *oneLayer = [CAShapeLayer new];
    
    CGFloat startPointX = frame.origin.x;
    startPointX = 0;
    //CGFloat startPointY = frame.origin.y;
    NSLog(@"startPointX %f", startPointX);
    
    // 起点
    [path moveToPoint:CGPointMake(-startPointX, 0)];
    [path addLineToPoint:CGPointMake(allLength * one - startPointX, 0)];
    oneLayer.path = path.CGPath;
    oneLayer.frame = layer.frame;
    oneLayer.lineWidth = height;
    oneLayer.fillColor = nil;
    oneLayer.strokeColor = [UIColor redColor].CGColor;
    
    
    UIBezierPath *twopath = [UIBezierPath bezierPath];
    CAShapeLayer *twoLayer = [CAShapeLayer new];
    [twopath moveToPoint:CGPointMake(0 + allLength * one - startPointX, 0)];
    [twopath addLineToPoint:CGPointMake( allLength * one +allLength * two - startPointX, 0)];
    twoLayer.path = twopath.CGPath;
    twoLayer.frame = layer.frame;
    twoLayer.lineWidth=height;
    twoLayer.fillColor = nil;
    twoLayer.strokeColor = [UIColor yellowColor].CGColor;
    
    
    UIBezierPath *threepath = [UIBezierPath bezierPath];
    CAShapeLayer *threeLayer = [CAShapeLayer new];
    [threepath moveToPoint:CGPointMake(allLength * (one + two) - startPointX, 0)];
    [threepath addLineToPoint:CGPointMake(allLength - startPointX, 0)];
    threeLayer.path = threepath.CGPath;
    threeLayer.frame = layer.frame;
    NSLog(@"threeLayer.frame.width %f", threeLayer.frame.size.width);
    threeLayer.lineWidth=height;
    threeLayer.fillColor = nil;
    threeLayer.strokeColor = [UIColor blueColor].CGColor;
        
    
    [layer addSublayer:oneLayer];
    [layer addSublayer:twoLayer];
    [layer addSublayer:threeLayer];
    
    return layer;
}

+ (instancetype)layerWithFrame:(CGRect)frame colors:(NSMutableArray <UIColor *>*)colors nums:(NSMutableArray <NSNumber *> *)nums {
    
    LLLayer *layer = [[LLLayer alloc]init];
    //layer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    layer.frame = frame;
    layer.cornerRadius = 5.0f;
    
    CGFloat allLength = frame.size.width;
    CGFloat height = frame.size.height;
    CGFloat startPointX = frame.origin.x;
    //CGFloat startPointX = 0;
    
    CGFloat sum = 0;

    for (int i = 0; i < nums.count; i++) {
        // 创建path
        UIBezierPath *path = [UIBezierPath bezierPath];
        CAShapeLayer *oneLayer = [CAShapeLayer new];
        
        // 起点
        [path moveToPoint:CGPointMake(sum * allLength - startPointX , 0)];
        sum = sum + [nums[i] floatValue];
        [path addLineToPoint:CGPointMake(allLength * sum - startPointX, 0)];
        oneLayer.path = path.CGPath;
        oneLayer.frame = frame;
        oneLayer.lineWidth = height * 2;
        oneLayer.fillColor = nil;
        oneLayer.strokeColor = colors[i].CGColor;
        
        [layer addSublayer:oneLayer];
    }
    
    return layer;

}

@end
