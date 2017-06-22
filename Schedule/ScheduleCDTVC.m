//
//  ScheduleCDTVC.m
//  Schedule
//
//  Created by 郭添伟 on 2017/6/12.
//  Copyright © 2017年 Zero. All rights reserved.
//

#import "ScheduleCDTVC.h"
#import "Schedule+CoreDataProperties.h"

@interface ScheduleCDTVC ()

@end

@implementation ScheduleCDTVC

- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Schedule"];
    request.predicate = nil;
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title"
                                                              ascending:YES
                                                               selector:@selector(localizedStandardCompare:)]];
    
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Schedule Cell"];
    
    Schedule *schedule = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = schedule.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", schedule.startTime, schedule.endTime];
    
    return cell;
}

@end
