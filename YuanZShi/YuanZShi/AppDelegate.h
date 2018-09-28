//
//  AppDelegate.h
//  YuanZShi
//
//  Created by 疏影浮生 on 2018/9/27.
//  Copyright © 2018年 YixinJinansunreading. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

