//
//  DailySchedule+CoreDataProperties.m
//  Schedule
//
//  Created by 郭添伟 on 2017/6/18.
//  Copyright © 2017年 Zero. All rights reserved.
//

#import "DailySchedule+CoreDataProperties.h"

@implementation DailySchedule (CoreDataProperties)

+ (NSFetchRequest<DailySchedule *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"DailySchedule"];
}

@dynamic scheduleDate;
@dynamic schedules;

@end
