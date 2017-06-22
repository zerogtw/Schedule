//
//  Schedule+CoreDataProperties.m
//  Schedule
//
//  Created by 郭添伟 on 2017/6/18.
//  Copyright © 2017年 Zero. All rights reserved.
//

#import "Schedule+CoreDataProperties.h"

@implementation Schedule (CoreDataProperties)

+ (NSFetchRequest<Schedule *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Schedule"];
}

@dynamic completion;
@dynamic content;
@dynamic endTime;
@dynamic level;
@dynamic location;
@dynamic startTime;
@dynamic title;
@dynamic unique;
@dynamic whenMake;

@end
