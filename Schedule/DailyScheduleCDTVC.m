//
//  DailyScheduleCDTVC.m
//  Schedule
//
//  Created by 郭添伟 on 2017/6/18.
//  Copyright © 2017年 Zero. All rights reserved.
//

#import "DailyScheduleCDTVC.h"
#import "DailySchedule+CoreDataProperties.h"
#import "ScheduleDatabaseAvailability.h"
#import "ScheduleByDailyScheduleCDTVCViewController.h"
#import "AddScheduleViewController.h"

@interface DailyScheduleCDTVC ()

@end

@implementation DailyScheduleCDTVC

- (void)awakeFromNib
{
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserverForName:ScheduleDatabaseAvailabilityNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        self.managedObjectContext = note.userInfo[ScheduleDatabaseAvailabilityContext];
    }];
    
}

- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;
    
    NSFetchRequest *request = [DailySchedule fetchRequest];
    request.predicate = nil;
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"scheduleDate"
                                                              ascending:NO
                                                               selector:@selector(localizedStandardCompare:)]];
    
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"DailySchedule Cell"];
    
    DailySchedule *dailySchedule = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = dailySchedule.scheduleDate;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d schedules", (int)[dailySchedule.schedules count]];
    
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareViewController:(id)vc forSegue:(NSString *)segueIdentifer fromIndexPath:(NSIndexPath *)indexPath
{
    DailySchedule *dailySchedule = [self.fetchedResultsController objectAtIndexPath:indexPath];
    if ([vc isKindOfClass:[ScheduleByDailyScheduleCDTVCViewController class]]) {
        ScheduleByDailyScheduleCDTVCViewController *sbdscdtvc = (ScheduleByDailyScheduleCDTVCViewController *)vc;
        sbdscdtvc.dailySchedule = dailySchedule;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[AddScheduleViewController class]]) {
        NSString *date = [self dateNow];
        AddScheduleViewController *asvc = segue.destinationViewController;
        asvc.scheduleDate = date;
        asvc.managerObjectContext = self.managedObjectContext;
    }else if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        [self prepareViewController:segue.destinationViewController
                           forSegue:segue.identifier
                      fromIndexPath:indexPath];
    }
}

- (IBAction)addedSchedule:(UIStoryboardSegue *)segue
{
    if ([segue.sourceViewController isKindOfClass:[AddScheduleViewController class]]) {
        AddScheduleViewController *asvc = segue.sourceViewController;
        //提示添加成功
    }
}

- (NSString *)dateNow
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"]; //2017-06-22
    
    NSString *date = [dateFormatter stringFromDate:[NSDate date]];
    
    dateFormatter.locale = [NSLocale currentLocale];
    
    return date;
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
