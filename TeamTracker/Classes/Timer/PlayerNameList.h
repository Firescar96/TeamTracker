//
//  PlayerNameList.h
//  TeamTracker
//
//  Created by Nchinda Fam on 7/20/13.
//  Copyright (c) 2013 Plum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TeamTrackerAppDelegate.h"

@interface PlayerNameList : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    TeamTrackerAppDelegate *dataMaster;
    NSArray *foundPlayers;
    
    IBOutlet UITableView *tvStat;
}
@property (nonatomic, retain) TeamTrackerAppDelegate *dataMaster;
@property (nonatomic, retain) NSArray *foundPlayers;

@property (nonatomic, retain) IBOutlet UITableView *tvStat;
@end
