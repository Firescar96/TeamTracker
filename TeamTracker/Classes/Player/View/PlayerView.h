//
//  PlayerView.h
//  TeamTracker
//
//  Created by Nchinda Fam on 7/7/13.
//  Copyright (c) 2013 Plum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamTrackerAppDelegate.h"
#import "UIDropDownMenu.h"

@class PlayerNew;
@class PlayerList;

@interface PlayerView : UIViewController
{
    TeamTrackerAppDelegate *dataMaster;
    NSArray *passedNewData;
    NSArray *passedListData;
    
    NSMutableArray *assign;//contains dictionary of meets and events
    
    #pragma mark -
    #pragma mark ViewPage
    
    IBOutlet UIView *viewPage;
    
    IBOutlet UITableView *tvStat;
    
    NSString *player;
    NSMutableArray *names;
	NSMutableArray *meets;
	NSMutableArray *events;
	NSMutableArray *score;
    
    UIDropDownMenu *eventMenu;
    UIDropDownMenu *scoreMenu;
    
    #pragma mark -
    #pragma mark EditPage
    IBOutlet UIView *editPage;
    
    NSMutableArray *TFReload;
    
	IBOutlet UITextField *name;
    
    IBOutlet UITableView *tvMeet;
    IBOutlet UITextField *tfMeet;
    IBOutlet UITableView *tvEvent;
    IBOutlet UITextField *tfEvent;
	IBOutlet UITableView *tvScore;
    
    int curMeet;
}

#pragma mark -
#pragma mark ViewPage
@property (nonatomic, retain) IBOutlet UIView *viewPage;
@property (nonatomic, retain) IBOutlet UIView *editPage;

@property (nonatomic, retain) NSArray *passedNewData;
@property (nonatomic, retain) NSArray *passedListData;
-(void)setPassedValue:(NSArray *)mine andValue:(NSArray *)yours;

#pragma mark -
#pragma mark EditPage
@property (nonatomic, retain) IBOutlet UITextField *name;

@property (nonatomic, retain) IBOutlet UITableView *tvMeet;
@property (nonatomic, retain) IBOutlet UITextField *tfMeet;
@property (nonatomic, retain) IBOutlet UITableView *tvEvent;
@property (nonatomic, retain) IBOutlet UITextField *tfEvent;
@property (nonatomic, retain) IBOutlet UITableView *tvScore;

-(IBAction) backgroundTouched:(id)sender;
-(IBAction) addPlayer;
-(IBAction) addMeet;
-(IBAction) changeMeet:(id)sender;
-(IBAction) addEvent;
-(IBAction) changeEvent:(id)sender;
-(IBAction) changeScore:(id)sender;

-(IBAction)cellTouch:(id)sender;

@end
