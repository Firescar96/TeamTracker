
//
//  PlayerList.m
//  PlayerTracker
//
//  Created by Nchinda Fam on 1/13/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "PlayerList.h"
#import "PlayerView.h"
#import "PlayerNew.h"

@implementation PlayerList

@synthesize dataMaster;
@synthesize passedViewData;
@synthesize passedNewData;
@synthesize query;
@synthesize type;

@synthesize pvStat;
@synthesize tvStat;

@synthesize foundPlay;

@synthesize singRecog;
@synthesize dubRecog;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    dataMaster = [[UIApplication sharedApplication] delegate];
    NSArray *plays = [dataMaster findPlayersinCategory:@"name" forQuery:nil];
	edit.on = dataMaster.isEditAble;
    
    if (!passedViewData)
        passedViewData =[[NSArray alloc] init];
    
    if (!passedNewData)
        passedNewData =[[NSArray alloc] init];
    
	NSManagedObject *matches = nil;
	
	names = [[NSMutableArray alloc] init];
	meets = [[NSMutableArray alloc] init];
	events = [[NSMutableArray alloc] init];
	score = [[NSMutableArray alloc] init];
	
	if ([plays count] != 0)
	{
		foundPlay = [[NSMutableArray alloc] initWithArray:plays];
		for (int i = 0; i < [plays count]; i++)
		{
			matches = [plays objectAtIndex:i];
			[names addObject:[matches valueForKey:@"name"]];
            //Hierarchy is as follows: [NSMutableArray*[NSMutableDictionary:meet, (NSMutableArray*)event, (NSMutableArray*)score]]
            NSMutableArray *assign = [NSKeyedUnarchiver unarchiveObjectWithData:[matches valueForKey:@"stats"]];
            
			NSString *meetS = @"";
			for (int i = 0; i < [assign count]; i++)
            {
				meetS = [meetS stringByAppendingFormat:@", %@", [[assign objectAtIndex:i] objectForKey:@"meet"]];
			}
            [meets addObject:meetS];
            
            NSMutableArray *eventA = [[NSMutableArray alloc] init];
            NSString *eventS = [[NSString alloc] init];
            bool taken;
            for (NSMutableDictionary* outer in assign)
            {
                for (NSString* inner in [outer objectForKey:@"event"])
                {
                    taken = NO;
                    for(NSString* event in eventA)
                    {
                        if([event isEqualToString:inner])
                        {
                            taken = YES;
                            break;
                        }
                    }
                    if(!taken)
                        [eventA addObject:inner];
                    
                }
            }
            
            for(NSString* event in eventA)
            {
                eventS = [eventS stringByAppendingString:event];
            }
			[events addObject:eventS];
			
            NSString *scoreS = [[NSString alloc] init];
            int max = 0;
            int min = 0;
            for (NSMutableDictionary* outer in assign)
            {
                for (NSString* inner in [outer objectForKey:@"score"])
                {
                    max = [inner intValue] > max ? [inner intValue] : max;
                    
                    min = [inner intValue] < min ? [inner intValue] : min;
                    
                }
            }
            scoreS = [@"Max: " stringByAppendingString:[NSString stringWithFormat:@"%i",max]];
            scoreS = [scoreS stringByAppendingString:@" Min: "];
            scoreS = [scoreS stringByAppendingString:[NSString stringWithFormat:@"%i",min]];
			[score addObject:scoreS];
		}
	}
    
    status = [[NSArray alloc] initWithObjects:@"name", @"meet", @"event", @"score", nil];
    
    [tvStat setEditing:NO];
    
    [singRecog requireGestureRecognizerToFail:dubRecog];
    
    if(query && type)
    {
        if([@"name" isEqualToString:query])
            [pvStat selectRow:0 inComponent:0 animated:NO];
        
        else if([@"meet" isEqualToString:query])
            [pvStat selectRow:1 inComponent:0 animated:NO];
        
        else if([@"event" isEqualToString:query])
            [pvStat selectRow:2 inComponent:0 animated:NO];
        
        else if([@"score" isEqualToString:query])
            [pvStat selectRow:3 inComponent:0 animated:NO];
        else
            [pvStat selectRow:0 inComponent:0 animated:NO];
        
        [self findPlayer:query];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue destinationViewController] isKindOfClass:[PlayerView class]])
    {
        PlayerView *newView = [segue destinationViewController];
        
        if([tvStat indexPathForSelectedRow] == nil)
            [newView setPassedValue:[[NSArray alloc] initWithObjects:@"list",
                                     passedNewData,
                                     query,
                                     type,
                                     nil] andValue:passedViewData];
        else
        {
            int curPlayer = [[tvStat indexPathForSelectedRow] section];
            [newView setPassedValue:[[NSArray alloc] initWithObjects:@"list",
                                     passedNewData,
                                     query,
                                     type,
                                     [names objectAtIndex:curPlayer],
                                     nil] andValue:passedViewData];
        }
    }
    else if([[segue destinationViewController] isKindOfClass:[PlayerNew class]])
    {
        PlayerNew *newView = (PlayerNew*)[segue destinationViewController];
        [newView setPassedValue:[[NSArray alloc] initWithObjects:@"list",
                                 passedViewData,
                                 nil] andValue:passedNewData];
    }
}

