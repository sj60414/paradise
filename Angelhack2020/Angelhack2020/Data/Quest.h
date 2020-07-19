//
//  Quest.h
//  Angelhack2020
//
//  Created by 정선민 on 2020/07/18.
//  Copyright © 2020 정선민. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Quest : NSObject

@property NSString *seq;
@property NSString *title;
@property NSString *type;
@property NSString *content;
@property NSString *point;
@property NSString *is_success;
@property NSString *picture;

@end

NS_ASSUME_NONNULL_END
