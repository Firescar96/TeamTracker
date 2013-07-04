//
//  PlayerListView.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerList.h"

@interface PlayerListView : UITableView
{
	IBOutlet PlayerList *controller;
}

@property (nonatomic, retain) IBOutlet PlayerList *controller;

@end
