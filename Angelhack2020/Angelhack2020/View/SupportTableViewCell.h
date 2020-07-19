//
//  SupportTableViewCell.h
//  Angelhack2020
//
//  Created by 정선민 on 2020/07/19.
//  Copyright © 2020 정선민. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SupportTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *viewBack;
@property (weak, nonatomic) IBOutlet UILabel *labelBuyPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelSavePrice;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UIButton *btnSupport;

@end

NS_ASSUME_NONNULL_END
