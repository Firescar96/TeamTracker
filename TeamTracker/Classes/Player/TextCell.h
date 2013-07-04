//
//  textCell.h
//  TeamTracker
//
//  Created by Nchinda Fam on 7/3/13.
//  Copyright (c) 2013 Plum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextCell : UITableViewCell
{
    IBOutlet UITextField *textBox;
}

@property(nonatomic, retain) IBOutlet UITextField *textBox;

@end
