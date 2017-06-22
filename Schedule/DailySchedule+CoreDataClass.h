//
//  DailySchedule+CoreDataClass.h
//  Schedule
//
//  Created by 郭添伟 on 2017/6/18.
//  Copyright © 2017年 Zero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Schedule;

NS_ASSUME_NONNULL_BEGIN

@interface DailySchedule : NSManagedObject

+ (DailySchedule *)dailyScheduleWithScheduleDate:(NSString *)scheduleDate
                          inManagedObjectContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "DailySchedule+CoreDataProperties.h"
