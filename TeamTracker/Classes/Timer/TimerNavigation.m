//
//  TimerNavigation.m
//  TeamTracker
//
//  Created by Nchinda Fam on 7/26/13.
//  Copyright (c) 2013 Plum. All rights reserved.
//

#import "TimerNavigation.h"

@implementation TimerNavigation

@synthesize clockTime;
@synthesize listTime;
@synthesize viewTime;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    clockTime = [self.storyboard instantiateViewControllerWithIdentifier:@"TimerNew"];
    listTime = [self.storyboard instantiateViewControllerWithIdentifier:@"TimerList"];
    viewTime = [self.storyboard instantiateViewControllerWithIdentifier:@"TimerView"];
    
    clockTime.timerMaster = self;
    listTime.timerMaster = self;
    viewTime.timerMaster = self;
    
    [self.view addSubview:[clockTime view]];
}

-(void) gotoNew
{
    for (UIView *subview in [self.view subviews])
        [subview removeFromSuperview];
    
    [self.view addSubview:[clockTime view]];
}

-(void) gotoList
{
    for (UIView *subview in [self.view subviews])
        [subview removeFromSuperview];
    
    [self.view addSubview:[listTime view]];
}

-(void) gotoView
{
    for (UIView *subview in [self.view subviews])
        [subview removeFromSuperview];
    
    viewTime.player = listTime.player;
    
    [self.view addSubview:[viewTime view]];
    [viewTime viewDidAppear:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
