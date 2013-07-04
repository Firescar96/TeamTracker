//
//  SecondViewController.h
//  SwimmerTracker
//
//  Created by Nchinda Fam on 1/13/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimerRow.h"

@interface TimerView : UIViewController {

	 IBOutletCollection(TimerRow) NSMutableArray *timerSplits;
}

@property (nonatomic, retain) NSMutableArray *timerSplits;

@end
