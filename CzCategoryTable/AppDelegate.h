//
//  AppDelegate.h
//  CzCategoryTable
//
//  Created by yifanjie on 2018/4/2.
//  Copyright © 2018年 yifanjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

