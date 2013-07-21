//
//  FlipLeftSegue.m
//  TeamTracker
//
//  Created by Nchinda Fam on 7/7/13.
//  Copyright (c) 2013 Plum. All rights reserved.
//

#import "FlipLeftSegue.h"

@implementation FlipLeftSegue

- (id)initWithIdentifier:(NSString *)iden source:(UIViewController *)sour destination:(UIViewController *)dest
{
    self = [super initWithIdentifier:iden source:sour destination:dest];

    return self;
}

- (void)perform
{
    
    UIViewController *src = [self sourceViewController];
    UIViewController *dst = [self destinationViewController];
    
    [UIView transitionWithView:src.navigationController.view duration:0.8 options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        [src.navigationController pushViewController:dst animated:NO];
                    }
                    completion:NULL];
}

@end
