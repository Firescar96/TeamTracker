//
//  AppDelegate.h
//  TeamTracker
//
//  Created by Nchinda Fam on 6/19/13.
//  Copyright (c) 2013 Plum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class PlayerDataMaster;

@interface TeamTrackerAppDelegate : UIResponder <UIApplicationDelegate>
{
    bool editAble;
    
@private
    NSManagedObjectContext *managedObjectContext_;
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
}
@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, assign, getter=isEditAble) bool editAble;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory;

-(void) saveNewPlayer:(NSString*)name withStats:(NSMutableArray*)stats;
-(NSArray*) findPlayersinCategory:(NSString *)category forQuery:(NSString *)query;

@end
