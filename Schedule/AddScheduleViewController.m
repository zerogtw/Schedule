//
//  AddScheduleViewController.m
//  Schedule
//
//  Created by 郭添伟 on 2017/6/22.
//  Copyright © 2017年 Zero. All rights reserved.
//

#import "AddScheduleViewController.h"
#import "DailySchedule+CoreDataClass.h"

@interface AddScheduleViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UITextField *startTimeTextField;

@property (weak, nonatomic) IBOutlet UITextField *endTimeTextField;


@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (nonatomic, readwrite) NSInteger *level;

@end

@implementation AddScheduleViewController

- (void)viewDidLoad
{
    self.contentTextView.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)cancel {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)done {
    Schedule *schedule = [NSEntityDescription insertNewObjectForEntityForName:@"Schedule" inManagedObjectContext:self.managerObjectContext];
    schedule.unique = [NSString stringWithFormat:@"%d", (2017061801 + 1)];
    schedule.title = self.titleTextField.text;
    schedule.startTime = self.startTimeTextField.text;
    schedule.endTime = self.endTimeTextField.text;
    schedule.content = self.contentTextView.text;
    schedule.completion = NO;
    schedule.level = (int32_t)self.level;
    schedule.location = [NSString stringWithFormat:@"Guangdong"];
    
    schedule.whenMake = [DailySchedule dailyScheduleWithScheduleDate:self.scheduleDate inManagedObjectContext:self.managerObjectContext];
}

#define LEVEL1 (long *)1
#define LEVEL2 (long *)2
#define LEVEL3 (long *)3

- (IBAction)levelOne {
    self.level = LEVEL1;
}

- (IBAction)levelTwo {
    self.level = LEVEL2;
}

- (IBAction)levelThree {
    self.level = LEVEL3;
}


- (IBAction)location {
}

#pragma TextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

@end
