//
//  ScheduleByDailyScheduleCDTVCViewController.m
//  Schedule
//
//  Created by 郭添伟 on 2017/6/19.
//  Copyright © 2017年 Zero. All rights reserved.
//

#import "ScheduleByDailyScheduleCDTVCViewController.h"

@interface ScheduleByDailyScheduleCDTVCViewController ()

@end

@implementation ScheduleByDailyScheduleCDTVCViewController

- (void)setDailySchedule:(DailySchedule *)dailySchedule
{
    _dailySchedule = dailySchedule;
    self.title = dailySchedule.scheduleDate;
    [self setupFetchedResultController];
}

- (void)setupFetchedResultController
{
    NSManagedObjectContext *context = [self.dailySchedule managedObjectContext];
    
    if (context) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Schedule"];
        request.predicate = [NSPredicate predicateWithFormat:@"whenMake = %@", self.dailySchedule];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES selector:@selector(localizedStandardCompare:) ]];
        
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    }
    else {
        self.fetchedResultsController = nil;
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
