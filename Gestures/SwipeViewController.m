//
//  SwipeViewController.m
//  Gestures
//
//  Created by Nicholas Fung on 2017-10-12.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = 370;
    CGFloat height = 50;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    UIView * view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor brownColor];
    view.clipsToBounds = true;
    [self.view addSubview:view];
    
    UIView *innerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, width, height)];
    innerView.backgroundColor = [UIColor whiteColor];
    [view addSubview:innerView];
    
    UISwipeGestureRecognizer *swipeRightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwiped:)];
    [swipeRightGesture setDirection:UISwipeGestureRecognizerDirectionRight];
    
    [innerView addGestureRecognizer:swipeRightGesture];
    
    UISwipeGestureRecognizer *swipeLeftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwiped:)];
    [swipeLeftGesture setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    [innerView addGestureRecognizer:swipeLeftGesture];
    
    
}

-(void)viewSwiped:(UISwipeGestureRecognizer *)sender {
    
    NSLog(@"Swiped");
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionLeft: {
            sender.view.center = CGPointMake(100.0, 25.0);
            break;
        }
            
        case UISwipeGestureRecognizerDirectionRight: {
            sender.view.center = CGPointMake(185.0, 25.0);
            break;
        }
            
        default:
            break;
    }
}







@end
