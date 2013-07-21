//
//  PlayerList.h
//  PlayermerTracker
//
//  Created by Nchinda Fam on 1/13/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TeamTrackerAppDelegate.h"

@class PlayerView;
@class PlayerNew;

@interface PlayerList : UIViewController<UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {

    TeamTrackerAppDelegate *dataMaster;
    NSArray *passedViewData;
    NSArray *passedListData;
    NSString *query;
    NSString *type;
    
    #pragma TableViewController
	IBOutlet UITableView *tvStat;
	
	NSMutableArray *foundPlay;
	NSMutableArray *names;
	NSMutableArray *meets;
	NSMutableArray *events;
	NSMutableArray *score;
    
    #pragma TableViewGestures
    IBOutlet UIGestureRecognizer *singRecog;
    IBOutlet UIGestureRecognizer *dubRecog;
    
    #pragma PickerViewController
    IBOutlet UIPickerView *pvStat;
    NSArray* status;
    
    #pragma PlayerView
    IBOutlet UISwitch *edit;
}
@property (nonatomic, retain) TeamTrackerAppDelegate *dataMaster;
@property (nonatomic, retain) NSArray *passedViewData;
@property (nonatomic, retain) NSArray *passedNewData;
@property (nonatomic, retain) NSString *query;
@property (nonatomic, retain) NSString *type;

#pragma TableViewController
@property (nonatomic, retain) IBOutlet UIPickerView *pvStat;
@property (nonatomic, retain) IBOutlet UITableView *tvStat;

@property (nonatomic, retain) NSMutableArray *foundPlay;

-(void)setPassedValue:(NSArray *)mine andValue:(NSArray *)yours;

-(IBAction)backgroundTouched:(id)sender;

-(void) findPlayer:(NSString *)play;

#pragma TableViewGestures
@property (nonatomic, retain) IBOutlet UIGestureRecognizer *singRecog;
@property (nonatomic, retain) IBOutlet UIGestureRecognizer *dubRecog;

-(IBAction)singleTapFrom:(UIGestureRecognizer *)recognizer;
-(IBAction)doubleTapFrom:(UIGestureRecognizer *)recognizer;;

#pragma PickerViewcController

#pragma PlayerView

@end
