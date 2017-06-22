//
//  AppDelegate.h
//  Schedule
//
//  Created by 郭添伟 on 2017/6/11.
//  Copyright © 2017年 Zero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

