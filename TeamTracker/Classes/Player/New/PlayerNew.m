//
//  FirstViewController.m
//  PlayerTracker
//
//  Created by Nchinda Fam on 1/13/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "PlayerView.h"
#import "PlayerNew.h"
#import "PlayerList.h"

@implementation PlayerNew

@synthesize dataMaster;
@synthesize passedViewData;
@synthesize passedListData;

@synthesize name;
@synthesize tvMeet;
@synthesize tfMeet;
@synthesize tvEvent;
@synthesize tfEvent;
@synthesize tvScore;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dataMaster = [[UIApplication sharedApplication] delegate];
    
    if (!passedViewData)
        passedViewData =[[NSArray alloc] init];
    
    if (!passedListData)
        passedListData =[[NSArray alloc] init];
    
    
    if(!assign)
    {
        curMeet = -1;
        
        assign = [[NSMutableArray alloc] init];
    }
    else
        [self.view becomeFirstResponder];
    
    if(TFReload)
    {
        name.text = [TFReload objectAtIndex:0];
        tfMeet.text = [TFReload objectAtIndex:2];
        tfEvent.text = [TFReload objectAtIndex:3];
    }
    
    [tvMeet setEditing:YES animated:YES];
    [tvEvent setEditing:YES animated:YES];
    [tvScore setEditing:YES animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self.view endEditing:YES];
    
    if([[segue destinationViewController] isKindOfClass:[PlayerView class]])
    {
        PlayerView *newView = [segue destinationViewController];
        [newView setPassedValue:[[NSArray alloc] initWithObjects:@"new",
                                 passedListData,
                                 [name text],
                                 assign,
                                 [tfMeet text],
                                 [tfEvent text],
                                 nil] andValue:passedViewData];
    }
    else if([[segue destinationViewController] isKindOfClass:[PlayerList class]])
    {
        PlayerList *newView = [segue destinationViewController];
        [newView setPassedValue:[[NSArray alloc] initWithObjects:@"new",
                                 passedViewData,
                                 [name text],
                                 assign,
                                 [tfMeet text],
                                 [tfEvent text],
                                 nil] andValue:passedListData];
    }
}

-(void)setPassedValue:(NSArray *)mine andValue:(NSArray *)yours
{
    
    if([@"view" isEqualToString:[mine objectAtIndex:0]])
    {
        passedViewData = mine;
        passedListData = [mine objectAtIndex:1];
    }
    else if([@"list" isEqualToString:[mine objectAtIndex:0]])
    {
        passedListData = mine;
        passedViewData = [mine objectAtIndex:1];
    }
    
    if (yours)
        if(yours.count > 2 && [[yours objectAtIndex:3] count] > 0)
        {
            TFReload = [[NSMutableArray alloc] initWithArray:yours];
            [TFReload removeObjectAtIndex:0];
            [TFReload removeObjectAtIndex:0];
            
            assign = [yours objectAtIndex:3];
        }
}

-(IBAction)backgroundTouched:(id)sender
{
    [self.view endEditing:YES];
}

-(IBAction) addPlayer
{
	[self backgroundTouched:nil];
	
    for (NSMutableDictionary *play in assign)
    {
        if ([[name text] isEqualToString:[play objectForKey:@"name"]]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Paradoxical Future"
                                                            message:@"A Player with the selected name already exits"
                                                           delegate:nil
                                                  cancelButtonTitle:@"10-4"
                                                  otherButtonTitles:nil];
            [alert show];
            return;
        }
    }
    
	[dataMaster saveNewPlayer:[name text] withStats:assign];
	
    [assign removeAllObjects];
    
    curMeet = -1;
    [tvMeet reloadData];
    [tvEvent reloadData];
    [tvScore reloadData];
    
    name.text = @"";
    tfMeet.text = @"";
    tfEvent.text = @"";
}

-(IBAction) addMeet
{
    [assign addObject:[[NSMutableDictionary alloc] init]];
    
    [((NSMutableDictionary*)[assign lastObject]) setObject:[tfMeet text] forKey:@"meet"];
    [((NSMutableDictionary*)[assign lastObject]) setObject:[[NSMutableArray alloc] init] forKey:@"event"];
    [((NSMutableDictionary*)[assign lastObject]) setObject:[[NSMutableArray alloc] init] forKey:@"score"];
    
    tfMeet.text = nil;
    
    [tvMeet reloadData];
}

