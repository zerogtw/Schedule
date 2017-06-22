//
//  Schedule+CoreDataProperties.h
//  Schedule
//
//  Created by 郭添伟 on 2017/6/18.
//  Copyright © 2017年 Zero. All rights reserved.
//

#import "Schedule+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Schedule (CoreDataProperties)

+ (NSFetchRequest<Schedule *> *)fetchRequest;

@property (nonatomic) BOOL completion;
@property (nullable, nonatomic, copy) NSString *content;
@property (nullable, nonatomic, copy) NSDate *endTime;
@property (nonatomic) int32_t level;
@property (nullable, nonatomic, copy) NSString *location;
@property (nullable, nonatomic, copy) NSDate *startTime;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *unique;
@property (nullable, nonatomic, retain) DailySchedule *whenMake;

@end

NS_ASSUME_NONNULL_END
