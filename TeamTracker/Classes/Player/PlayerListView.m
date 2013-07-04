//
//  PlayerListView.m
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "PlayerListView.h"


@implementation PlayerListView

@synthesize controller;

-(BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
	UITouch *touch = [touches anyObject];
	NSUInteger tapCount = [touch tapCount];
	
	if (tapCount == 2)
	{
		NSIndexPath *curInd = [self indexPathForSelectedRow];
		if ([self numberOfSections] > 0 && [controller foundReps] > 0) 
		{	
			//TODO: Make this method [controller displayPlayer:curInd];
			
		}
	}
	return YES;
}

@end
