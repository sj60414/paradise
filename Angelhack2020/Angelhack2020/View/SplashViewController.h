//
//  SplashViewController.h
//  Angelhack2020
//
//  Created by 정선민 on 2020/07/18.
//  Copyright © 2020 정선민. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SplashViewController : BaseViewController{
    BOOL isKeyboard;
    int heightKeyboard;
}

@property (weak, nonatomic) IBOutlet UIView *viewSplash;
@property (weak, nonatomic) IBOutlet UIView *viewLoadingBack;
@property (weak, nonatomic) IBOutlet UIView *viewLoading;
@property (weak, nonatomic) IBOutlet UIImageView *imageLogo;

@property (weak, nonatomic) IBOutlet UIView *viewKakao;
@property (weak, nonatomic) IBOutlet UIView *viewNaver;
@property (weak, nonatomic) IBOutlet UIView *viewFacebook;
@property (weak, nonatomic) IBOutlet UIView *viewGoogle;
@property (weak, nonatomic) IBOutlet UIView *viewEmail;
@property (weak, nonatomic) IBOutlet UITextField *editEmail;
@property (weak, nonatomic) IBOutlet UIView *viewPassword;
@property (weak, nonatomic) IBOutlet UITextField *editPassword;
@property (weak, nonatomic) IBOutlet UIView *viewLogin;

- (IBAction)clickKakao:(id)sender;
- (IBAction)clickNaver:(id)sender;
- (IBAction)clickFacebook:(id)sender;
- (IBAction)clickGoogle:(id)sender;
- (IBAction)clickStart:(id)sender;

@end

NS_ASSUME_NONNULL_END
