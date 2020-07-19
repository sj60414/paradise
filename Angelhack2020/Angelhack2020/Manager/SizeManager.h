//
//  SizeManager.h
//  Angelhack2020
//
//  Created by 정선민 on 2020/07/18.
//  Copyright © 2020 정선민. All rights reserved.
//

#import "BaseImport.h"

NS_ASSUME_NONNULL_BEGIN

@interface SizeManager : NSObject

+ (SizeManager *) getInstance;

- (void) setCorner:(UIView *)view corner:(int) corner;
- (void) setShadow:(UIView *)view x:(int)x y:(int)y size:(int) size opacity:(float) opacity color:(UIColor *) color;

@end

NS_ASSUME_NONNULL_END
