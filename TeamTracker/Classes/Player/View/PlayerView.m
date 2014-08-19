//
//  PlayerView.m
//  TeamTracker
//
//  Created by Nchinda Fam on 7/7/13.
//  Copyright (c) 2013 Plum. All rights reserved.
//

#import "PlayerView.h"
#import "PlayerNew.h"
#import "PlayerList.h"

@implementation PlayerView

@synthesize viewPage;
@synthesize editPage;

@synthesize passedNewData;
@synthesize passedListData;

@synthesize name;
@synthesize tvMeet;
@synthesize tfMeet;
@synthesize tvEvent;
@synthesize tfEvent;
@synthesize tvScore;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dataMaster = [[UIApplication sharedApplication] delegate];
    NSArray *array = [dataMaster findPlayersinCategory:@"name" forQuery:player];
    
    if (!passedNewData)
        passedNewData =[[NSArray alloc] init];
    
    if (!passedListData)
        passedListData =[[NSArray alloc] init];
    
    if(!assign)
    {
        curMeet = -1;
        
        assign = [[NSMutableArray alloc] init];
    }
    else
        [self.view becomeFirstResponder];
    
    if(dataMaster.isEditAble)
    {
        editPage.hidden = NO;
        viewPage.hidden = YES;
        
        if(TFReload)
        {
            name.text = [TFReload objectAtIndex:0];
            tfMeet.text = [TFReload objectAtIndex:1];
            tfEvent.text = [TFReload objectAtIndex:2];
        }
        
        if([array count] > 0)
        {
            NSManagedObject *matches = [array objectAtIndex:0];
            
            //Hierarchy is as follows: [NSMutableArray*[NSMutableDictionary:meet, (NSMutableArray*)event, (NSMutableArray*)score]]
            assign = [NSKeyedUnarchiver unarchiveObjectWithData:[matches valueForKey:@"stats"]];
            
            for (int i = 0; i < [assign count]; i++)
            {
                [meets addObject:[[assign objectAtIndex:i] objectForKey:@"meet"]];
            }
            
            name.text = [matches valueForKey:@"name"];
            tfMeet.text = @"";
            tfEvent.text =  @"";
        }
        
        [tvMeet setEditing:YES animated:YES];
        [tvEvent setEditing:YES animated:YES];
        [tvScore setEditing:YES animated:YES];
    }
    else
    {
        viewPage.hidden = NO;
        editPage.hidden = YES;
        
        NSManagedObject *matches = nil;
        
        names = [[NSMutableArray alloc] init];
        meets = [[NSMutableArray alloc] init];
        events = [[NSMutableArray alloc] init];
        score = [[NSMutableArray alloc] init];
        
        
        for (int i = 0; i < [array count]; i++)
        {
            matches = [array objectAtIndex:i];
            
            [names addObject:[matches valueForKey:@"name"] ];
            
            //Hierarchy is as follows: [NSMutableArray*[NSMutableDictionary:meet, (NSMutableArray*)event, (NSMutableArray*)score]]
            assign = [NSKeyedUnarchiver unarchiveObjectWithData:[matches valueForKey:@"stats"]];
            
            for (int i = 0; i < [assign count]; i++)
            {
                [meets addObject:[[assign objectAtIndex:i] objectForKey:@"meet"]];
            }
        break;
        }
        
        [tvStat reloadData];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue destinationViewController] isKindOfClass:[PlayerNew class]])
    {
        PlayerNew *newView = [segue destinationViewController];
        [newView setPassedValue:[[NSArray alloc] initWithObjects:@"view",
                                 passedListData,
                                 player,
                                 [name text],
                                 assign,
                                 [tfMeet text],
                                 [tfEvent text],
                                 nil] andValue:passedNewData];
    }
    else if([[segue destinationViewController] isKindOfClass:[PlayerList class]])
    {
        PlayerList *newView = [segue destinationViewController];
        [newView setPassedValue:[[NSArray alloc] initWithObjects:@"view",
                                 passedNewData,
                                 player,
                                 [name text],
                                 assign,
                                 [tfMeet text],
                                 [tfEvent text],
                                 nil] andValue:passedListData];
    }
}

