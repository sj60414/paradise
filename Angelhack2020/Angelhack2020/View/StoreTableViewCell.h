//
//  StoreTableViewCell.h
//  Angelhack2020
//
//  Created by 정선민 on 2020/07/19.
//  Copyright © 2020 정선민. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StoreTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *viewBack;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UIImageView *imageItem;
@property (weak, nonatomic) IBOutlet UILabel *labelContent;
@property (weak, nonatomic) IBOutlet UIView *viewPoint;
@property (weak, nonatomic) IBOutlet UIImageView *iconSave;
@property (weak, nonatomic) IBOutlet UIImageView *iconBuy;
@property (weak, nonatomic) IBOutlet UILabel *labelPoint;
@property (weak, nonatomic) IBOutlet UIButton *btnBuy;

@end

NS_ASSUME_NONNULL_END
