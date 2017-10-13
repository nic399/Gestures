//
//  EdgeViewController.m
//  Gestures
//
//  Created by Nicholas Fung on 2017-10-12.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import "EdgeViewController.h"

@interface EdgeViewController ()

@property (nonatomic) UIScreenEdgePanGestureRecognizer *edgeGesture;
@property (nonatomic) UIPanGestureRecognizer *panGesture;
@property (nonatomic) CGRect initialFrame;
@property (nonatomic) CGRect finalFrame;

@end

@implementation EdgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.initialFrame = CGRectMake(380, self.view.center.y/2, 600, 400);
    self.finalFrame = CGRectMake(80, self.view.center.y/2, 600, 400);
    UIView *view = [[UIView alloc] initWithFrame:self.initialFrame];

    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    self.edgeGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePanned:)];
    self.edgeGesture.edges = UIRectEdgeRight;
    [view addGestureRecognizer:self.edgeGesture];
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewPanned:)];
}

-(void)viewPanned:(UIPanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateChanged: {
            CGPoint translationInView = [sender translationInView:self.view];
            CGPoint oldCenter = sender.view.center;
            CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y + translationInView.y);
            sender.view.center = newCenter;
            [sender setTranslation:CGPointZero inView:self.view];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            if (sender.view.frame.origin.x > self.view.frame.size.width/2) {
                sender.view.frame = self.initialFrame;
                [sender.view addGestureRecognizer:self.edgeGesture];
                [sender.view removeGestureRecognizer:self.panGesture];
                NSLog(@"Switching to screen edge pan...");
            }
            else {
                sender.view.frame = self.finalFrame;
            }
            break;
        }
        default:
            break;
    }
}

-(void)edgePanned:(UIScreenEdgePanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateChanged: {
            CGPoint translationInView = [sender translationInView:self.view];
            CGPoint oldCenter = sender.view.center;
            CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y + translationInView.y);
            sender.view.center = newCenter;
            [sender setTranslation:CGPointZero inView:self.view];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            if (sender.view.frame.origin.x < (self.view.frame.size.width-150.0)) {
                NSLog(@"Moved far enough");
                sender.view.frame = self.finalFrame;
                [sender.view addGestureRecognizer:self.panGesture];
                [sender.view removeGestureRecognizer:self.edgeGesture];
                NSLog(@"Switching to regular pan...");
            }
            else {
                sender.view.frame = self.initialFrame;
            }
            break;
        }
        default:
            break;
    }
}

@end
