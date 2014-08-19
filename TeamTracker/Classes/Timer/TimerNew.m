//
//  SecondViewController.m
//  SwimmerTracker
//
//  Created by Nchinda Fam on 1/13/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "TimerNew.h"
#import "TimerList.h"

@implementation TimerNew

@synthesize dataMaster;

@synthesize timerMaster;
@synthesize sView;

@synthesize timerSplits;
@synthesize save;
@synthesize timeTitle;

@synthesize playerList;
@synthesize meetList;
@synthesize eventList;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    dataMaster = [[UIApplication sharedApplication] delegate];
    
    playerList = [[PlayerNameList alloc] init];
    playerList.presenting = self;
    meetList = [[PlayerMeetList alloc] init];
    meetList.presenting = self;
    eventList = [[PlayerEventList alloc] init];
    eventList.presenting = self;
    
    timerSplits = [[TimerRow alloc] init];
    [[timerSplits view] setFrame:CGRectMake(0, 40, 768, 160)];
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:.7];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromTop];
    [[timerSplits.view layer] addAnimation:animation forKey:@"newSubTime"];
    [[self sView] addSubview:[timerSplits view]];
}

-(IBAction) gotoList
{
    [timerMaster performSelector:@selector(gotoList)];
}

-(IBAction) gotoView
{
    [timerMaster performSelector:@selector(gotoView)];
}

-(IBAction)resetClocks
{
    [timerSplits stopClock];
    [timerSplits.view removeFromSuperview];
    
    timerSplits = [[TimerRow alloc] init];
    [[timerSplits view] setFrame:CGRectMake(0, 40, 768, 160)];
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:1];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromTop];
    [[timerSplits.view layer] addAnimation:animation forKey:@"newSubTime"];
    [[self sView] addSubview:[timerSplits view]];
}

-(IBAction) saveClocks
{
    playerList.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:playerList animated:YES completion:nil];
}

-(void) savePlayer:(id)sender
{
    if (sender == save)
        playerList.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    else if(sender == playerList)
    {
        [self dismissViewControllerAnimated:YES completion:^(void)
         {
             meetList.name = playerList.name;
             meetList.modalPresentationStyle = UIModalPresentationFormSheet;
             [self presentViewController:meetList animated:YES completion:nil];
         }];
    }
    else if(sender == meetList)
    {
        [self dismissViewControllerAnimated:YES completion:^(void)
         {
             eventList.name = playerList.name;
             eventList.meet = meetList.meet;
             eventList.modalPresentationStyle = UIModalPresentationFormSheet;
             [self presentViewController:eventList animated:YES completion:nil];
         }];
    }
    else if (sender == eventList)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
        
        [playerList updateData];
        [meetList updateData];
        [eventList updateData];
        
        NSMutableDictionary *timeDict = [[NSMutableDictionary alloc] init];
        [timeDict setValue:[timeTitle text] forKey:@"title"];
        [timeDict setValue:[timerSplits subClockTime] forKey:@"time"];
        
        NSManagedObject *match = [[dataMaster findPlayersinCategory:@"name" forQuery:playerList.name] objectAtIndex:0];
        NSArray *statList = [NSKeyedUnarchiver unarchiveObjectWithData:[match valueForKey:@"stats"]];
        for (NSMutableDictionary *stat in statList)
        {
            if ([meetList.meet isEqualToString:[stat objectForKey:@"meet"] ])
            {
                NSString *eve;
                for (int i = 0; i < [[stat objectForKey:@"event"] count]; i++)
                {
                    eve = [[stat objectForKey:@"event"] objectAtIndex:i];
                    if ([eve isEqualToString:eventList.event])
                    {
                        if ([stat objectForKey:@"time"] == nil)
                            [stat setObject:[[NSMutableArray alloc]init] forKey:@"time"];
                        
                        [((NSMutableArray*)[stat objectForKey:@"time"]) setObject:timeDict atIndexedSubscript:i];
                        
                        [dataMaster updatePlayer:playerList.name withStats:statList];
                        break;
                    }
                }
                
                break;
            }
        }
        
        [self resetClocks];
    }
}

- (UIAlertView*)showWaitIndicator:(NSString *)title
{
    UIAlertView *progressAlert;
    progressAlert = [[UIAlertView alloc] initWithTitle:title
                                               message:@"Please wait..."
                                              delegate:nil
                                     cancelButtonTitle:nil
                                     otherButtonTitles:nil];
    [progressAlert show];
    
    UIActivityIndicatorView *activityView;
    activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityView.center = CGPointMake(progressAlert.bounds.size.width / 2,
                                      progressAlert.bounds.size.height - 45);
    
    [progressAlert addSubview:activityView];
    [activityView startAnimating];
    return progressAlert;
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

@end