-(void)setPassedValue:(NSArray *)mine andValue:(NSArray *)yours
{
    dataMaster = [[UIApplication sharedApplication] delegate];
    if (dataMaster.isEditAble)
    {
        if([@"new" isEqualToString:[mine objectAtIndex:0]])
        {
            passedNewData = mine;
            passedListData = [mine objectAtIndex:1];
            
            if(yours)
                if(yours.count > 2 && [[yours objectAtIndex:4] count] > 0)
                {
                    TFReload = [[NSMutableArray alloc] init];
                    [TFReload addObject:[yours objectAtIndex:3]];
                    [TFReload addObject:[yours objectAtIndex:5]];
                    [TFReload addObject:[yours objectAtIndex:6]];
                    
                    player = [yours objectAtIndex:2];
                }
        }
        else if([@"list" isEqualToString:[mine objectAtIndex:0]])
        {
            passedListData = mine;
            passedNewData = [mine objectAtIndex:1];
            
            if(mine.count > 4 && [mine objectAtIndex:4])
                player = [mine objectAtIndex:4];
            else if(yours)
                if(yours.count > 2 && [[yours objectAtIndex:4] count] > 0)
                {
                    TFReload = [[NSMutableArray alloc] init];
                    [TFReload addObject:[yours objectAtIndex:3]];
                    [TFReload addObject:[yours objectAtIndex:5]];
                    [TFReload addObject:[yours objectAtIndex:6]];
                    
                    player = [yours objectAtIndex:2];
                }
        }
    }
    else
    {
        if([@"new" isEqualToString:[mine objectAtIndex:0]])
        {
            passedNewData = mine;
            passedListData = [mine objectAtIndex:1];
            
            if(yours)
                if(yours.count > 2)
                    player = [yours objectAtIndex:2];
        }
        else if([@"list" isEqualToString:[mine objectAtIndex:0]])
        {
            passedListData = mine;
            passedNewData = [mine objectAtIndex:1];
            
            if(mine.count > 4 && [mine objectAtIndex:4])
                player = [mine objectAtIndex:4];
            else if(yours)
                if(yours.count > 2)
                    player = [yours objectAtIndex:2];
        }
    }
}

-(IBAction)backgroundTouched:(id)sender
{
    [self.view endEditing:YES];
}

-(IBAction) addPlayer
{
	[self backgroundTouched:nil];
	
	[dataMaster updatePlayer:[name text] withStats:assign];
    
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
    
    tfMeet.text = @"";
    
    [tvMeet reloadData];
}

-(IBAction) changeMeet:(id)sender
{
    [((NSMutableDictionary*)[assign objectAtIndex:curMeet]) setObject:[((UITextField*)sender) text] forKey:@"meet"];
}

-(IBAction) addEvent
{
    if(curMeet < 0)
        return;
    
    [((NSMutableArray*)[[assign objectAtIndex:curMeet] objectForKey:@"event"]) addObject:[tfEvent text]];
    [((NSMutableArray*)[[assign objectAtIndex:curMeet] objectForKey:@"score"]) addObject:@""];
    
    tfEvent.text = @"";
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    if(tableView == tvStat)
        return [meets count];
    else if(tableView == tvMeet)
        return [assign count];
    else if (tableView == tvEvent && curMeet > -1)
        return [((NSMutableArray*)[[assign objectAtIndex:curMeet] valueForKey:@"event"]) count];
    else if (tableView == tvScore && curMeet > -1)
        return [((NSMutableArray*)[[assign objectAtIndex:curMeet] valueForKey:@"score"]) count];
    else
        return 0;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


- (NSString*)tableView:(UITableView *)tableView titleForHeaderinSection:(NSInteger)section
{
    // Return the title of the section.
    if(tableView == tvStat)
        return [NSString stringWithFormat:@"%@",[names objectAtIndex:section]];
    else if(tableView == tvMeet)
        return [NSString stringWithFormat:@"%@",[[assign objectAtIndex:section] valueForKey:@"meet"]];
    else if (tvEvent)
        return @"";
    else if (tvScore)
        return @"";
    else
        return @"";
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == tvStat)
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
        
        UIColor *backColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
        cell.backgroundColor = backColor;
        UIColor *foreColor = [UIColor colorWithWhite:1 alpha:1];
        cell.textLabel.textColor = foreColor;
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[meets objectAtIndex:[indexPath section]]];
        
        return cell;
    }
    else
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
                             action:@selector(changeMeet:) //TODO: May not need this anymore
                   forControlEvents:UIControlEventEditingChanged];
        }
        else if (tableView == tvEvent)
        {
            cell.textBox.text = [NSString stringWithFormat:@"%@",[((NSMutableArray*)[[assign objectAtIndex:curMeet] valueForKey:@"event"]) objectAtIndex:[indexPath section]]];
            [cell.textBox addTarget:self
                             action:@selector(changeEvent:)//TODO: May not need this anymore
                   forControlEvents:UIControlEventEditingChanged];
        }
        else if (tableView == tvScore)
        {
            cell.textBox.text = [NSString stringWithFormat:@"%@",[((NSMutableArray*)[[assign objectAtIndex:curMeet] valueForKey:@"score"]) objectAtIndex:[indexPath section]]];
            [cell.textBox addTarget:self
                             action:@selector(changeScore:)//TODO: May not need this anymore
                   forControlEvents:UIControlEventEditingChanged];
        }
        
        return cell;
    }
}

