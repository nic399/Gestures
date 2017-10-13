//
//  TapViewController.m
//  Gestures
//
//  Created by Nicholas Fung on 2017-10-12.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    UIView * view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [view addGestureRecognizer:tapGesture];
}

-(void)viewTapped:(UITapGestureRecognizer *)sender {
    sender.view.backgroundColor = [[UIColor purpleColor] isEqual:sender.view.backgroundColor] ? [UIColor orangeColor] : [UIColor purpleColor];
}





@end
