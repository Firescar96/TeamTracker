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
#import "TimerRow.h"

@interface TimerView : UIViewController
{
    IBOutlet UIScrollView *sView;
    
    TimerRow *timerSplits;
    IBOutlet UIButton *reset;
    
    PlayerNameList *playerList;
}
@property (nonatomic, retain) IBOutlet UIScrollView *sView;

@property (nonatomic, retain) TimerRow *timerSplits;
@property (nonatomic, retain) IBOutlet UIButton *reset;

@property (nonatomic, retain) PlayerNameList *playerList;

-(IBAction) resetClocks;
-(IBAction) saveClocks;
@end
