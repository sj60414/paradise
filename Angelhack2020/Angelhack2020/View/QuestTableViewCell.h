//
//  QuestTableViewCell.h
//  Angelhack2020
//
//  Created by 정선민 on 2020/07/18.
//  Copyright © 2020 정선민. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuestTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *viewBack;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *iconSave;
@property (weak, nonatomic) IBOutlet UIImageView *iconBuy;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UIButton *btnQuest;
@property (weak, nonatomic) IBOutlet UIView *viewIcon;
@property (weak, nonatomic) IBOutlet UIView *viewDone;

@end

NS_ASSUME_NONNULL_END
