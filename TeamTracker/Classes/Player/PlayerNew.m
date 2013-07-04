//
//  FirstViewController.m
//  PlayermerTracker
//
//  Created by Nchinda Fam on 1/13/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "PlayerNew.h"

@implementation PlayerNew

@synthesize appDelegate;

@synthesize sSearch;
@synthesize sList;

@synthesize name;
@synthesize event;
@synthesize tvMeet;
@synthesize tfMeet;
@synthesize tvEvent;
@synthesize tfEvent;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    curMeet = -1;
    curEvent = -1;
    
    assign = [[NSMutableArray alloc] init];
    
    [tvMeet setEditing:YES animated:YES];
    [tvEvent setEditing:YES animated:YES];
    
}

-(IBAction)backgroundTouched:(id)sender
{
	[name resignFirstResponder];
	[event resignFirstResponder];
}

-(IBAction) addPlayer
{
	[self backgroundTouched:nil];
	
	appDelegate = (TeamTrackerAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	NSManagedObjectContext *context = appDelegate.managedObjectContext;
	
	NSManagedObject *newPlayermer = [NSEntityDescription 
				   insertNewObjectForEntityForName:@"Player"
				   inManagedObjectContext:context];
	
	NSMutableArray *eventArray = [[NSMutableArray alloc] initWithObjects:[event text],nil];
	NSData *eventData = [NSKeyedArchiver archivedDataWithRootObject:eventArray];
	
	NSMutableArray *meetArray = [[NSMutableArray alloc] init];
	[meetArray addObject:@"No Meet"];
	NSData *meetData = [NSKeyedArchiver archivedDataWithRootObject:meetArray];
	
	[newPlayermer setValue:[name text] forKey:@"name"];
	[newPlayermer setValue:eventData forKey:@"event"];
	[newPlayermer setValue:meetData forKey:@"meet"];
	
	name.text = @"";
	event.text = @"";
	
	NSError *serror;
	[context save:&serror];
}

-(IBAction) addMeet
{
    [assign addObject:[[NSMutableDictionary alloc] init]];
    [((NSMutableDictionary*)[assign lastObject]) setObject:[tfMeet text] forKey:@"meet"];
    [((NSMutableDictionary*)[assign lastObject]) setObject:[[NSMutableArray alloc] init] forKey:@"event"];
    NSLog([NSString stringWithFormat:@"%@",[tfMeet text]]);
    NSLog([NSString stringWithFormat:@"%@",[[assign lastObject] valueForKey:@"meet"]]);
    [tvMeet reloadData];
}

-(IBAction) addEvent
{
    [((NSMutableArray*)[[assign objectAtIndex:curMeet] valueForKey:@"event"]) addObject:nil];
    [tvEvent reloadData];
}

#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //Return the number of sections.
    if(tableView == tvMeet)
        return [assign count]; 
    else if (tableView == tvEvent && curMeet != -1)
        return [((NSMutableArray*)[[assign objectAtIndex:curMeet] valueForKey:@"event"]) count];
    else
        return 0;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderinSection:(NSInteger)section
{
    // Return the title of the section.
    if(tableView == tvMeet)
        return [NSString stringWithFormat:@"%@",[[assign objectAtIndex:section] valueForKey:@"meet"]];
    else if (tvEvent)
        return @"";
    else
        return @"";//return [NSString stringWithFormat:@"%@",[[assign objectAtIndex:section] valueForKey:@"event"]];
}

// Customize the appearance of table view cells.
- (TextCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TextCell *cell;
    if (cell == nil)
    {
        NSArray *topNibs = [[NSBundle mainBundle] loadNibNamed:@"TextCell" owner:nil options:nil];
        
        for(id curNib in topNibs)
        {
            if([curNib isKindOfClass:[TextCell class]])
            {
                cell = (TextCell *)curNib;
                break;
            }
        }
    }
    
    if(tableView == tvMeet)
    {
        if ([indexPath row] == 0)
        {
            cell.textBox.text = @"hello";
        }
    }
    else if (tvEvent)
    {
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
        UIColor *backColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
        cell.backgroundColor = backColor;
        UIColor *foreColor = [UIColor colorWithWhite:1 alpha:1];
        cell.textLabel.textColor = foreColor;
        
        cell.textBox.text = [NSString stringWithFormat:@"%@",[((NSMutableArray*)[[assign objectAtIndex:curMeet] valueForKey:@"event"]) objectAtIndex:[indexPath section]]];
    }

    
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
		   editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
	
	static NSString *CellIdentifier = @"Cell";
    
    TextCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	
	NSIndexPath *head = [NSIndexPath indexPathForRow:0 inSection:[indexPath section]];
	[tableView selectRowAtIndexPath:head animated:YES scrollPosition:UITableViewScrollPositionNone];
    
    if(tableView == tvMeet)
        curMeet = [indexPath section];
    else if(tableView == tvEvent)
        curEvent = [indexPath section];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end
