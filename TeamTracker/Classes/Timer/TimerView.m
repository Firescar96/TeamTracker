//
//  PlayerView.m
//  TeamTracker
//
//  Created by Nchinda Fam on 7/7/13.
//  Copyright (c) 2013 Plum. All rights reserved.
//

#import "TimerView.h"

@implementation TimerView

@synthesize timerMaster;

@synthesize name;
@synthesize tvTime;
@synthesize tfTime;
@synthesize bTime;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dataMaster = [[UIApplication sharedApplication] delegate];
}

- (void) viewDidAppear:(BOOL)animated
{NSLog(player);
    NSArray *array = [dataMaster findPlayersinCategory:@"name" forQuery:player];
    titles = [[NSMutableArray alloc] init];
    times = [[NSMutableArray alloc] init];
    meets = [[NSMutableArray alloc] init];
    events = [[NSMutableArray alloc] init];
    
    if(dataMaster.isEditAble)
    {
        [tvTime setEditing:YES animated:NO];
        tfTime.hidden = NO;
        bTime.hidden = NO;
    }
    else
    {
        [tvTime setEditing:YES animated:NO];
        tfTime.hidden = YES;
        bTime.hidden = YES;
        
    }
    
    if ([array count] > 0)
    {
        
        NSManagedObject *match = [array objectAtIndex:0];
        name.text = [match valueForKey:@"name"];
        assign = [[NSMutableArray alloc] init];
        //Hierarchy is as follows: [NSMutableArray*[NSMutableDictionary:meet, (NSMutableArray*)event, (NSMutableArray*)score]]
        assign = [NSKeyedUnarchiver unarchiveObjectWithData:[match valueForKey:@"stats"]];
        
        NSDictionary *timeDict;
        
        for (NSMutableDictionary *meetDict in assign)
        {
            for (int i = 0; i < [[meetDict objectForKey:@"time"] count]; i++)
            {
                timeDict = [[meetDict objectForKey:@"time"] objectAtIndex:i];
                if(timeDict != 0)
                {
                    [titles addObject:[timeDict objectForKey:@"title"]];
                    [times addObject:[timeDict objectForKey:@"time"]];
                    [meets addObject:[meetDict objectForKey:@"meet"]];
                    [events addObject:[[meetDict objectForKey:@"event"] objectAtIndex:i]];
                }
            }
        }
        [tvTime reloadData];
        
    }
}

-(IBAction) gotoNew
{
    [timerMaster performSelector:@selector(gotoNew)];
}

-(IBAction) gotoList
{
    [timerMaster performSelector:@selector(gotoList)];
}

-(IBAction)backgroundTouched:(id)sender
{
    [self.view endEditing:YES];
}

-(IBAction) addTime
{
	[self backgroundTouched:nil];
	
	[dataMaster updatePlayer:[name text] withStats:assign];
    
    [tvTime reloadData];
    
    name.text = @"";
    tfTime.text = @"";
}

-(IBAction) changeTime:(id)sender
{
    NSIndexPath *path;
    for (int i = 0; i < [titles count]; i++)
    {
        path = [NSIndexPath indexPathForRow:0 inSection:i];
        if (sender == [((TextCell*)[tvTime cellForRowAtIndexPath:path]) textBox])
        {
            for (NSMutableDictionary *meetDict in assign)
            {
                if ([[meets objectAtIndex:i] isEqualToString:[meetDict objectForKey:@"meet"]])
                {
                    [[[meetDict objectForKey:@"time"] objectForKey:@"title"] setObject:[((UITextField*)sender) text] atIndex:i];
                    return;
                }
            }
        }
    }
    for (int i = 0; i < [times count]; i++)
    {
        path = [NSIndexPath indexPathForRow:1 inSection:i];
        if (sender == [((TextCell*)[tvTime cellForRowAtIndexPath:path]) textBox])
        {
            for (NSMutableDictionary *meetDict in assign)
            {
                if ([[meets objectAtIndex:i] isEqualToString:[meetDict objectForKey:@"meet"]])
                {
                    [[[meetDict objectForKey:@"time"] objectForKey:@"time"] setObject:[((UITextField*)sender) text] atIndex:i];
                    return;
                }
            }
        }
    }

}

#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [assign count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if([dataMaster isEditAble])
    {
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
        
        if ([indexPath row] == 0)
            ((TextCell*)cell).textBox.text = [titles objectAtIndex:[indexPath section]];
        else
            ((TextCell*)cell).textBox.text = [times objectAtIndex:[indexPath section]];
        
        [((TextCell*)cell).textBox addTarget:self
                                      action:@selector(changeTime:)
                            forControlEvents:UIControlEventEditingChanged];//Edit so as not to write to database too much and use up flash memory
        
    }
    else
    {
        static NSString *CellIdentifier = @"Cell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if ([indexPath row] == 0)
        {
            cell.textLabel.text = [titles objectAtIndex:[indexPath section]];
            
        }
        else
        {
            cell.textLabel.text = [times objectAtIndex:[indexPath section]];
        }
    }
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.layer.cornerRadius = 7;
    bgColorView.layer.masksToBounds = YES;
    [bgColorView setBackgroundColor:[UIColor colorWithRed:.85 green:0 blue:0 alpha:1]];
    [cell setSelectedBackgroundView:bgColorView];
    
    UIColor *backColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    cell.backgroundColor = backColor;
    UIColor *foreColor = [UIColor colorWithWhite:0 alpha:0];
    cell.textLabel.textColor = foreColor;
    
    return cell;
}

