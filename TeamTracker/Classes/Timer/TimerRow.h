//
//  TimerRow.h
//  SwimmerTracker
//
//  Created by Nchinda Fam on 2/14/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface TimerRow : UIViewController {
	IBOutlet UILabel *clock;
	IBOutlet UIButton *start;
	IBOutlet UIButton *stop;
	IBOutlet UIButton *split;
	
	bool runClock;
}


@property (nonatomic, retain) IBOutlet UILabel *clock;
@property (nonatomic, retain) IBOutlet UIButton *start;
@property (nonatomic, retain) IBOutlet UIButton *stop;
@property (nonatomic, retain) IBOutlet UIButton *split;
@property (nonatomic, retain) NSDate *oldTime;
@property (nonatomic, retain) TimerRow *subTime;

-(IBAction) startClock;
-(IBAction) stopClock;
-(IBAction) splitTime;

-(void) makeSpace;
-(NSString*) subClockTime; //returns clock and subview clocks' time
@end