#pragma mark Table view delegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == tvStat)
        return UITableViewCellEditingStyleNone;
    else
        return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == tvStat)
    {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
        
        [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        
        eventMenu = [[UIDropDownMenu alloc] initWithIdentifier:@"eventMenu"];
        eventMenu.ScaleToFitParent = NO;
        eventMenu.menuWidth = 100;
        events = [[assign objectAtIndex:[indexPath section]] valueForKey:@"event"];
        NSMutableArray *curEvents = [[NSMutableArray alloc] init];
        for (int i = 0; i < [events count]; i++)
        {
            [curEvents addObject:[NSNumber numberWithInt:i]];
        }
        eventMenu.titleArray = events;
        eventMenu.valueArray = curEvents;
        [eventMenu makeMenu:tvStat targetView:self.view];
        eventMenu.delegate = self;
        
        [eventMenu selectedObjectClicked:nil];
        
        scoreMenu = [[UIDropDownMenu alloc] initWithIdentifier:@"scoreMenu"];
        scoreMenu.ScaleToFitParent = NO;
        scoreMenu.menuWidth = 100;
        score = [[assign objectAtIndex:[indexPath section]] valueForKey:@"score"];
        NSMutableArray *curScore = [[NSMutableArray alloc] init];
        for (int i = 0; i < [score count]; i++)
        {
            [curScore addObject:[NSNumber numberWithInt:i]];
        }
        scoreMenu.titleArray = score;
        scoreMenu.valueArray = curScore;
        [scoreMenu makeMenu:eventMenu targetView:self.view];
        scoreMenu.delegate = self;
        
        [scoreMenu selectedObjectClicked:nil];
    }
    else
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
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == tvStat)
    {
        UITableViewCell *cell = [tvStat cellForRowAtIndexPath:indexPath];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    else
    {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        ((TextCell*)[tableView cellForRowAtIndexPath:indexPath]).textBox.backgroundColor = [UIColor whiteColor];
        ((TextCell*)[tableView cellForRowAtIndexPath:indexPath]).textBox.textColor = [UIColor blackColor];
        [((TextCell*)[tableView cellForRowAtIndexPath:indexPath]).textBox resignFirstResponder];
    }
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

-(IBAction)singleTapFrom:(UIGestureRecognizer *)tapRecog
{
    if([[names objectAtIndex:0] rangeOfString:@"Player Non-existant" ].location != NSNotFound)
        return;
    
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


#pragma mark DropDownDelegate
- (void) DropDownMenuDidChange:(NSString *)identifier :(NSString *)ReturnValue{
    /*
     --- DropDownMenuDidChange will be triggered by the Drop Down Menu when an item has been selected. Ensure that <UIDropDownMenuDelegate> is included in the header file.
     --- (NSString *)identifier returns the value specified with initWithIdentifier.
     --- (NSString *)ReturnValue returns the selected item from the valueArray.
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
