//
//  TimerNavigation.h
//  TeamTracker
//
//  Created by Nchinda Fam on 7/26/13.
//  Copyright (c) 2013 Plum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimerNew.h"
#import "TimerList.h"
#import "TimerView.h"

@interface TimerNavigation : UINavigationController
{
    TimerNew *clockTime;
    TimerList *listTime;
    TimerView *viewTime;
}

@property(nonatomic, retain) IBOutlet TimerNew *clockTime;
@property(nonatomic, retain) IBOutlet TimerList *listTime;
@property(nonatomic, retain) IBOutlet TimerView *viewTime;

-(void) gotoNew;
-(void) gotoList;
-(void) gotoView;

@end
