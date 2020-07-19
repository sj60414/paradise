//
//  DataManager.h
//  Angelhack2020
//
//  Created by 정선민 on 2020/07/18.
//  Copyright © 2020 정선민. All rights reserved.
//

#import "BaseImport.h"
#import "User.h"
#import "Item.h"
#import "Quest.h"
#import "Support.h"

NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject

@property User *user;
@property NSMutableArray *itemList;
@property NSMutableArray *myItemList;
@property NSMutableArray *questList;
@property Quest *questDetail;
@property NSMutableArray *supportList;

+ (DataManager *) getInstance;

@end

NS_ASSUME_NONNULL_END
