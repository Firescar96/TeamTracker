//
//  PlayerList.h
//  PlayermerTracker
//
//  Created by Nchinda Fam on 1/13/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamTrackerAppDelegate.h"
#import "PlayerMaster.h"

@interface PlayerList : UIViewController<UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {

    #pragma TableViewController
	IBOutlet UIViewController *controller;
	TeamTrackerAppDelegate *appDelegate;
	
	IBOutlet UIPickerView *pvStat;
	IBOutlet UITableView *tvStat;
	
	NSMutableArray *foundReps;
	NSMutableArray *names;
	NSMutableArray *events;
	NSMutableArray *score;
	NSMutableArray *meets;
    
    #pragma PickerViewController
    NSArray* status;
    
    #pragma PlayerView
    PlayerViewMaster *viewMaster;
}

#pragma TableViewController
@property (nonatomic, retain) IBOutlet UIViewController *controller;
@property (nonatomic, retain) IBOutlet UIPickerView *pvStat;
@property (nonatomic, retain) IBOutlet UITableView *tvStat;

@property (nonatomic, retain) IBOutlet NSMutableArray *foundReps;

-(IBAction)backgroundTouched:(id)sender;
- (IBAction)buttonClicked:(id)sender;

-(void) findPlayer:(NSString *)query;
-(void)saveData;
-(void) displayReport:(NSIndexPath *)curInd;

#pragma PickerViewcController

#pragma PlayerView
@property (nonatomic, retain) IBOutlet PlayerViewMaster *viewMaster;

-(IBAction) changeEdit;
-(void) setEditable: (BOOL) able;

@end
