//
//  ScheduleInfo.h
//  Schedule
//
//  Created by 郭添伟 on 2017/6/18.
//  Copyright © 2017年 Zero. All rights reserved.
//

#import <Foundation/Foundation.h>

#define COMPLETION @"completion"
#define CONTENT @"content"
#define END_TIME @"end_time"
#define LEVEL @"level"
#define LOCATION @"location"
#define START_TIME @"startTime"
#define TITLE @"title"
#define UNIQUE @"unique"
#define SCHEDULE_DATE @"scheduleDate"

@interface ScheduleInfo : NSObject

+ (ScheduleInfo *)getRecentScheduleInfo;
+ (NSArray *)getAllScheduleInfo;

@end
