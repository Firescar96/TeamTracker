//
//  TimerList.h
//  PlayerTracker
//
//  Created by Nchinda Fam on 1/13/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TeamTrackerAppDelegate.h"
#import "TextCell.h"

@class TimerView;

@interface TimerList : UIViewController<UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {
    
    TeamTrackerAppDelegate *dataMaster;
    NSArray *passedViewData;
    NSString *query;
    NSString *type;
    
    UIViewController *timerMaster;
    
#pragma TableViewController
	IBOutlet UITableView *tvStat;
	
	NSMutableArray *foundPlay;
	NSMutableArray *names;
	NSMutableArray *maxTime;
	NSMutableArray *minTime;
    NSString *player;
    
#pragma TableViewGestures
    IBOutlet UIGestureRecognizer *singRecog;
    IBOutlet UIGestureRecognizer *dubRecog;
    
#pragma PickerViewController
    IBOutlet UIPickerView *pvStat;
    NSArray* status;
    
#pragma PlayerView
    IBOutlet UISegmentedControl *order;
    IBOutlet UISwitch *edit;
}

@property (nonatomic, retain) TeamTrackerAppDelegate *dataMaster;
@property (nonatomic, retain) NSArray *passedViewData;
@property (nonatomic, retain) NSString *query;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) UIViewController *timerMaster;

#pragma TableViewController
@property (nonatomic, retain) IBOutlet UIPickerView *pvStat;
@property (nonatomic, retain) IBOutlet UITableView *tvStat;

@property (nonatomic, retain) NSMutableArray *foundPlay;

@property (nonatomic, retain) NSString *player;

-(IBAction)backgroundTouched:(id)sender;

-(void) findPlayer:(NSString *)play;

#pragma TableViewGestures
@property (nonatomic, retain) IBOutlet UIGestureRecognizer *singRecog;
@property (nonatomic, retain) IBOutlet UIGestureRecognizer *dubRecog;

-(IBAction)singleTapFrom:(UIGestureRecognizer *)recognizer;
-(IBAction)doubleTapFrom:(UIGestureRecognizer *)recognizer;;

#pragma PlayerView
@property(nonatomic, retain) IBOutlet UISegmentedControl *order;
@property(nonatomic, retain) IBOutlet UISwitch *edit;

-(IBAction) gotoNew;
-(IBAction) gotoView;
-(IBAction) changeOrder;

@end
