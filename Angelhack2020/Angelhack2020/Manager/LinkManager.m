//
//  LinkManager.m
//  Angelhack2020
//
//  Created by 정선민 on 2020/07/18.
//  Copyright © 2020 정선민. All rights reserved.
//

#import "LinkManager.h"
#import "MainViewController.h"

@implementation LinkManager

+ (LinkManager *) getInstance{
    static LinkManager *instance = nil;
    
    if(instance == nil){
        @synchronized(self){
            instance = [[LinkManager alloc] init];
        }
    }
    
    return instance;
}

-(void) executeMain:(UIViewController *)vc{
    MainViewController *mvc = [[vc storyboard] instantiateViewControllerWithIdentifier:@"MainViewController"];
    mvc.modalPresentationStyle = UIModalPresentationFullScreen;
    [vc presentViewController:mvc animated:YES completion:^(void){}];
}

@end
