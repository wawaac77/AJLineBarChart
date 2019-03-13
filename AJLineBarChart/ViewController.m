//
//  ViewController.m
//  AJLineBarChart
//
//  Created by Alice Jin on 12/9/2017.
//  Copyright © 2017 Alice Jin. All rights reserved.
//

#import "ViewController.h"
#import "ZZLineBarChart.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = [UIScreen mainScreen].bounds;
    
    NSMutableArray *colors =[[NSMutableArray alloc] initWithObjects:[UIColor darkGrayColor],[UIColor blueColor], [UIColor yellowColor],[UIColor purpleColor], [UIColor grayColor], nil];
    NSMutableArray *nums =[[NSMutableArray alloc] initWithObjects:@0.2, @0.35, @0.28, @0.12, @0.05, nil];
    NSMutableArray *lowerLabels =[[NSMutableArray alloc] initWithObjects:@"0-19", @"20-35", @"36-45", @"46-65", @"66+", nil];
    
    ZZLineBarChart *barChart = [[ZZLineBarChart alloc] init];
    [barChart setBarFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, 20) nums:nums colors:colors upperLabels:NULL lowerLabels:lowerLabels];
    
    [self.view addSubview:barChart];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
