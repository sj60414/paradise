//
//  DataManager.m
//  Angelhack2020
//
//  Created by 정선민 on 2020/07/18.
//  Copyright © 2020 정선민. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+ (DataManager *) getInstance{
    static DataManager *instance = nil;
    
    if(instance == nil){
        @synchronized(self){
            instance = [[DataManager alloc] init];
            instance.user = [User new];
            instance.myItemList = [NSMutableArray new];
            instance.itemList = [NSMutableArray new];
            instance.questList = [NSMutableArray new];
            instance.questDetail = [Quest new];
            instance.supportList = [NSMutableArray new];
        }
    }
    
    return instance;
}

@end
