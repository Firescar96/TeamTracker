//
//  PlayerEventList.m
//  TeamTracker
//
//  Created by Nchinda Fam on 7/20/13.
//  Copyright (c) 2013 Plum. All rights reserved.
//

#import "PlayerEventList.h"

@implementation PlayerEventList

@synthesize dataMaster;
@synthesize foundMeets;
@synthesize foundEvents;

@synthesize presenting;

@synthesize tvStat;
@synthesize tfPlay;

@synthesize name;
@synthesize meet;
@synthesize event;

- (void)viewDidLoad
{
    [super viewDidLoad];
    foundEvents = [[NSMutableArray alloc] init];
    dataMaster = [[UIApplication sharedApplication] delegate];
    NSArray *foundPlayers = [dataMaster findPlayersinCategory:@"name" forQuery:name];
    if (foundPlayers.count > 0)
    {
        foundMeets = [NSKeyedUnarchiver unarchiveObjectWithData:[[foundPlayers objectAtIndex:0] valueForKey:@"stats"]];
        
        for (NSDictionary *stat in foundMeets)
        {
            if ([meet isEqualToString:[stat valueForKey:@"meet"]])
                [foundEvents setArray:[stat valueForKey:@"event"]];
        }
    }
    
    [foundEvents insertObject:@"New Event" atIndex:0];
    
    [tvStat reloadData];
    [self tableView:tvStat didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

-(BOOL) disablesAutomaticKeyboardDismissal
{
    return NO;
}

-(IBAction) continueBut
{
    if ([[tvStat indexPathForSelectedRow] row] == 0)
    {
        if (tfPlay.text == nil || [tfPlay.text isEqualToString: @""] || [tfPlay.text isEqualToString: @" "])
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Paradoxical Selection"
                                                           message: @"You selected New Meet but haven't given the meet a name"
                                                          delegate: nil
                                                 cancelButtonTitle:nil
                                                 otherButtonTitles:@"OK",nil];
            
            
            [alert show];
            return;
        }
        event = tfPlay.text;
    }
    else
        event = [tvStat cellForRowAtIndexPath:tvStat.indexPathForSelectedRow].textLabel.text;
    [presenting performSelector:@selector(savePlayer:) withObject:self];
}

-(void) updateData
{
    if ([[tvStat indexPathForSelectedRow] row] == 0)
    {
        [foundEvents removeObjectAtIndex:0];
        [foundEvents addObject:event];
        
        for (NSDictionary *stat in foundMeets)
        {
            if ([meet isEqualToString:[stat valueForKey:@"meet"]])
                [stat setValue:foundEvents forKey:@"event"];
            
            break;
        }
        
        [dataMaster updatePlayer:name withStats:foundMeets];
    }
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [foundEvents count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.layer.cornerRadius = 7;
    bgColorView.layer.masksToBounds = YES;
    [bgColorView setBackgroundColor:[UIColor colorWithRed:.85 green:0 blue:0 alpha:1]];
    [cell setSelectedBackgroundView:bgColorView];
    
    UIColor *backColor = [UIColor colorWithWhite:1 alpha:1];
    cell.backgroundColor = backColor;
    UIColor *foreColor = [UIColor colorWithRed:0 green:.5 blue:1 alpha:1];
    cell.textLabel.textColor = foreColor;
    
    cell.textLabel.text = [foundEvents objectAtIndex:indexPath.row];
	
    return cell;
}

#pragma mark Table view delegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    
	[tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
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
    if([seleRow row] != [tapPath row])
        [self tableView:tvStat didDeselectRowAtIndexPath:seleRow];
    else if (seleRow == nil )
    {}
    else if([seleRow row] == [tapPath row] || [seleRow length] != 0)
        return;
    
    [self.view endEditing:YES];
    
    [self tableView:tvStat didSelectRowAtIndexPath:tapPath];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
