//
//  DailySchedule+CoreDataProperties.h
//  Schedule
//
//  Created by 郭添伟 on 2017/6/18.
//  Copyright © 2017年 Zero. All rights reserved.
//

#import "DailySchedule+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DailySchedule (CoreDataProperties)

+ (NSFetchRequest<DailySchedule *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *scheduleDate;
@property (nullable, nonatomic, retain) NSSet<Schedule *> *schedules;

@end

@interface DailySchedule (CoreDataGeneratedAccessors)

- (void)addSchedulesObject:(Schedule *)value;
- (void)removeSchedulesObject:(Schedule *)value;
- (void)addSchedules:(NSSet<Schedule *> *)values;
- (void)removeSchedules:(NSSet<Schedule *> *)values;

@end

NS_ASSUME_NONNULL_END
