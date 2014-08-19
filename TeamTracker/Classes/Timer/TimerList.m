
//
//  TimerList.m
//  PlayerTracker
//
//  Created by Nchinda Fam on 1/13/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "TimerList.h"
#import "TimerNew.h"

@implementation TimerList

@synthesize dataMaster;
@synthesize passedViewData;
@synthesize query;
@synthesize type;
@synthesize timerMaster;

@synthesize pvStat;
@synthesize tvStat;

@synthesize foundPlay;
@synthesize player;

@synthesize singRecog;
@synthesize dubRecog;

@synthesize order;
@synthesize edit;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    dataMaster = [[UIApplication sharedApplication] delegate];

    NSArray *plays = [dataMaster findPlayersinCategory:@"name" forQuery:nil];
    edit.on = dataMaster.isEditAble;
    
	NSManagedObject *matches = nil;
	
	names = [[NSMutableArray alloc] init];
	maxTime = [[NSMutableArray alloc] init];
	minTime = [[NSMutableArray alloc] init];
	
	if ([plays count] != 0)
	{
		foundPlay = [[NSMutableArray alloc] initWithArray:plays];
		for (int i = 0; i < [plays count]; i++)
		{
			matches = [plays objectAtIndex:i];
			[names addObject:[matches valueForKey:@"name"]];
            //Hierarchy is as follows: [NSMutableArray*[NSMutableDictionary:(NString*)meet, (NSMutableArray*)event, (NSMutableArray*)score]]
            NSMutableArray *assign = [NSKeyedUnarchiver unarchiveObjectWithData:[matches valueForKey:@"stats"]];
			
            int max = 0;
            int min = 0;
            for (NSMutableDictionary* outer in assign)
            {
                for (NSString* inner in [outer objectForKey:@"time"])
                {
                    max = [inner intValue] > max ? [inner intValue] : max;
                    
                    min = [inner intValue] < min ? [inner intValue] : min;
                    
                }
                
                [outer setObject:[NSString stringWithFormat:@"%i", max] forKey:@"maxTime"];
                [outer setObject:[NSString stringWithFormat:@"%i", min] forKey:@"minTime"];
                [maxTime addObject:[NSString stringWithFormat:@"%i", max]];
                [minTime addObject:[NSString stringWithFormat:@"%i", min]];
            }
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

-(IBAction) gotoNew
{
    [timerMaster performSelector:@selector(gotoNew)];
}

-(IBAction) gotoView
{
    [timerMaster performSelector:@selector(gotoView)];
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
	[maxTime removeAllObjects];
	[minTime removeAllObjects];
	[tvStat reloadData];
	
	if ([array count] == 0)
	{
		foundPlay = nil;
		
		[names addObject:@"Player Non-existant"];
		[maxTime addObject:@"Search a \" \" to get a list of all"];
		[minTime addObject:@"the Players,"];
	} else
	{
		foundPlay = [[NSMutableArray alloc] initWithArray:array];
        
        if ([@"Name ▼" isEqualToString:[order titleForSegmentAtIndex:[order selectedSegmentIndex]]])
        {
            NSSortDescriptor *sort=[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
            [foundPlay sortUsingDescriptors:[NSArray arrayWithObject:sort]];
        }
        
        if ([@"Name ▲" isEqualToString:[order titleForSegmentAtIndex:[order selectedSegmentIndex]]])
        {
            NSSortDescriptor *sort=[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
            [foundPlay sortUsingDescriptors:[NSArray arrayWithObject:sort]];
        }
        
		for (int i = 0; i < [foundPlay count]; i++)
		{
			matches = [foundPlay objectAtIndex:i];
			[names addObject:[matches valueForKey:@"name"]];
            //Hierarchy is as follows: [NSMutableArray*[NSMutableDictionary:(NString*)meet, (NSMutableArray*)event, (NSMutableArray*)score]]
            NSMutableArray *assign = [NSKeyedUnarchiver unarchiveObjectWithData:[matches valueForKey:@"stats"]];
			
            int max = 0;
            int min = 0;
            for (NSMutableDictionary* outer in assign)
            {
                for (NSDictionary* inner in [outer objectForKey:@"time"])
                {
                    NSString *time = [inner objectForKey:@"time"];
                    max = [time intValue] > max ? [time intValue] : max;
                    
                    if (min == 0)
                        min = [time intValue];
                    else
                        min = [time intValue] < min ? [time intValue] : min;
                }
                
                [outer setObject:[NSString stringWithFormat:@"%i", max] forKey:@"maxTime"];
                [outer setObject:[NSString stringWithFormat:@"%i", min] forKey:@"minTime"];
            }
            [maxTime addObject:[NSString stringWithFormat:@"%i", max]];
            [minTime addObject:[NSString stringWithFormat:@"%i", min]];
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
    return 3;
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
		
		cell.textLabel.text = [NSString stringWithFormat:@"Max Time: %@",
							   [maxTime objectAtIndex:[indexPath section]]];
	}
    else if ([indexPath row] == 2)
	{
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIColor *backColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        cell.backgroundColor = backColor;
		UIColor *foreColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
		cell.textLabel.textColor = foreColor;
		
		cell.textLabel.text = [NSString stringWithFormat:@"Min Time: %@",
							   [minTime objectAtIndex:[indexPath section]]];
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
    
    if([dataMaster isEditAble])
        player = ((TextCell*)[tvStat cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:tapPath.section]]).textBox.text;
    else
        player = [tvStat cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:tapPath.section]].textLabel.text;
    
    NSLog(player);
    if (seleRow == nil )
    {}
    else if([seleRow section] != [tapPath section])
        [self tableView:tvStat didDeselectRowAtIndexPath:seleRow];
    else if([seleRow length] == 0)
        return;
    else if([seleRow section] == [tapPath section])
        if([names count] > 0)
            [self gotoView];
    if(!tapPath)
        [self.view endEditing:YES];
    
    [self tableView:tvStat didSelectRowAtIndexPath:tapPath];
}

-(IBAction)doubleTapFrom:(UIGestureRecognizer *)tapRecog
{
    CGPoint tapLoc = [tapRecog locationInView:tvStat];
    NSIndexPath *tapPath = [tvStat indexPathForRowAtPoint:tapLoc];
    NSIndexPath *seleRow = [tvStat indexPathForSelectedRow];
    
    if([dataMaster isEditAble])
        player = ((TextCell*)[tvStat cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:tapPath.section]]).textBox.text;
    else
        player = [tvStat cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:tapPath.section]].textLabel.text;
    
    if(!tapPath)
        [self.view endEditing:YES];
    
    [self tableView:tvStat didSelectRowAtIndexPath:tapPath];
    
    if (seleRow == nil)
    {}
    else
    {
        if ([seleRow length] == 0)
            return;
        
        if([seleRow section] != [tapPath section])
            [self tableView:tvStat didDeselectRowAtIndexPath:seleRow];
        
        if([seleRow section] == [tapPath section])
            if([names count] > 0)
                [self gotoView];
    }
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

@end

