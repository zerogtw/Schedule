//
//  Schedule+CoreDataClass.h
//  Schedule
//
//  Created by 郭添伟 on 2017/6/18.
//  Copyright © 2017年 Zero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DailySchedule;

NS_ASSUME_NONNULL_BEGIN

@interface Schedule : NSManagedObject

+ (Schedule *)scheduleWithScheduleInfo:(NSDictionary *)scheduleDictionary
                inManagedObjectContext:(NSManagedObjectContext *)context;

+ (void)loadSchedulesFromScheduleInfoArray:(NSArray *)scheduleInfoSet // of scheduleInfo NSDictionary
                  intoManagedObjectContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "Schedule+CoreDataProperties.h"
