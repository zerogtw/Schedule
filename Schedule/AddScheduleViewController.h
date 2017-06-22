//
//  AddScheduleViewController.h
//  Schedule
//
//  Created by 郭添伟 on 2017/6/22.
//  Copyright © 2017年 Zero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Schedule+CoreDataClass.h"
@interface AddScheduleViewController : UIViewController

//in
@property (nonatomic, strong) NSString *scheduleDate;
@property (nonatomic, strong) NSManagedObjectContext *managerObjectContext;

//out
@property (nonatomic, strong) Schedule *addedSchedule;

@end