#pragma mark Table view delegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([dataMaster isEditAble])
        return UITableViewCellEditingStyleDelete;
    else
        return UITableViewCellEditingStyleNone;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([dataMaster isEditAble])
    {
        [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        ((TextCell*)[tableView cellForRowAtIndexPath:indexPath]).textBox.backgroundColor = [UIColor blueColor];
        ((TextCell*)[tableView cellForRowAtIndexPath:indexPath]).textBox.textColor = [UIColor whiteColor];
        [((TextCell*)[tableView cellForRowAtIndexPath:indexPath]).textBox becomeFirstResponder];
        
        
        NSIndexPath *path = [tvTime indexPathForSelectedRow];
        ((TextCell*)[tvTime cellForRowAtIndexPath:path]).textBox.textColor = [UIColor blackColor];
        
        [tvTime reloadData];
    }
    else
    {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
        
        [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        
        meetMenu = [[UIDropDownMenu alloc] initWithIdentifier:@"meetMenu"];
        meetMenu.ScaleToFitParent = NO;
        meetMenu.menuWidth = 100;
        meetMenu.titleArray = meets;
        [meetMenu makeMenu:tvTime targetView:self.view];
        meetMenu.delegate = self;
        
        [meetMenu selectedObjectClicked:nil];
        
        eventMenu = [[UIDropDownMenu alloc] initWithIdentifier:@"eventMenu"];
        eventMenu.ScaleToFitParent = NO;
        eventMenu.menuWidth = 100;
        eventMenu.titleArray = events;
        [eventMenu makeMenu:eventMenu targetView:self.view];
        eventMenu.delegate = self;
        
        [eventMenu selectedObjectClicked:nil];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tvTime cellForRowAtIndexPath:indexPath];
    
    if([dataMaster isEditAble])
    {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        ((TextCell*)cell).textBox.backgroundColor = [UIColor whiteColor];
        ((TextCell*)cell).textBox.textColor = [UIColor blackColor];
        [((TextCell*)cell).textBox resignFirstResponder];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        
                for (NSMutableDictionary *meetDict in assign)
                {
                    if ([[meets objectAtIndex:[indexPath section]] isEqualToString:[meetDict objectForKey:@"meet"]])
                    {
                        [[meetDict objectForKey:@"time"] removeObjectAtIndex:[indexPath section]];
                        return;
                    }
                }
        
        [assign removeObjectAtIndex:[indexPath section]];
        [tableView deleteSections:[NSIndexSet indexSetWithIndex:[indexPath section]] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark Table view Gestures

-(IBAction)singleTapFrom:(UIGestureRecognizer *)tapRecog
{
    if([titles count] == 0)
        return;
    
    CGPoint tapLoc = [tapRecog locationInView:tvTime];
    NSIndexPath *tapPath = [tvTime indexPathForRowAtPoint:tapLoc];
    
    NSIndexPath *seleRow = [tvTime indexPathForSelectedRow];
    if([seleRow section] != [tapPath section])
        [self tableView:tvTime didDeselectRowAtIndexPath:seleRow];
    else if (seleRow == nil )
    {}
    else if([seleRow section] == [tapPath section] || [seleRow length] != 0)
        return;
    
    if(!tapPath)
        [self.view endEditing:YES];
    
    [self tableView:tvTime didSelectRowAtIndexPath:tapPath];
}

-(IBAction) cellTouch:(id)sender
{
    if(sender == [tvTime cellForRowAtIndexPath:[tvTime indexPathForSelectedRow]] ||
       sender == ((TextCell*)[tvTime cellForRowAtIndexPath:[tvTime indexPathForSelectedRow]] ).textBox)
        return;

    
    for (int i = 0; i < [assign count]; i++)
    {
        for (int j = 0; j < [[[assign objectAtIndex:i] objectForKey:@"event"] count]; j++)
        {
            NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:j];
            if (sender == [tvTime cellForRowAtIndexPath:path] || sender == [((TextCell*)[tvTime cellForRowAtIndexPath:path]) textBox])
            {
                if([tvTime indexPathForSelectedRow].length > 0)
                    [self tableView:tvTime didDeselectRowAtIndexPath:[tvTime indexPathForSelectedRow]];
                [self tableView:tvTime didSelectRowAtIndexPath:path];
                return;
            }
        }
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