-(void)setPassedValue:(NSArray *)mine andValue:(NSArray *)yours
{
    if([@"view" isEqualToString:[mine objectAtIndex:0]])
    {
        passedViewData = mine;
        passedNewData = [mine objectAtIndex:1];
    }
    else if([@"new" isEqualToString:[mine objectAtIndex:0]])
    {
        passedNewData = mine;
        passedViewData = [mine objectAtIndex:1];
    }
    
    if (yours.count > 2)
    {
        query = [yours objectAtIndex:2];
        type = [yours objectAtIndex:3];
    }
}

-(IBAction)backgroundTouched:(id)sender
{
    [self.view endEditing:YES];
}

-(void) findPlayer:(NSString *)play
{
    self.query = play;
    
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
	
	NSArray *array = [dataMaster findPlayersinCategory:type forQuery:query];
	
	NSManagedObject *matches = nil;
	
	//clear Table
	[names removeAllObjects];
	[meets removeAllObjects];
	[events removeAllObjects];
	[score removeAllObjects];
	[tvStat reloadData];
	
	if ([array count] == 0)
	{
		foundPlay = nil;
		
		[names addObject:@"Player Non-existant"];
		[meets addObject:@"Search a \" \" to get a list of all"];
		[events addObject:@"the Players,"];
		[score addObject:@"or make your search less refined."];
	} else
	{
		foundPlay = [[NSMutableArray alloc] initWithArray:array];
		for (int i = 0; i < [array count]; i++)
		{
			matches = [array objectAtIndex:i];
			[names addObject:[matches valueForKey:@"name"]];
			
            //Hierarchy is as follows: [NSMutableArray*[NSMutableDictionary:meet, (NSMutableArray*)event, (NSMutableArray*)score]]
            NSMutableArray *assign = [NSKeyedUnarchiver unarchiveObjectWithData:[matches valueForKey:@"stats"]];
            
			NSString *meetS = [[NSString alloc] init];
			for (int i = 0; i < [assign count]; i++)
            {
				meetS = [meetS stringByAppendingFormat:@"%@, ", [[assign objectAtIndex:i] objectForKey:@"meet"]];
			}
            if([meetS length] >= 2)
                meetS = [meetS substringToIndex:[meetS length]-2];
            [meets addObject:meetS];
            
            NSMutableArray *eventA = [[NSMutableArray alloc] init];
            NSString *eventS = [[NSString alloc] init];
            bool taken;
            for (NSMutableDictionary* outer in assign)
            {
                for (NSString* inner in [outer objectForKey:@"event"])
                {
                    taken = NO;
                    for(NSString* event in eventA)
                    {
                        if([event isEqualToString:inner])
                        {
                            taken = YES;
                            break;
                        }
                    }
                    if(!taken)
                        [eventA addObject:inner];
                    
                }
            }
            
            for(NSString* event in eventA)
            {
                eventS = [eventS stringByAppendingFormat:@"%@, ", event];
            }
            if([eventS length] >= 2)
                eventS = [eventS substringToIndex:[eventS length]-2];
			[events addObject:eventS];
			
            NSString *scoreS = [[NSString alloc] init];
            int max = 0;
            int min = 0;
            for (NSMutableDictionary* outer in assign)
            {
                for (NSString* inner in [outer objectForKey:@"score"])
                {
                    max = [inner intValue] > max ? [inner intValue] : max;
                    
                    min = [inner intValue] < min ? [inner intValue] : min;
                    
                }
            }
            scoreS = [@"Max: " stringByAppendingString:[NSString stringWithFormat:@"%i",max]];
            scoreS = [scoreS stringByAppendingString:@" Min: "];
            scoreS = [scoreS stringByAppendingString:[NSString stringWithFormat:@"%i",min]];
			[score addObject:scoreS];
		}
	}
	[tvStat reloadData];
    [tvStat deselectRowAtIndexPath:[tvStat indexPathForSelectedRow] animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}

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
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIView *bgColorView = [[UIView alloc] init];
        bgColorView.layer.cornerRadius = 7;
        bgColorView.layer.masksToBounds = YES;
        [bgColorView setBackgroundColor:[UIColor colorWithRed:.85 green:0 blue:0 alpha:1]];
        [cell setSelectedBackgroundView:bgColorView];
        
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
		
		cell.textLabel.text = [NSString stringWithFormat:@"Meets: %@",
							   [meets objectAtIndex:[indexPath section]]];
	}
    else if ([indexPath row] == 2)
	{
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIColor *backColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        cell.backgroundColor = backColor;
		UIColor *foreColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
		cell.textLabel.textColor = foreColor;
		
		cell.textLabel.text = [NSString stringWithFormat:@"Events: %@",
							   [events objectAtIndex:[indexPath section]]];
	}
	else if ([indexPath row] == 3)
	{
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIColor *backColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        cell.backgroundColor = backColor;
		UIColor *foreColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
		cell.textLabel.textColor = foreColor;
		cell.textLabel.text = [NSString stringWithFormat:@"Score: %@",
							   [score objectAtIndex:[indexPath section] ]];
	}
	
    return cell;
}

