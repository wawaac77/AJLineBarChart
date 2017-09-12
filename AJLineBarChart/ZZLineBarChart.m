//
//  ZZLineBarChart.m
//  GFBS
//
//  Created by Alice Jin on 12/9/2017.
//  Copyright © 2017 apple. All rights reserved.
//

#import "ZZLineBarChart.h"


@interface ZZLineBarChart () {
    NSMutableArray *_upperChartLabels;
    NSMutableArray *_belowChartLabels;
}

@end


@implementation ZZLineBarChart


/*
+ (id)barWithFrame:(CGRect)frame colors:(NSMutableArray <UIColor *>*)colors nums:(NSMutableArray <NSNumber *> *)nums names:(NSMutableArray <NSString *> *)names {
    
    UIView *barView = [[UIView alloc] init];
    
    
    return barView;
}
*/

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupDefaultValues];
    }
    
    return self;
}

- (void)setupDefaultValues {
    NSLog(@"setUpDefaultValues");
    
}

- (void)setupUpperLabels:(NSMutableArray *)upperLabels {
    _upperLabels = upperLabels;
    if (_upperChartLabels) {
        [self viewCleanupForCollection:_upperChartLabels];
    } else {
        _upperChartLabels = [NSMutableArray alloc];
    }
    
    for (int i = 0; i < upperLabels.count; i++) {
        UILabel *label = [[UILabel alloc] init];
    }
    
    return;
    
}

- (void)setBarFrame:(CGRect)frame nums:(NSMutableArray<NSNumber *> *)nums colors:(NSMutableArray<UIColor *> *)colors {
    _nums = nums;
    _colors = colors;

    
    
    UIView *barView = [[UIView alloc] initWithFrame:frame];
    LLLayer *layer = [LLLayer layerWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) colors:colors nums:nums];
    [barView.layer addSublayer:layer];
    
    barView.layer.cornerRadius = 3.0f;
    barView.clipsToBounds = YES;
    
    [self addSubview:barView];
 
    return;
}

- (void)setBarFrame:(CGRect)frame nums:(NSMutableArray<NSNumber *> *)nums colors:(NSMutableArray<UIColor *> *)colors upperLabels:(NSMutableArray<NSString *> *)upperLabels {
    
    UIView *barView = [[UIView alloc] initWithFrame:frame];
    barView.layer.cornerRadius = 3.0f;
    barView.clipsToBounds = YES;
    
    LLLayer *layer = [LLLayer layerWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) colors:colors nums:nums];
    [barView.layer addSublayer:layer];
    [self addSubview:barView];
    
    CGFloat barWidth = frame.size.width;
    CGFloat barHeight = frame.size.height;
    CGFloat labelX = frame.origin.x;
    CGFloat labelY = frame.origin.y - 20;
    for (int i = 0; i < nums.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, barWidth * [nums[i] floatValue], barHeight)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"%.0f%%", [nums[i] floatValue]*100];
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:13];
        
        labelX = labelX + barWidth * [nums[i] floatValue];
        [self addSubview:label];
    }
    
    return;
}

- (void)setBarFrame:(CGRect)frame nums:(NSMutableArray<NSNumber *> *)nums colors:(NSMutableArray<UIColor *> *)colors upperLabels:(NSMutableArray<NSString *> *)upperLabels lowerLabels:(NSMutableArray<NSString *> *)lowerLabels {
    
    UIView *barView = [[UIView alloc] initWithFrame:frame];
    barView.layer.cornerRadius = 3.0f;
    barView.clipsToBounds = YES;
    
    LLLayer *layer = [LLLayer layerWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) colors:colors nums:nums];
    [barView.layer addSublayer:layer];
    [self addSubview:barView];
    
    CGFloat barWidth = frame.size.width;
    CGFloat barHeight = frame.size.height;
    CGFloat labelX = frame.origin.x;
    CGFloat labelY = frame.origin.y - 20;
    CGFloat labelY1 = frame.origin.y + barHeight;
    
    for (int i = 0; i < nums.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, barWidth * [nums[i] floatValue], barHeight)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"%.0f%%", [nums[i] floatValue]*100];
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:13];
        
        
        [self addSubview:label];
        
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY1, barWidth * [nums[i] floatValue], barHeight)];
        label1.textAlignment = NSTextAlignmentCenter;
        label1.text = lowerLabels[i];
        label1.textColor = [UIColor grayColor];
        label1.font = [UIFont systemFontOfSize:13];
        
        [self addSubview:label1];
        
        labelX = labelX + barWidth * [nums[i] floatValue];
    }
    
    return;
}


- (void)viewCleanupForCollection:(NSMutableArray *)array
{
    if (array.count) {
        [array makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [array removeAllObjects];
    }
}

@end
