//
//  Item.h
//  Angelhack2020
//
//  Created by 정선민 on 2020/07/18.
//  Copyright © 2020 정선민. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject

@property NSString *seq;
@property NSString *type;
@property NSString *name;
@property NSString *content;
@property NSString *picture;
@property NSString *buy_count;
@property NSString *is_use;
@property NSString *left_date;
@property NSString *price;
@property NSString *point_type;

@end

NS_ASSUME_NONNULL_END
