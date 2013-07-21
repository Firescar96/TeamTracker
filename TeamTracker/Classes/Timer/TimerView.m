//
//  SecondViewController.m
//  SwimmerTracker
//
//  Created by Nchinda Fam on 1/13/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "TimerView.h"


@implementation TimerView

@synthesize sView;

@synthesize timerSplits;
@synthesize reset;

@synthesize playerList;
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    playerList = [[PlayerNameList alloc] init];
    
    timerSplits = [[TimerRow alloc] init];
    [[timerSplits view] setFrame:CGRectMake(0, 40, 768, 160)];
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:.7];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromTop];
    [[timerSplits.view layer] addAnimation:animation forKey:@"newSubTime"];
    [[self sView] addSubview:[timerSplits view]];
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


- (void)dealloc {
}

@end
