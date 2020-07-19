//
//  ImageManager.m
//  Angelhack2020
//
//  Created by 정선민 on 2020/07/18.
//  Copyright © 2020 정선민. All rights reserved.
//

#import "ImageManager.h"

@implementation ImageManager

+ (ImageManager *) getInstance{
    static ImageManager *instance = nil;
    
    if(instance == nil){
        @synchronized(self){
            instance = [[ImageManager alloc] init];
        }
    }
    
    return instance;
}

- (void) imageDownload:(UIImageView *) imageView url:(NSString *) url{
    if(url == nil || imageView == nil)return;
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError * error) {
        if (!error){
            imageView.image = [UIImage imageWithData:data];
        }
    }];
}

@end
