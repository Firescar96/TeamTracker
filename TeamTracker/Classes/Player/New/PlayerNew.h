//
//  FirstViewController.h
//  PlayermerTracker
//
//  Created by Nchinda Fam on 1/13/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamTrackerAppDelegate.h"
#import "TextCell.h"

@class PlayerView;
@class PlayerList;

@interface PlayerNew : UIViewController<UITableViewDataSource, UITableViewDelegate> {
	
	TeamTrackerAppDelegate *dataMaster;
    NSArray *passedViewData;
    NSArray *passedListData;
    NSMutableArray *TFReload;
    
	IBOutlet UITextField *name;
    
    IBOutlet UITableView *tvMeet;
    IBOutlet UITextField *tfMeet;
    IBOutlet UITableView *tvEvent;
    IBOutlet UITextField *tfEvent;
	IBOutlet UITableView *tvScore;
    NSMutableArray *assign; //contains dictionary of meets and events
    
    int curMeet;
}
@property (nonatomic, retain) TeamTrackerAppDelegate *dataMaster;
@property (nonatomic, retain) NSArray *passedViewData;
@property (nonatomic, retain) NSArray *passedListData;

@property (nonatomic, retain) IBOutlet UITextField *name;

@property (nonatomic, retain) IBOutlet UITableView *tvMeet;
@property (nonatomic, retain) IBOutlet UITextField *tfMeet;
@property (nonatomic, retain) IBOutlet UITableView *tvEvent;
@property (nonatomic, retain) IBOutlet UITextField *tfEvent;
@property (nonatomic, retain) IBOutlet UITableView *tvScore;

-(void)setPassedValue:(NSArray *)mine andValue:(NSArray *)yours;

-(IBAction) backgroundTouched:(id)sender;
-(IBAction) addPlayer;
-(IBAction) addMeet;
-(IBAction) changeMeet:(id)sender;
-(IBAction) addEvent;
-(IBAction) changeEvent:(id)sender;
-(IBAction) changeScore:(id)sender;

-(IBAction)cellTouch:(id)sender;

@end