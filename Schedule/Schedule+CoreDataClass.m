//
//  Schedule+CoreDataClass.m
//  Schedule
//
//  Created by 郭添伟 on 2017/6/18.
//  Copyright © 2017年 Zero. All rights reserved.
//

#import "Schedule+CoreDataClass.h"
#import "DailySchedule+CoreDataClass.h"
#import "ScheduleInfo.h"

@implementation Schedule

+ (Schedule *)scheduleWithScheduleInfo:(NSDictionary *)scheduleDictionary
        inManagedObjectContext:(NSManagedObjectContext *)context
{
    Schedule *schedule = nil;
    
//    NSString *unique = scheduleDictionary[SCHEDULE_ID];
    NSString *unique = scheduleDictionary[UNIQUE];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Schedule"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", unique];
    
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || error || ([matches count] > 1)) {
        // handle error
    } else if ([matches count]) {
        schedule = [matches firstObject];
    } else {
        schedule = [NSEntityDescription insertNewObjectForEntityForName:@"Schedule"
                                              inManagedObjectContext:context];
        schedule.unique = unique;
        schedule.title = scheduleDictionary[TITLE];
        schedule.startTime = scheduleDictionary[START_TIME];
        schedule.endTime = scheduleDictionary[END_TIME];
        schedule.content = scheduleDictionary[CONTENT];
        schedule.completion = scheduleDictionary[COMPLETION];
        schedule.level = (int)scheduleDictionary[LEVEL];
        schedule.location = scheduleDictionary[LOCATION];
        
        
        
        NSString *scheduleDate = [scheduleDictionary valueForKeyPath:SCHEDULE_DATE];
        schedule.whenMake = [DailySchedule dailyScheduleWithScheduleDate:scheduleDate inManagedObjectContext:context];
        
    }
    
    return schedule;
}

+ (void)loadSchedulesFromScheduleInfoArray:(NSArray *)scheduleInfoSet // of scheduleInfo NSDictionary
         intoManagedObjectContext:(NSManagedObjectContext *)context
{
    for (NSDictionary *scheduleInfo in scheduleInfoSet) {
        [self scheduleWithScheduleInfo:scheduleInfo inManagedObjectContext:context];
    }
}

@end
