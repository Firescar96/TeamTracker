    //
//  TimerRow.m
//  SwimmerTracker
//
//  Created by Nchinda Fam on 2/14/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "TimerRow.h"


@implementation TimerRow

@synthesize clock;
@synthesize start;
@synthesize stop;
@synthesize split;
@synthesize reset;
@synthesize oldTime;
@synthesize subTime;

-(IBAction) startClock
{
    runClock = YES;
    
    double clockTime;
    
    int hour = [[[[clock text] componentsSeparatedByString:@":"] objectAtIndex:0] intValue];
    int min = [[[[clock text] componentsSeparatedByString:@":"] objectAtIndex:1] intValue];
    int sec = [[[[clock text] componentsSeparatedByString:@":"] objectAtIndex:2] intValue];
    int mil = [[[[clock text] componentsSeparatedByString:@":"] objectAtIndex:3] intValue];
    
    clockTime = sec + (min*60) + (hour*3600) + ((double)mil/100);
    
    oldTime = [[NSDate alloc] initWithTimeIntervalSinceNow:-clockTime];
    
    //NSLog([NSString stringWithFormat:@"%f", clockTime]);
    
    [NSTimer scheduledTimerWithTimeInterval: .05 target: self
                                                      selector: @selector(updateTimer:) userInfo: nil repeats: YES];
}

-(void)updateTimer:(NSTimer*) timer
{
    if(runClock)
    {
        double oldClockTimeMili;
        int oldClockTime;
        runClock = YES;
        
        oldClockTimeMili = -[oldTime timeIntervalSinceNow];
        oldClockTime = -[oldTime timeIntervalSinceNow];
        int mil = fmod(oldClockTimeMili, 1.0)*100;

		int hour = oldClockTime/3600;
        oldClockTime = oldClockTime%3600;

		int min = oldClockTime/60;
        oldClockTime = oldClockTime%60;

		int sec = oldClockTime;
        oldClockTime = 0;
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = NSNumberFormatterNoStyle;
        formatter.minimumIntegerDigits = 2;
        formatter.maximumFractionDigits = 0;
        
        NSString *sHour = [formatter stringFromNumber:[NSNumber numberWithInt:hour]];
        NSString *sMin = [formatter stringFromNumber:[NSNumber numberWithInt:min]];
        NSString *sSec = [formatter stringFromNumber:[NSNumber numberWithInt:sec]];
        NSString *sMil = [formatter stringFromNumber:[NSNumber numberWithInt:mil]];
        
		[clock setText: [NSString stringWithFormat:@"%@%@%@%@%@%@%@", sHour,@":",sMin,@":",sSec,@":",sMil]];
    }
     else
         [timer invalidate];
}

-(void)stopClock
{
    runClock = NO;
}

-(void)splitTime
{
    [self stopClock];
    subTime = [[TimerRow alloc] init];
    
    TimerRow* nextResponder = (TimerRow*)[[[self view] superview] nextResponder];
    int y;
    int height;
    int width;
    if([nextResponder isKindOfClass:[TimerRow class]])
    {
        y = self.view.frame.origin.y;
        height = self.view.frame.size.height;
        width = self.view.frame.size.width;
        
        [nextResponder makeSpace];
        
        [[self view] setFrame:CGRectMake(0, y, 768, height+160)];
    }
    else
    {
        y = self.view.frame.origin.y;
        height = self.view.frame.size.height;
        width = self.view.frame.size.width;
        
        UIScrollView* baseView = (UIScrollView*)[[self view] superview];
        [baseView setContentSize:CGSizeMake(width, height)];
        
        [[self view] setFrame:CGRectMake(0, y, 768, height+160)];
        y = self.view.frame.origin.y+100;
    }
    
    [[subTime view] setFrame:CGRectMake(0, y, 768, 160)];
    [subTime startClock];
    self.start.alpha = 0;
    self.start.enabled = NO;
    
    self.stop.alpha = 0;
    self.stop.enabled = NO;
    
    self.split.alpha = 0;
    self.split.enabled = NO;
    //[self presentViewController:[[TimerRow alloc] init] animated:YES completion:^{
     //   [self dismissViewControllerAnimated:NO completion:nil];
        [[self view] addSubview:[subTime view]];
    //}];
}

-(void)makeSpace
{
    TimerRow* nextResponder = (TimerRow*)[[[self view] superview] nextResponder];
    int width = self.view.frame.size.width;
    int height = self.view.frame.size.height;
    int y = self.view.frame.origin.y;
    if([nextResponder isKindOfClass:[TimerRow class]])
        [nextResponder makeSpace];
    else
    {
        UIScrollView* baseView = (UIScrollView*)[[self view] superview];
        [baseView setContentSize:CGSizeMake(width, height+80)];
        //NSLog([NSString stringWithFormat:@"%i", height]);
    }

    [[self view] setFrame:CGRectMake(0, y, 768, height+160)];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	runClock = false;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)dealloc {
}


@end
