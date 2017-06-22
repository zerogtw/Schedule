//
//  AppDelegate.m
//  Schedule
//
//  Created by 郭添伟 on 2017/6/11.
//  Copyright © 2017年 Zero. All rights reserved.
//

#import "AppDelegate.h"
#import "DailySchedule+CoreDataProperties.h"
#import "Schedule+CoreDataClass.h"
#import "ScheduleDatabaseAvailability.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self testInit];
    
    return YES;
}

- (void)testInit
{
    NSManagedObjectContext *context1 = [self.persistentContainer newBackgroundContext];
    //initial DailyScheduleEntity
    for (int i = 0; i < 30; i++) {
        DailySchedule *dailySchedule = [NSEntityDescription insertNewObjectForEntityForName:@"DailySchedule" inManagedObjectContext:context1];
        int n = 20170618 + i;
        dailySchedule.scheduleDate = [NSString stringWithFormat:@"%d", n];
    }
    
    //initial ScheduleEneity
    for (int i = 0; i < 10; i++) {
        Schedule *schedule = [NSEntityDescription insertNewObjectForEntityForName:@"Schedule" inManagedObjectContext:context1];
        schedule.unique = [NSString stringWithFormat:@"%d", (2017061801 + i)];
        schedule.title = [NSString stringWithFormat:@"title%d", i];
        schedule.startTime = [self getStartTime];
        schedule.endTime = [self getEndTime];
        schedule.content = [NSString stringWithFormat:@"hello%d%d%d", i, i, i];
        schedule.completion = NO;
        schedule.level = 3;
        schedule.location = [NSString stringWithFormat:@"Guangdong"];
        
        NSString *scheduleDate = [NSString stringWithFormat:@"%d", 20170618];
        schedule.whenMake = [DailySchedule dailyScheduleWithScheduleDate:scheduleDate inManagedObjectContext:context1];
        
    }
    
    for (int i = 0; i < 10; i++) {
        Schedule *schedule = [NSEntityDescription insertNewObjectForEntityForName:@"Schedule" inManagedObjectContext:context1];
        schedule.unique = [NSString stringWithFormat:@"%d", (2017062201 + i)];
        schedule.title = [NSString stringWithFormat:@"title%d", i];
        schedule.startTime = [self getStartTime];
        schedule.endTime = [self getEndTime];
        schedule.content = [NSString stringWithFormat:@"hello%d%d%d", i, i, i];
        schedule.completion = NO;
        schedule.level = 2;
        schedule.location = [NSString stringWithFormat:@"Guangdong"];
        
        NSString *scheduleDate = [NSString stringWithFormat:@"%d", 20170622];
        schedule.whenMake = [DailySchedule dailyScheduleWithScheduleDate:scheduleDate inManagedObjectContext:context1];
    }
    
    [self.persistentContainer performBackgroundTask:^(NSManagedObjectContext * context) {
        [context1 save:nil];
    }];
    
    NSDictionary *userInfo = self.persistentContainer.viewContext ? @{ ScheduleDatabaseAvailabilityContext : self.persistentContainer.viewContext} : nil;
    //notification
    [[NSNotificationCenter defaultCenter] postNotificationName:ScheduleDatabaseAvailabilityNotification object:self userInfo:userInfo];
    
}

- (NSDate *)getStartTime
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    
    NSDate *date = [NSDate date];
    
    // US English Locale (en_US)
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSLog(@"%@", [dateFormatter stringFromDate:date]); // Jan 2, 2001
    
    return date;
}

- (NSDate *)getEndTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    
    NSDate *now = [NSDate date];
    NSDate *date = [NSDate dateWithTimeInterval:3600 sinceDate:now];
    
    // US English Locale (en_US)
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSLog(@"%@", [dateFormatter stringFromDate:date]); // Jan 2, 2001
    
    return date;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Schedule"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
