//
//  PlayerList.m
//  PlayerTracker
//
//  Created by Nchinda Fam on 1/13/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "PlayerList.h"


@implementation PlayerList

@synthesize controller;

@synthesize pvStat;
@synthesize tvStat;

@synthesize foundReps;

@synthesize viewMaster;

#pragma mark -
#pragma mark Initialization

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	appDelegate = (TeamTrackerAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	NSManagedObjectContext *moc = [appDelegate
								   managedObjectContext];
	
	NSEntityDescription *entityDescription = [NSEntityDescription
											  entityForName:@"Player" inManagedObjectContext:moc];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entityDescription];
	
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:[NSString stringWithFormat:@"name"]
																   ascending:YES];
	NSArray *sortDescriptors= [[NSArray alloc] initWithObjects:sortDescriptor , nil];
	[request setSortDescriptors:sortDescriptors];
	
	NSError *error;
	NSArray *array = [moc executeFetchRequest:request error:&error];
	
	NSManagedObject *matches = nil;
	
	names = [[NSMutableArray alloc] init];
	events = [[NSMutableArray alloc] init];
	score = [[NSMutableArray alloc] init];
	meets = [[NSMutableArray alloc] init];
	
	if ([array count] != 0) 
	{
		foundReps = [[NSMutableArray alloc] initWithArray:array];
		for (int i = 0; i < [array count]; i++) 
		{
			matches = [array objectAtIndex:i];
			[names addObject:[matches valueForKey:@"name"]];
			
			NSString *eventS = [[NSString alloc] init];
			NSMutableArray *eventData = [NSKeyedUnarchiver unarchiveObjectWithData:[matches valueForKey:@"event"]];
			eventS = [eventData objectAtIndex:0];
			for (int i = 1; i < [eventData count]; i++) {
				eventS = [eventS stringByAppendingFormat:@"%@, %@",eventS, [eventData objectAtIndex:i]];
			}
			[events addObject:eventS];
			
			[score addObject:[matches valueForKey:@"point"]];
			
			NSString *meetS = [[NSString alloc] init];
			NSMutableArray *meetData = [NSKeyedUnarchiver unarchiveObjectWithData:[matches valueForKey:@"meet"]];
			meetS = [meetData objectAtIndex:0];
			for (int i = 1; i < [meetData count]; i++) {
				meetS = [meetS stringByAppendingFormat:@"%@, %@",meetS, [meetData objectAtIndex:i]];
			}
			[meets addObject:meetS];
		}
	}
    
    status = [[NSArray alloc] initWithObjects:@"name", @"event", @"score", @"meet", nil];
    
    viewMaster = (PlayerViewMaster*)[self presentingViewController];
    
    [tvStat setEditing:YES];
}