-(IBAction) addEvent
{
    if(curMeet < 0)
        return;
    
    [((NSMutableArray*)[[assign objectAtIndex:curMeet] objectForKey:@"event"]) addObject:[tfEvent text]];
    [((NSMutableArray*)[[assign objectAtIndex:curMeet] objectForKey:@"score"]) addObject:@""];
    
    tfEvent.text = nil;
    
    [tvEvent reloadData];
    [tvScore reloadData];
}

-(IBAction) changeStat:(id)sender
{
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:curMeet];
    if (sender == [((TextCell*)[tvMeet cellForRowAtIndexPath:path]) textBox])
    {
        [((NSMutableDictionary*)[assign objectAtIndex:curMeet]) setObject:[((UITextField*)sender) text] forKey:@"meet"];
        return;
    }
    
    for (int i = 0; i < [assign count]; i++)
    {
        NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:i];
        
        if (sender == [((TextCell*)[tvEvent cellForRowAtIndexPath:path]) textBox])
        {
            [[[assign objectAtIndex:curMeet] objectForKey:@"event"] setObject:[((UITextField*)sender) text] atIndex:i];
            return;
        }
    }
    
    for (int i = 0; i < [assign count]; i++)
    {
        NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:i];
        
        if (sender == [((TextCell*)[tvScore cellForRowAtIndexPath:path]) textBox])
        {
            [[[assign objectAtIndex:curMeet] objectForKey:@"score"] setObject:[((UITextField*)sender) text] atIndex:i];
            return;
        }
    }
}

#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //Return the number of sections.
    if(tableView == tvMeet)
        return [assign count];
    else if (tableView == tvEvent && curMeet > -1)
        return [((NSMutableArray*)[[assign objectAtIndex:curMeet] valueForKey:@"event"]) count];
    else if (tableView == tvScore && curMeet > -1)
        return [((NSMutableArray*)[[assign objectAtIndex:curMeet] valueForKey:@"score"]) count];
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
    else if (tvScore)
        return @"";
    else
        return @"";
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
        cell.textBox.text = [NSString stringWithFormat:@"%@",[[assign objectAtIndex:[indexPath section]] valueForKey:@"meet"]];
        [cell.textBox addTarget:self
                         action:@selector(changeMeet:)
               forControlEvents:UIControlEventEditingChanged];
    }
    else if (tableView == tvEvent)
    {
        cell.textBox.text = [NSString stringWithFormat:@"%@",[((NSMutableArray*)[[assign objectAtIndex:curMeet] valueForKey:@"event"]) objectAtIndex:[indexPath section]]];
        [cell.textBox addTarget:self
                         action:@selector(changeEvent:)
               forControlEvents:UIControlEventEditingChanged];
    }
    else if (tableView == tvScore)
    {
        cell.textBox.text = [NSString stringWithFormat:@"%@",[((NSMutableArray*)[[assign objectAtIndex:curMeet] valueForKey:@"score"]) objectAtIndex:[indexPath section]]];
        [cell.textBox addTarget:self
                         action:@selector(changeScore:)
               forControlEvents:UIControlEventEditingChanged];
    }
    
    
    return cell;
}

