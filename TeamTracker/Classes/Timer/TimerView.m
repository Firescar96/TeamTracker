//
//  SecondViewController.m
//  SwimmerTracker
//
//  Created by Nchinda Fam on 1/13/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "TimerView.h"


@implementation TimerView

@synthesize timerSplits;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    timerSplits = [[NSMutableArray alloc] init];
    timerSplits[0] = [[TimerRow alloc] init];
    
    [[timerSplits[0] view] setFrame:CGRectMake(0, 40, 768, 160)];
    
    ///[self presentViewController:[[TimerRow alloc] init] animated:YES completion:^{
     //   [self dismissViewControllerAnimated:NO completion:nil];
        [[self view] addSubview:[timerSplits[0] view]];
   // }];
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
