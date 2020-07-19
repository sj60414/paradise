//
//  SplashViewController.m
//  Angelhack2020
//
//  Created by 정선민 on 2020/07/18.
//  Copyright © 2020 정선민. All rights reserved.
//

#import "SplashViewController.h"

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[SizeManager getInstance] setCorner:_viewLoadingBack corner:5];
    [[SizeManager getInstance] setCorner:_viewLoading corner:5];
    
    [[SizeManager getInstance] setCorner:_viewKakao corner:11];
    [[SizeManager getInstance] setShadow:_viewKakao x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewNaver corner:11];
    [[SizeManager getInstance] setShadow:_viewNaver x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewFacebook corner:11];
    [[SizeManager getInstance] setShadow:_viewFacebook x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewGoogle corner:11];
    [[SizeManager getInstance] setShadow:_viewGoogle x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewEmail corner:11];
    [[SizeManager getInstance] setShadow:_viewEmail x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewPassword corner:11];
    [[SizeManager getInstance] setShadow:_viewPassword x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewLogin corner:11];
    [[SizeManager getInstance] setShadow:_viewLogin x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        self->_viewSplash.hidden = 1;
    });
    
    CGRect frameLoding = _viewLoading.frame;
    frameLoding.size.width = _viewLoadingBack.frame.size.width;
    [UIView animateWithDuration:2.0 animations:^{
        [self->_viewLoading setFrame:frameLoding];
        float degrees = 30;
        self->_imageLogo.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
    }];
}

- (IBAction)clickStart:(id)sender {
    [self moveToMain:_editEmail.text];
}

- (IBAction)clickGoogle:(id)sender {
    [self moveToMain:@"Google@google.com"];
}

- (IBAction)clickFacebook:(id)sender {
    [self moveToMain:@"Facebook@facebook.com"];
}

- (IBAction)clickNaver:(id)sender {
    [self moveToMain:@"Naver@naver.com"];
}

- (IBAction)clickKakao:(id)sender {
    [self moveToMain:@"Kakao@kakao.com"];
}

- (void) moveToMain:(NSString *)email{
    [DataManager getInstance].user.seq = @"0";
    [DataManager getInstance].user.email = email;
    [DataManager getInstance].user.buy_point = @"100";
    [DataManager getInstance].user.save_point = @"100";
    [DataManager getInstance].user.user_name = [email componentsSeparatedByString:@"@"][0];
    [[LinkManager getInstance] executeMain:self];
}

@end
