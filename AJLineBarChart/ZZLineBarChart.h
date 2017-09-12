//
//  ZZLineBarChart.h
//  GFBS
//
//  Created by Alice Jin on 12/9/2017.
//  Copyright © 2017 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "LLLayer.h"

@interface ZZLineBarChart : UIView

//+ (id)barWithFrame:(CGRect)frame colors:(NSMutableArray <UIColor *>*)colors nums:(NSMutableArray <NSNumber *> *)nums names:(NSMutableArray <NSString *> *)names;


@property (nonatomic, strong) NSMutableArray<UIColor *> * colors;
@property (nonatomic, strong) NSMutableArray<NSString *> * names;
@property (nonatomic, strong) NSMutableArray<NSNumber *> * nums;

@property (nonatomic, strong) NSMutableArray * upperLabels;

- (void)setBarFrame:(CGRect)frame nums:(NSMutableArray<NSNumber *> *)nums colors:(NSMutableArray<UIColor *> *)colors;

- (void)setBarFrame:(CGRect)frame nums:(NSMutableArray<NSNumber *> *)nums colors:(NSMutableArray<UIColor *> *)colors upperLabels:(NSMutableArray<NSString *> *)upperLabels;

- (void)setBarFrame:(CGRect)frame nums:(NSMutableArray<NSNumber *> *)nums colors:(NSMutableArray<UIColor *> *)colors upperLabels:(NSMutableArray<NSString *> *)upperLabels lowerLabels:(NSMutableArray<NSString *> *)lowerLabels;


@end
