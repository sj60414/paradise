//
//  SizeManager.m
//  Angelhack2020
//
//  Created by 정선민 on 2020/07/18.
//  Copyright © 2020 정선민. All rights reserved.
//

#import "SizeManager.h"

@implementation SizeManager

+ (SizeManager *) getInstance{
    static SizeManager *instance = nil;
    
    if(instance == nil){
        @synchronized(self){
            instance = [[SizeManager alloc] init];
        }
    }
    
    return instance;
}

- (void) setCorner:(UIView *)view corner:(int) corner{
    view.layer.cornerRadius = corner;
    view.layer.masksToBounds = true;
}

- (void) setShadow:(UIView *)view x:(int)x y:(int)y size:(int) size opacity:(float) opacity color:(UIColor *) color{
    view.layer.masksToBounds = false;
    view.layer.shadowColor = color.CGColor;
    view.layer.shadowOffset = CGSizeMake(x, y);
    view.layer.shadowRadius = size;
    view.layer.shadowOpacity = opacity;
}

@end
