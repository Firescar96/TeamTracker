//
//  OrderControl.m
//  TeamTracker
//
//  Created by Nchinda Fam on 8/3/13.
//  Copyright (c) 2013 Plum. All rights reserved.
//

#import "OrderControl.h"

@implementation OrderControl

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    int oldVal = self.selectedSegmentIndex;
    [super touchesBegan:touches withEvent:event];
    if (self.selectedSegmentIndex == oldVal)
    {
        if ([@"Name ▲" isEqualToString:[self titleForSegmentAtIndex:oldVal]])
        {
            [self setTitle:@"Name ▼" forSegmentAtIndex:oldVal];
        }
        else if ([@"Name ▼" isEqualToString:[self titleForSegmentAtIndex:oldVal]])
        {
            [self setTitle:@"Name ▲" forSegmentAtIndex:oldVal];
        }
        else if ([@"Time ▲" isEqualToString:[self titleForSegmentAtIndex:oldVal]])
        {
            [self setTitle:@"Time ▼" forSegmentAtIndex:oldVal];
        }
        else if ([@"Time ▼" isEqualToString:[self titleForSegmentAtIndex:oldVal]])
        {
            [self setTitle:@"Time ▲" forSegmentAtIndex:oldVal];
        }
    } else
    {
        [super setSelectedSegmentIndex:self.selectedSegmentIndex];
    }

}

@end
