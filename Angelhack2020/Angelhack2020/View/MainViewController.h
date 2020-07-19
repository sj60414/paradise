//
//  MainViewController.h
//  Angelhack2020
//
//  Created by 정선민 on 2020/07/18.
//  Copyright © 2020 정선민. All rights reserved.
//

#import "BaseViewController.h"
#import "QuestTableViewCell.h"
#import "SupportTableViewCell.h"
#import "StoreTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource>{
    int selectSupport;
    int selectCompany;
    int selectStore;
    
    BOOL selectMyIce;
    BOOL selectMyMountain;
    BOOL selectMyP;
    BOOL selectMyO;
}

@property (weak, nonatomic) IBOutlet UIView *viewToast;
@property (weak, nonatomic) IBOutlet UILabel *labelToast;
@property (weak, nonatomic) IBOutlet UIView *viewToastBack;

@property (weak, nonatomic) IBOutlet UIImageView *imageBack;

// Main
@property (weak, nonatomic) IBOutlet UIView *frameMain;
@property (weak, nonatomic) IBOutlet UIView *viewPoint;
@property (weak, nonatomic) IBOutlet UILabel *labelSavePoint;
@property (weak, nonatomic) IBOutlet UILabel *labelBuyPoint;
@property (weak, nonatomic) IBOutlet UIView *viewStore;
@property (weak, nonatomic) IBOutlet UIView *viewQuest;
@property (weak, nonatomic) IBOutlet UIView *viewMenu;
@property (weak, nonatomic) IBOutlet UIImageView *imageMenu;
@property (weak, nonatomic) IBOutlet UILabel *labelCountQuest;
@property (weak, nonatomic) IBOutlet UIView *viewDeco;
@property (weak, nonatomic) IBOutlet UIView *viewPeople;
@property (weak, nonatomic) IBOutlet UIView *viewCamera;
@property (weak, nonatomic) IBOutlet UIView *viewVR;
@property (weak, nonatomic) IBOutlet UIView *viewMap;

// Quest list
@property (weak, nonatomic) IBOutlet UIView *frameQuest;
@property (weak, nonatomic) IBOutlet UIView *viewQuestBack;
@property (weak, nonatomic) IBOutlet UIView *viewQuestClose;
@property (weak, nonatomic) IBOutlet UITableView *tableQuest;

// Quest detail
@property (weak, nonatomic) IBOutlet UIView *frameQuestDetail;
@property (weak, nonatomic) IBOutlet UIView *viewQuestDetailBack;
@property (weak, nonatomic) IBOutlet UIView *viewQuestDetailBack2;
@property (weak, nonatomic) IBOutlet UIView *viewQuestDetailClose;
@property (weak, nonatomic) IBOutlet UILabel *labelQuestDetailTitle;
@property (weak, nonatomic) IBOutlet UIImageView *iconQuestDetailSave;
@property (weak, nonatomic) IBOutlet UIImageView *iconQuestDetailBuy;
@property (weak, nonatomic) IBOutlet UILabel *labelQuestDetailPrice;
@property (weak, nonatomic) IBOutlet UIView *viewQuestDetailContent;
@property (weak, nonatomic) IBOutlet UILabel *labelQuestDetailContent;
@property (weak, nonatomic) IBOutlet UIView *viewQuestDetailDone;

// Support
@property (weak, nonatomic) IBOutlet UIView *frameSupport;
@property (weak, nonatomic) IBOutlet UIView *viewSupportBack;
@property (weak, nonatomic) IBOutlet UIView *viewSupportBack2;
@property (weak, nonatomic) IBOutlet UILabel *labelSupportTitle;
@property (weak, nonatomic) IBOutlet UITableView *tableSupport;
@property (weak, nonatomic) IBOutlet UIView *viewSupportPayment;
@property (weak, nonatomic) IBOutlet UIView *viewSupportClose;
@property (weak, nonatomic) IBOutlet UIButton *btnSupportDone;
@property (weak, nonatomic) IBOutlet UIView *viewSupportLoadingBack;
@property (weak, nonatomic) IBOutlet UIView *viewSupportLoading;
@property (weak, nonatomic) IBOutlet UIView *viewSupportLoadingBar;
@property (weak, nonatomic) IBOutlet UIView *viewSupportDone;
@property (weak, nonatomic) IBOutlet UIView *viewSupportDoneBack;

@property (weak, nonatomic) IBOutlet UIView *viewSupportPop;
@property (weak, nonatomic) IBOutlet UILabel *labelSupportPopBuy;
@property (weak, nonatomic) IBOutlet UILabel *labelSupportPopSave;
@property (weak, nonatomic) IBOutlet UILabel *labelSupportPopPrice;