#pragma mark Table view delegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
		   editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    ((TextCell*)[tableView cellForRowAtIndexPath:indexPath]).textBox.backgroundColor = [UIColor blueColor];
    ((TextCell*)[tableView cellForRowAtIndexPath:indexPath]).textBox.textColor = [UIColor whiteColor];
    [((TextCell*)[tableView cellForRowAtIndexPath:indexPath]).textBox becomeFirstResponder];
    
    if(tableView == tvMeet)
    {
        if(curMeet == [indexPath section])
            return;
        
        NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:curMeet];
        ((TextCell*)[tvMeet cellForRowAtIndexPath:path]).textBox.textColor = [UIColor blackColor];
        
        curMeet = [indexPath section];
        
        [tvEvent reloadData];
        [tvScore reloadData];
    }
    else if(tableView == tvEvent)
    {
        if([[tvEvent indexPathForSelectedRow] section] == [indexPath section])
            return;
        
        //NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:curEvent];
        //((TextCell*)[tvEvent cellForRowAtIndexPath:path]).textBox.textColor = [UIColor blackColor];
        [tvScore selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
    else if(tableView == tvEvent)
    {
        if([[tvScore indexPathForSelectedRow] section] == [indexPath section])
            return;
        
        //NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:curScore];
        //((TextCell*)[tvScore cellForRowAtIndexPath:path]).textBox.textColor = [UIColor blackColor];
        [tvScore selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ((TextCell*)[tableView cellForRowAtIndexPath:indexPath]).textBox.backgroundColor = [UIColor whiteColor];
    ((TextCell*)[tableView cellForRowAtIndexPath:indexPath]).textBox.textColor = [UIColor blackColor];
    [((TextCell*)[tableView cellForRowAtIndexPath:indexPath]).textBox resignFirstResponder];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if(tableView == tvMeet)
        {
            [assign removeObjectAtIndex:[indexPath section]];
            curMeet--;
        }
        if(tableView == tvEvent)
        {
            [[[assign objectAtIndex:curMeet] objectForKey:@"event"] removeObjectAtIndex:[indexPath section]];
        }
        if(tableView == tvEvent)
        {
            [[[assign objectAtIndex:curMeet] objectForKey:@"score"] removeObjectAtIndex:[indexPath section]];
        }
        [tableView deleteSections:[NSIndexSet indexSetWithIndex:[indexPath section]] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark Table view Gestures

-(IBAction) cellTouch:(id)sender
{
    if(sender == [tvMeet cellForRowAtIndexPath:[tvMeet indexPathForSelectedRow]] ||
       sender == ((TextCell*)[tvMeet cellForRowAtIndexPath:[tvMeet indexPathForSelectedRow]] ).textBox)
        return;
    
    if(sender == [tvEvent cellForRowAtIndexPath:[tvEvent indexPathForSelectedRow]] ||
       sender == ((TextCell*)[tvEvent cellForRowAtIndexPath:[tvEvent indexPathForSelectedRow]] ).textBox)
        return;
    
    if(sender == [tvScore cellForRowAtIndexPath:[tvScore indexPathForSelectedRow]] ||
       sender == ((TextCell*)[tvScore cellForRowAtIndexPath:[tvScore indexPathForSelectedRow]] ).textBox)
        return;
    
    for (int i = 0; i < [assign count]; i++)
    {
        NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:i];
        
        if (sender == [tvMeet cellForRowAtIndexPath:path] || sender == [((TextCell*)[tvMeet cellForRowAtIndexPath:path]) textBox])
        {
            if([tvMeet indexPathForSelectedRow].length > 0)
                [self tableView:tvMeet didDeselectRowAtIndexPath:[tvMeet indexPathForSelectedRow]];
            [self tableView:tvMeet didSelectRowAtIndexPath:path];
            return;
        }
        for (int j = 0; j < [[[assign objectAtIndex:i] objectForKey:@"event"] count]; j++) {
            NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:j];
            if (sender == [tvEvent cellForRowAtIndexPath:path] || sender == [((TextCell*)[tvEvent cellForRowAtIndexPath:path]) textBox])
            {
                if([tvEvent indexPathForSelectedRow].length > 0)
                    [self tableView:tvEvent didDeselectRowAtIndexPath:[tvEvent indexPathForSelectedRow]];
                [self tableView:tvEvent didSelectRowAtIndexPath:path];
                return;
            }
        }
        for (int j = 0; j < [[[assign objectAtIndex:i] objectForKey:@"score"] count]; j++) {
            NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:j];
            if (sender == [tvScore cellForRowAtIndexPath:path] || sender == [((TextCell*)[tvScore cellForRowAtIndexPath:path]) textBox])
            {
                if([tvScore indexPathForSelectedRow].length > 0)
                    [self tableView:tvScore didDeselectRowAtIndexPath:[tvScore indexPathForSelectedRow]];
                [self tableView:tvScore didSelectRowAtIndexPath:path];
                return;
            }
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == tvEvent)
    {
        tvScore.contentOffset = tvEvent.contentOffset;
    }
    if (scrollView == tvScore)
    {
        tvEvent.contentOffset = tvScore.contentOffset;
    }
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
