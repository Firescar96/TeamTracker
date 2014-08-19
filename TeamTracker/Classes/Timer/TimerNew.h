//
//  SecondViewController.h
//  SwimmerTracker
//
//  Created by Nchinda Fam on 1/13/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TeamTrackerAppDelegate.h"
#import "PlayerNameList.h"
#import "PlayerMeetList.h"
#import "PlayerEventList.h"
#import "TimerRow.h"

@class TimerList;

@interface TimerNew : UIViewController
{
    TeamTrackerAppDelegate *dataMaster;
    
    UIViewController *timerMaster;
    IBOutlet UIScrollView *sView;
    
    TimerRow *timerSplits;
    IBOutlet UIButton *save;
    IBOutlet UITextField *timeTitle;
    
    PlayerNameList *playerList;
    PlayerMeetList *meetList;
    PlayerEventList *eventList;
}
@property (nonatomic, retain) TeamTrackerAppDelegate *dataMaster;

@property (nonatomic, retain) UIViewController *timerMaster;
@property (nonatomic, retain) IBOutlet UIScrollView *sView;

@property (nonatomic, retain) TimerRow *timerSplits;
@property (nonatomic, retain) IBOutlet UIButton *save;
@property (nonatomic, retain) IBOutlet UITextField *timeTitle;

@property (nonatomic, retain) PlayerNameList *playerList;
@property (nonatomic, retain) PlayerMeetList *meetList;
@property (nonatomic, retain) PlayerEventList *eventList;

-(IBAction) resetClocks;
-(IBAction) saveClocks;
-(void) savePlayer:(id)sender;

#pragma PlayerView
-(IBAction) gotoList;
-(IBAction) gotoView;
@end