@property (weak, nonatomic) IBOutlet UIView *viewSupportCompany;
@property (weak, nonatomic) IBOutlet UIButton *btnCompany1;
@property (weak, nonatomic) IBOutlet UIButton *btnCompany2;
@property (weak, nonatomic) IBOutlet UIButton *btnCompany3;
@property (weak, nonatomic) IBOutlet UIButton *btnCompany4;
@property (weak, nonatomic) IBOutlet UIView *viewCompanyDone;
@property (weak, nonatomic) IBOutlet UIImageView *imageCompanySelect;
@property (weak, nonatomic) IBOutlet UIButton *btnCompanyDone;

@property (weak, nonatomic) IBOutlet UIView *viewSupportItem;
@property (weak, nonatomic) IBOutlet UIView *viewSupportItemDone;

@property (weak, nonatomic) IBOutlet UIView *frameStore;
@property (weak, nonatomic) IBOutlet UIView *viewStorePoint;
@property (weak, nonatomic) IBOutlet UIView *viewStoreClose;
@property (weak, nonatomic) IBOutlet UILabel *labelStoreBuyPoint;
@property (weak, nonatomic) IBOutlet UILabel *labelStoreSavePoint;
@property (weak, nonatomic) IBOutlet UIView *viewStoreBack;
@property (weak, nonatomic) IBOutlet UITableView *tableStore;

@property (weak, nonatomic) IBOutlet UIView *frameMyItem;
@property (weak, nonatomic) IBOutlet UIView *viewMyItemBack;
@property (weak, nonatomic) IBOutlet UIView *viewMyItemClose;
@property (weak, nonatomic) IBOutlet UIView *viewMyItemBack2;
@property (weak, nonatomic) IBOutlet UIView *viewMyIce;
@property (weak, nonatomic) IBOutlet UIImageView *viewMyIceSelect;
@property (weak, nonatomic) IBOutlet UIImageView *viewMyIceUse;
@property (weak, nonatomic) IBOutlet UILabel *labelMyItemIceCount;
@property (weak, nonatomic) IBOutlet UIView *viewMyMountain;
@property (weak, nonatomic) IBOutlet UIImageView *viewMyMountainSelect;
@property (weak, nonatomic) IBOutlet UIImageView *viewMyMountainUse;
@property (weak, nonatomic) IBOutlet UIImageView *iconMyItemMountainInfinity;
@property (weak, nonatomic) IBOutlet UIView *viewMyP;
@property (weak, nonatomic) IBOutlet UIImageView *viewMyPSelect;
@property (weak, nonatomic) IBOutlet UIImageView *viewMyPUse;
@property (weak, nonatomic) IBOutlet UIImageView *iconMyItemPInfinity;
@property (weak, nonatomic) IBOutlet UIView *viewMyO;
@property (weak, nonatomic) IBOutlet UIImageView *viewMyOSelect;
@property (weak, nonatomic) IBOutlet UIImageView *viewMyOUse;
@property (weak, nonatomic) IBOutlet UILabel *labelMyItemOLeftDate;
@property (weak, nonatomic) IBOutlet UIButton *btnMyApply;

- (IBAction)clickStore:(id)sender;
- (IBAction)clickQuest:(id)sender;
- (IBAction)clickMenu:(id)sender;
- (IBAction)clickDeco:(id)sender;
- (IBAction)clickPeople:(id)sender;
- (IBAction)clickCamera:(id)sender;
- (IBAction)clickVR:(id)sender;
- (IBAction)clickMap:(id)sender;

- (IBAction)clickQuestClose:(id)sender;
- (IBAction)clickQuestDetailClose:(id)sender;
- (IBAction)clickQuestDetailCamera:(id)sender;

- (IBAction)clickSupportClose:(id)sender;
- (IBAction)clickSupportDone:(id)sender;
- (IBAction)clickCompany1:(id)sender;
- (IBAction)clickCompany2:(id)sender;
- (IBAction)clickCompany3:(id)sender;
- (IBAction)clickCompany4:(id)sender;
- (IBAction)clickCompanyDone:(id)sender;
- (IBAction)clickSupportItemDone:(id)sender;

- (IBAction)clickStoreClose:(id)sender;
- (IBAction)clickMyItemClose:(id)sender;
- (IBAction)clickMyIce:(id)sender;
- (IBAction)clickMyMountain:(id)sender;
- (IBAction)clickMyP:(id)sender;
- (IBAction)clickMyO:(id)sender;
- (IBAction)clickMyApply:(id)sender;

@end

NS_ASSUME_NONNULL_END