-(void) findPlayer:(NSString *)query
{	
	NSString *type;
	switch ([pvStat selectedRowInComponent:0]) 
	{
		case 0:
			type = @"name";
			break;
		case 1:
			type = @"event";
			break;
		case 2:
			type = @"score";
			break;
		case 3:
			type = @"meet";
			break;
		default:
			type = @"name";
			break;
	}
	
	NSManagedObjectContext *moc = [appDelegate
								   managedObjectContext];
	
	NSEntityDescription *entityDescription = [NSEntityDescription
											  entityForName:@"Player" inManagedObjectContext:moc];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entityDescription];
	
	if(![query isEqual:nil] && ![query isEqualToString:@""] && ![query isEqualToString:@" "] && ![query isEqualToString:@"  "])
	{
		NSPredicate *predicate = [NSPredicate predicateWithFormat: [NSString stringWithFormat:@"(%@ CONTAINS[nc] '%@')", type, query]];
		[request setPredicate:predicate];
	}
	
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:[NSString stringWithFormat:@"%@", type]
																   ascending:YES];
	NSArray *sortDescriptors= [[NSArray alloc] initWithObjects:sortDescriptor , nil];
	[request setSortDescriptors:sortDescriptors];
	
	NSError *error;
	NSArray *array = [moc executeFetchRequest:request error:&error];
	
	NSManagedObject *matches = nil;
	
	//clear Table
	[names removeAllObjects];
	[events removeAllObjects];
	[score removeAllObjects];
	[meets removeAllObjects];
	[tvStat reloadData];
	
	if ([array count] == 0) 
	{
		foundReps = nil;
		
		[names addObject:@"Player Non-existant"];
		[events addObject:@"Search a \" \" to get a list of all"];
		[score addObject:@"the Players,"];
		[meets addObject:@"or make your search less refined."];
	} else 
	{
		foundReps = [[NSMutableArray alloc] initWithArray:array];
		for (int i = 0; i < [array count]; i++) 
		{
			matches = [array objectAtIndex:i];
			[names addObject:[matches valueForKey:@"name"]];
			
			NSString *eventS = [[NSString alloc] init];
			NSMutableArray *eventData = [NSKeyedUnarchiver unarchiveObjectWithData:[matches valueForKey:@"event"]];
			eventS = [eventData objectAtIndex:0];
			for (int i = 1; i < [eventData count]; i++) {
				eventS = [eventS stringByAppendingFormat:@"%@, %@",eventS, [eventData objectAtIndex:i]];
			}
			[events addObject:eventS];
			
			[score addObject:[matches valueForKey:@"point"]];
			
			NSString *meetS = [[NSString alloc] init];
			NSMutableArray *meetData = [NSKeyedUnarchiver unarchiveObjectWithData:[matches valueForKey:@"meet"]];
			meetS = [meetData objectAtIndex:0];
			for (int i = 1; i < [meetData count]; i++) {
				meetS = [meetS stringByAppendingFormat:@"%@, %@",meetS, [meetData objectAtIndex:i]];
			}
			[meets addObject:meetS];
		}
	}
	[tvStat reloadData];
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
	[newCustomer setValue:[chrome text] forKey:@"score"];
	[newCustomer setValue:[broOther text] forKey:@"meet"];
	
	NSError *error;
	[context save:&error];
}
*/

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
	return [names count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 4;
}


- (NSString*)tableView:(UITableView *)tableView titleForHeaderinSection:(NSInteger)section 
{
    // Return the title of the section.
    return [NSString stringWithFormat:@"%@",[names objectAtIndex:section]];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if ([indexPath row] == 0) 
	{
		cell.selectionStyle = UITableViewCellSelectionStyleBlue;
		
		UIColor *backColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
        cell.backgroundColor = backColor;
		UIColor *foreColor = [UIColor colorWithWhite:1 alpha:1];
		cell.textLabel.textColor = foreColor;
		
		cell.textLabel.text = [NSString stringWithFormat:@"%@",[names objectAtIndex:[indexPath section]]];
	}
	else if ([indexPath row] == 1) 
	{
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIColor *backColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        cell.backgroundColor = backColor;
		UIColor *foreColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
		cell.textLabel.textColor = foreColor;
		
		cell.textLabel.text = [NSString stringWithFormat:@"Events: %@",
							   [events objectAtIndex:[indexPath section]]];
	}
    else if ([indexPath row] == 2) 
	{
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIColor *backColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        cell.backgroundColor = backColor;
		UIColor *foreColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
		cell.textLabel.textColor = foreColor;
		
		cell.textLabel.text = [NSString stringWithFormat:@"score: %@",
							   [score objectAtIndex:[indexPath section]]];
	}
	else if ([indexPath row] == 3) 
	{
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIColor *backColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        cell.backgroundColor = backColor;
		UIColor *foreColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
		cell.textLabel.textColor = foreColor;
		cell.textLabel.text = [NSString stringWithFormat:@"Meets: %@", 
							   [meets objectAtIndex:[indexPath section] ]];
	}
	
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
	 */
}


#pragma mark Picker view delegate

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	//One column
	return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	//set number of rows
	return status.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return (NSString *)[status objectAtIndex:row];
}

#pragma mark PlayerView

-(IBAction) changeEdit
{
    /*if ([edit isOn])
     {
     [viewMaster setEditable:YES];
     
     }
     else
     {
     [viewMaster setEditable:NO];
     
     }*/
}

@end

