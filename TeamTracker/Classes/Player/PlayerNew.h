//
//  FirstViewController.h
//  PlayermerTracker
//
//  Created by Nchinda Fam on 1/13/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamTrackerAppDelegate.h"

#import "PlayerSearch.h"
#import "PlayerList.h"
#import "TextCell.h"

@interface PlayerNew : UIViewController<UITableViewDataSource, UITableViewDelegate> {
	
	IBOutlet TeamTrackerAppDelegate *appDelegate;
	
	IBOutlet UITextField *name;
    
	IBOutlet PlayerSearch	*sSearch;
	IBOutlet PlayerList *sList;
    
    IBOutlet UITableView *tvMeet;
    IBOutlet UITextField *tfMeet;
    IBOutlet UITableView *tvEvent;
    IBOutlet UITextField *tfEvent;
	IBOutlet UITextField *tfScore;
    NSMutableArray *assign; //contains dictionary of meets and events
    
    int curMeet;
    int curEvent;
}
@property (nonatomic, retain) IBOutlet TeamTrackerAppDelegate *appDelegate;

@property (nonatomic, retain) IBOutlet UITextField *name;
@property (nonatomic, retain) IBOutlet UITextField *event;

@property (nonatomic, retain) IBOutlet PlayerSearch	*sSearch;
@property (nonatomic, retain) IBOutlet PlayerList *sList;

@property (nonatomic, retain) IBOutlet UITableView *tvMeet;
@property (nonatomic, retain) IBOutlet UITextField *tfMeet;
@property (nonatomic, retain) IBOutlet UITableView *tvEvent;
@property (nonatomic, retain) IBOutlet UITextField *tfEvent;
@property (nonatomic, retain) IBOutlet UITextField *tfScore;

-(IBAction)backgroundTouched:(id)sender;
-(IBAction)addPlayer;
-(IBAction)addMeet;
-(IBAction)addEvent;
@end