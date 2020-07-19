//
//  LinkManager.h
//  Angelhack2020
//
//  Created by 정선민 on 2020/07/18.
//  Copyright © 2020 정선민. All rights reserved.
//

#import "BaseImport.h"

NS_ASSUME_NONNULL_BEGIN

@interface LinkManager : NSObject

+ (LinkManager *) getInstance;

-(void) executeMain:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
