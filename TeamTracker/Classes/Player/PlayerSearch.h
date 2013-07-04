//
//  PlayerSearch.h
//  Playermer Tracker
//
//  Created by Nchinda Nchinda on 1/13/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerList.h"

@interface PlayerSearch : UISearchDisplayController<UISearchDisplayDelegate, UISearchBarDelegate> {	
	PlayerList *tvStat;
	
	NSString *status;
}

@property (nonatomic, retain) IBOutlet PlayerList *tvStat;
@property (nonatomic, retain) IBOutlet NSString *status;

@end
