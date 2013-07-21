//
//  ReportsTable.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamTrackerAppDelegate.h"

@interface PlayerTable : UITableViewController<UITableViewDataSource, UITableViewDelegate>
{
	IBOutlet UIBarButtonItem *delete1;
	IBOutlet UIBarButtonItem *delete2;
}

@property (nonatomic, retain) IBOutlet UIBarButtonItem *delete1;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *delete2;

-(void) displayReport:(NSIndexPath *)curInd;
-(IBAction) changeEdit;
-(void) setEditable: (BOOL) able;

@end