#pragma mark Table view delegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:[indexPath section]];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:path];
    [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
    
	[tableView selectRowAtIndexPath:path animated:YES scrollPosition:UITableViewScrollPositionNone];
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tvStat cellForRowAtIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
}

#pragma mark Table view Gestures

-(IBAction)singleTapFrom:(UIGestureRecognizer *)tapRecog
{
    CGPoint tapLoc = [tapRecog locationInView:tvStat];
    NSIndexPath *tapPath = [tvStat indexPathForRowAtPoint:tapLoc];
    
    NSIndexPath *seleRow = [tvStat indexPathForSelectedRow];
    if([seleRow section] != [tapPath section])
        [self tableView:tvStat didDeselectRowAtIndexPath:seleRow];
    else if (seleRow == nil )
    {}
    else if([seleRow section] == [tapPath section] || [seleRow length] != 0)
        return;
    
    if(!tapPath)
        [self.view endEditing:YES];
    
    [self tableView:tvStat didSelectRowAtIndexPath:tapPath];
}

-(IBAction)doubleTapFrom:(UIGestureRecognizer *)tapRecog
{
    CGPoint tapLoc = [tapRecog locationInView:tvStat];
    NSIndexPath *tapPath = [tvStat indexPathForRowAtPoint:tapLoc];
    
    NSIndexPath *seleRow = [tvStat indexPathForSelectedRow];
    if([seleRow section] != [tapPath section])
        [self tableView:tvStat didDeselectRowAtIndexPath:seleRow];
    else if (seleRow == nil )
    {}
    else if([seleRow section] == [tapPath section] || [seleRow length] != 0)
        return;
    
    if(!tapPath)
        [self.view endEditing:YES];
    
    [self tableView:tvStat didSelectRowAtIndexPath:tapPath];
    
    if([names count] > 0)
        [self performSegueWithIdentifier:@"list2view" sender:nil];
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
    if ([edit isOn])
        dataMaster.editAble = YES;
    else
        dataMaster.editAble = NO;
}

@end

