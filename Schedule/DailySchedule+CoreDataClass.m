//
//  DailySchedule+CoreDataClass.m
//  Schedule
//
//  Created by 郭添伟 on 2017/6/18.
//  Copyright © 2017年 Zero. All rights reserved.
//

#import "DailySchedule+CoreDataClass.h"
#import "Schedule+CoreDataClass.h"

@implementation DailySchedule

+ (DailySchedule *)dailyScheduleWithScheduleDate:(NSString *)scheduleDate
                inManagedObjectContext:(NSManagedObjectContext *)context
{
    DailySchedule *dailySchedule = nil;
    
    if ([scheduleDate length]) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"DailySchedule"];
        request.predicate = [NSPredicate predicateWithFormat:@"scheduleDate = %@", scheduleDate];
        
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        
        if (!matches || ([matches count] > 1)) {
            // handle error
        } else if (![matches count]) {
            dailySchedule = [NSEntityDescription insertNewObjectForEntityForName:@"DailySchedule"
                                                         inManagedObjectContext:context];
            dailySchedule.scheduleDate = scheduleDate;
        } else {
            dailySchedule = [matches lastObject];
        }
    }
    
    return dailySchedule;
}

@end
