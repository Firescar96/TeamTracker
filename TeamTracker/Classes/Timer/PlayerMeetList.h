//
//  PlayerMeetList.h
//  TeamTracker
//
//  Created by Nchinda Fam on 7/20/13.
//  Copyright (c) 2013 Plum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TeamTrackerAppDelegate.h"

@interface PlayerMeetList : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    TeamTrackerAppDelegate *dataMaster;
    NSMutableArray *foundMeets;
    
    UIViewController *presenting;
    
    IBOutlet UITableView *tvStat;
    IBOutlet UITextField *tfPlay;
    
    NSString *name;
    NSString *meet;
}
@property (nonatomic, retain) TeamTrackerAppDelegate *dataMaster;
@property (nonatomic, retain) NSMutableArray *foundMeets;

@property (nonatomic, retain) UIViewController *presenting;

@property (nonatomic, retain) IBOutlet UITableView *tvStat;
@property (nonatomic, retain) IBOutlet UITextField *tfPlay;

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *meet;

-(IBAction) continueBut;
-(void) updateData;
@end
