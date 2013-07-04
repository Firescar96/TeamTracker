//
//  PlayerViewMaster.m
//  PlayermerTracker
//
//  Created by Nchinda Fam on 1/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "PlayerMaster.h"

@implementation PlayerViewMaster


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}

/*
 - (void) saveData
 {
 
 NSManagedObjectContext *context = appDelegate.managedObjectContext;
 
 NSManagedObject *newCustomer=[foundReps objectAtIndex:[[tvStat indexPathForSelectedRow] section]];
 
 [newCustomer setValue:[ie text] forKey:@"name"];
 [newCustomer setValue:[ffox text] forKey:@"event"];
 [newCustomer setValue:[chrome text] forKey:@"points"];
 [newCustomer setValue:[broOther text] forKey:@"meet"];
 
 NSError *error;
 [context save:&error];
 }
 */

-(IBAction) changeEdit
{
    /*if ([edit isOn])
	{
		[self setEditable:YES];
		
	}
	else
	{
		[self setEditable:NO];
		
	}*/
}

-(void) setEditable: (BOOL) able
{
    
}
@end