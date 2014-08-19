//
//  TimerView.h
//  TeamTracker
//
//  Created by Nchinda Fam on 7/7/13.
//  Copyright (c) 2013 Plum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TeamTrackerAppDelegate.h"
#import "UIDropDownMenu.h"
#import "TextCell.h"

@interface TimerView : UIViewController
{
    TeamTrackerAppDelegate *dataMaster;
    
    UIViewController *timerMaster;
    
    NSMutableArray *assign;//contains dictionary of meets and events
    
#pragma mark -
#pragma mark ViewPage
    
    NSString *player;
    NSMutableArray *titles;
    NSMutableArray *times;
    NSMutableArray *meets;
    NSMutableArray *events;
    
    UIDropDownMenu *meetMenu;
    UIDropDownMenu *eventMenu;
    
#pragma mark -
#pragma mark EditPage
    
	IBOutlet UILabel *name;
    
    IBOutlet UITableView *tvTime;
    IBOutlet UITextField *tfTime;
    IBOutlet UIButton *bTime;
}

#pragma mark -
#pragma mark ViewPage
@property (nonatomic, retain) UIViewController *timerMaster;
@property (nonatomic, retain) NSString *player;

#pragma mark -
#pragma mark EditPage
@property (nonatomic, retain) IBOutlet UILabel *name;

@property (nonatomic, retain) IBOutlet UITableView *tvTime;
@property (nonatomic, retain) IBOutlet UITextField *tfTime;
@property (nonatomic, retain) IBOutlet UIButton *bTime;

-(IBAction) backgroundTouched:(id)sender;
-(IBAction) addTime;
-(IBAction) changeTime:(id)sender;

-(IBAction)cellTouch:(id)sender;

@end
