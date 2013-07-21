    //
//  PlayerSearch.m
//  Playermer Tracker
//
//  Created by Nchinda Nchinda on 1/13/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "PlayerSearch.h"

@implementation PlayerSearch

@synthesize tvStat;
@synthesize status;
	
- (void) searchBarTextDidBeginEditing:(UISearchBar *)sender
{
	sender.showsCancelButton=YES;
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)sender
{
	[sender resignFirstResponder];
	sender.showsCancelButton=NO;
	status = [sender text];
	
	[tvStat findPlayer:status];
}      

- (void) searchBarCancelButtonClicked:(UISearchBar *)sender
{
	sender.text=@"";
	[sender resignFirstResponder];
	sender.showsCancelButton=NO;
}

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
}

@end
