//
//  MainViewController.m
//  Angelhack2020
//
//  Created by 정선민 on 2020/07/18.
//  Copyright © 2020 정선민. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView == _tableQuest){
        return [DataManager getInstance].questList.count + 1;
    }
    else if(tableView == _tableSupport){
        return [DataManager getInstance].supportList.count;
    }
    else if(tableView == _tableStore){
        return [DataManager getInstance].itemList.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView == _tableQuest){
        QuestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuestTableViewCell"];
        [[SizeManager getInstance] setCorner:cell.viewBack corner:14];
        [[SizeManager getInstance] setShadow:cell.viewBack x:0 y:3 size:5 opacity:0.16 color:[UIColor blackColor]];
        [[SizeManager getInstance] setCorner:cell.viewDone corner:19.5];
        [[SizeManager getInstance] setShadow:cell.viewDone x:0 y:3 size:5 opacity:0.16 color:[UIColor blackColor]];
        [cell.viewBack setAlpha:1.0];

        if(indexPath.row >= [DataManager getInstance].questList.count){
            cell.iconBuy.hidden = 1;
            cell.iconSave.hidden = 1;
            cell.labelPrice.hidden = 1;
            cell.viewIcon.hidden = 0;
            cell.labelTitle.text = @"착한 기업 후원하기";
            [cell.btnQuest setEnabled:true];
            [cell.btnQuest addTarget:self action:@selector(clickSupport:) forControlEvents:UIControlEventTouchUpInside];
        }
        else{
            Quest *quest = [[DataManager getInstance].questList objectAtIndex:indexPath.row];
            cell.labelPrice.hidden = 0;
            cell.viewIcon.hidden = 1;
            if([quest.type isEqualToString:@"1"]){
                cell.iconSave.hidden = 1;
                cell.iconBuy.hidden = 0;
            }
            else{
                cell.iconBuy.hidden = 1;
                cell.iconSave.hidden = 0;
            }
            cell.labelTitle.text = quest.title;
            cell.labelPrice.text = quest.point;
            if([quest.is_success isEqualToString:@"1"]){
                cell.viewDone.hidden = 0;
                [cell.btnQuest setEnabled:false];
                [cell.viewBack setAlpha:0.5];
            }
            else{
                cell.viewDone.hidden = 1;
                [cell.btnQuest setEnabled:true];
                cell.btnQuest.tag = indexPath.row;
                [cell.btnQuest addTarget:self action:@selector(clickQuestDetail:) forControlEvents:UIControlEventTouchUpInside];
            }
        }
        
        return cell;
    }
    else if(tableView == _tableSupport){
        SupportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SupportTableViewCell"];
        [[SizeManager getInstance] setCorner:cell.viewBack corner:14];
        [[SizeManager getInstance] setShadow:cell.viewBack x:0 y:3 size:5 opacity:0.16 color:[UIColor blackColor]];
        
        Support *support = [[DataManager getInstance].supportList objectAtIndex:indexPath.row];
        
        cell.labelBuyPrice.text = support.buy_point;
        cell.labelSavePrice.text = support.save_point;
        cell.labelPrice.text = support.price;
        cell.btnSupport.tag = indexPath.row;
        [cell.btnSupport addTarget:self action:@selector(clickSupportItem:) forControlEvents:UIControlEventTouchUpInside];
        if(indexPath.row == selectSupport){
            [cell.viewBack setBackgroundColor:[UIColor colorWithRed:255/255.0 green:249/255.0 blue:201/255.0 alpha:1.0]];
        }
        else{
            [cell.viewBack setBackgroundColor:[UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0]];
        }
        
        return cell;
    }
    else if(tableView == _tableStore){
        StoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoreTableViewCell"];
        [[SizeManager getInstance] setCorner:cell.contentView corner:14];
        [[SizeManager getInstance] setCorner:cell.viewBack corner:14];
        [[SizeManager getInstance] setShadow:cell.viewBack x:0 y:3 size:5 opacity:0.16 color:[UIColor blackColor]];
        [[SizeManager getInstance] setCorner:cell.viewPoint corner:13];
        [[SizeManager getInstance] setShadow:cell.viewPoint x:0 y:3 size:5 opacity:0.16 color:[UIColor blackColor]];
        
        Item *store = [[DataManager getInstance].itemList objectAtIndex:indexPath.row];
        
        cell.labelName.text = store.name;
        cell.labelContent.text = store.content;
        cell.labelPoint.text = store.price;
        if([store.point_type isEqualToString:@"1"]){
            cell.iconBuy.hidden = 0;
            cell.iconSave.hidden = 1;
        }
        else{
            cell.iconBuy.hidden = 1;
            cell.iconSave.hidden = 0;
        }
        cell.imageItem.image = [UIImage imageNamed:store.picture];
        cell.btnBuy.tag = indexPath.row;
        [cell.btnBuy addTarget:self action:@selector(clickStoreBuy:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }
    return nil;
}

- (void) initView{
    [[SizeManager getInstance] setCorner:_viewMenu corner:22.5];
    [[SizeManager getInstance] setShadow:_viewMenu x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewDeco corner:22.5];
    [[SizeManager getInstance] setShadow:_viewDeco x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewPeople corner:22.5];
    [[SizeManager getInstance] setShadow:_viewPeople x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewCamera corner:22.5];
    [[SizeManager getInstance] setShadow:_viewCamera x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewVR corner:22.5];
    [[SizeManager getInstance] setShadow:_viewVR x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewMap corner:22.5];
    [[SizeManager getInstance] setShadow:_viewMap x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewQuest corner:27.5];
    [[SizeManager getInstance] setShadow:_viewQuest x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewQuestClose corner:27.5];
    [[SizeManager getInstance] setShadow:_viewQuestClose x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewQuestDetailClose corner:27.5];
    [[SizeManager getInstance] setShadow:_viewQuestDetailClose x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewPoint corner:10];
    [[SizeManager getInstance] setShadow:_viewPoint x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewStore corner:10];
    [[SizeManager getInstance] setShadow:_viewStore x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewQuestBack corner:22];
    [[SizeManager getInstance] setShadow:_viewQuestBack x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewQuestDetailBack corner:22];
    [[SizeManager getInstance] setShadow:_viewQuestDetailBack x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewQuestDetailBack2 corner:14];
    [[SizeManager getInstance] setShadow:_viewQuestDetailBack2 x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewQuestDetailContent corner:21];
    [[SizeManager getInstance] setShadow:_viewQuestDetailContent x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewQuestDetailDone corner:45];
    [[SizeManager getInstance] setShadow:_viewQuestDetailDone x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewSupportBack corner:14];
    [[SizeManager getInstance] setShadow:_viewSupportBack x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewSupportBack2 corner:22];
    [[SizeManager getInstance] setShadow:_viewSupportBack2 x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewSupportPayment corner:14];
    [[SizeManager getInstance] setShadow:_viewSupportPayment x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_labelCountQuest corner:10];
    [[SizeManager getInstance] setCorner:_viewSupportClose corner:27.5];
    [[SizeManager getInstance] setShadow:_viewSupportClose x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewSupportLoading corner:5];
    [[SizeManager getInstance] setCorner:_viewSupportLoadingBar corner:5];
    [[SizeManager getInstance] setCorner:_viewSupportCompany corner:14];
    [[SizeManager getInstance] setShadow:_viewSupportCompany x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewSupportDoneBack corner:45];
    [[SizeManager getInstance] setShadow:_viewSupportDoneBack x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewCompanyDone corner:20];
    [[SizeManager getInstance] setShadow:_viewCompanyDone x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewSupportItem corner:14];
    [[SizeManager getInstance] setShadow:_viewSupportItem x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewSupportItemDone corner:20];
    [[SizeManager getInstance] setShadow:_viewSupportItemDone x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewStorePoint corner:10];
    [[SizeManager getInstance] setShadow:_viewStorePoint x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewStoreClose corner:10];
    [[SizeManager getInstance] setShadow:_viewStoreClose x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewStoreBack corner:22];
    [[SizeManager getInstance] setShadow:_viewStoreBack x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewToastBack corner:25];
    [[SizeManager getInstance] setShadow:_viewToastBack x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewMyItemBack corner:19];
    [[SizeManager getInstance] setShadow:_viewMyItemBack x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewMyItemClose corner:27.5];
    [[SizeManager getInstance] setShadow:_viewMyItemClose x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewMyItemBack2 corner:14];
    [[SizeManager getInstance] setShadow:_viewMyItemBack2 x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_btnMyApply corner:20];
    [[SizeManager getInstance] setShadow:_btnMyApply x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    [[SizeManager getInstance] setCorner:_viewSupportPop corner:14];
    [[SizeManager getInstance] setShadow:_viewSupportPop x:0 y:3 size:6 opacity:0.16 color:[UIColor blackColor]];
    
    _labelCountQuest.hidden = 1;
    [self settingUser];
    [self callApiGetMyItem];
    [self callApiGetQuest];
}

- (void) settingUser{
    User *user = [DataManager getInstance].user;
    _labelBuyPoint.text = user.buy_point;
    _labelSavePoint.text = user.save_point;
    _labelStoreBuyPoint.text = user.buy_point;
    _labelStoreSavePoint.text = user.save_point;
}

- (void) settingMyItem{
//    if(selectMyO || selectMyMountain || selectMyIce || selectMyP){
        [_btnMyApply setBackgroundColor:[UIColor colorWithRed:26/255.0 green:26/255.0 blue:26/255.0 alpha:1.0]];
        [_btnMyApply setEnabled:true];
        [_btnMyApply setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    }
//    else{
//        [_btnMyApply setBackgroundColor:[UIColor colorWithRed:195/255.0 green:195/255.0 blue:195/255.0 alpha:1.0]];
//        [_btnMyApply setEnabled:false];
//        [_btnMyApply setTitleColor:[UIColor colorWithRed:59/255.0 green:59/255.0 blue:59/255.0 alpha:1.0] forState:UIControlStateNormal];
//    }
    
    NSString *itemStr = @"b";
    int itemCount = 0;

    BOOL isIce = false;
    int count = 1;
    for(int i = 0 ; i < [DataManager getInstance].myItemList.count ; i++){
        Item *item = [[DataManager getInstance].myItemList objectAtIndex:i];
        if([item.type isEqualToString:@"1"]){
            count += [item.buy_count intValue];
            if([item.is_use isEqualToString:@"1"]){
                isIce = true;
            }
        }
    }
    if(count > 3){
        count = 3;
    }
    if(count > 1){
        [self setMyItemPosition:_viewMyIce position:itemCount];
        if(selectMyIce){
            _viewMyIceSelect.hidden = 0;
        }
        else{
            _viewMyIceSelect.hidden = 1;
        }
        itemCount++;
        _labelMyItemIceCount.text = [NSString stringWithFormat:@"%d개", count - 1];
        if(isIce){
            _viewMyIceUse.hidden = 0;
        }
        else{
            _viewMyIceUse.hidden = 1;
        }
        _viewMyIce.hidden = 0;
    }
    else{
        _viewMyIce.hidden = 1;
    }
    
    _viewMyMountain.hidden = 1;
    for(int i = 0 ; i < [DataManager getInstance].myItemList.count ; i++){
        Item *item = [[DataManager getInstance].myItemList objectAtIndex:i];
        if([item.type isEqualToString:@"2"] && [item.name isEqualToString:@"설 산"]){
            [self setMyItemPosition:_viewMyMountain position:itemCount];
            if(selectMyMountain){
                _viewMyMountainSelect.hidden = 0;
            }
            else{
                _viewMyMountainSelect.hidden = 1;
            }
            itemCount++;
            if([item.is_use isEqualToString:@"1"]){
                _viewMyMountainUse.hidden = 0;
                itemStr = [NSString stringWithFormat:@"%@s", itemStr];
            }
            else{
                _viewMyMountainUse.hidden = 1;
            }
            _viewMyMountain.hidden = 0;
            break;
        }
    }

    _viewMyO.hidden = 1;
    for(int i = 0 ; i < [DataManager getInstance].myItemList.count ; i++){
        Item *item = [[DataManager getInstance].myItemList objectAtIndex:i];
        if([item.type isEqualToString:@"2"] && [item.name isEqualToString:@"오로라"]){
            [self setMyItemPosition:_viewMyO position:itemCount];
            if(selectMyO){
                _viewMyOSelect.hidden = 0;
            }
            else{
                _viewMyOSelect.hidden = 1;
            }
            itemCount++;
            _labelMyItemOLeftDate.text = [NSString stringWithFormat:@"%@일", item.left_date];
            if([item.is_use isEqualToString:@"1"]){
                _viewMyOUse.hidden = 0;
                itemStr = [NSString stringWithFormat:@"%@o", itemStr];
            }
            else{
                _viewMyOUse.hidden = 1;
            }
            _viewMyO.hidden = 0;
            break;
        }
    }

    if(isIce){
        itemStr = [NSString stringWithFormat:@"%@%d", itemStr, count];
    }
    else{
        itemStr = [NSString stringWithFormat:@"%@1", itemStr];
    }

    for(int i = 0 ; i < [DataManager getInstance].myItemList.count ; i++){
        Item *item = [[DataManager getInstance].myItemList objectAtIndex:i];
        if([item.type isEqualToString:@"0"] && count == 3){
            [self setMyItemPosition:_viewMyP position:itemCount];
            if(selectMyP){
                _viewMyPSelect.hidden = 0;
            }
            else{
                _viewMyPSelect.hidden = 1;
            }
            itemCount++;
            if([item.is_use isEqualToString:@"1"]){
                _viewMyPUse.hidden = 0;
                itemStr = [NSString stringWithFormat:@"%@p", itemStr];
            }
            else{
                _viewMyPUse.hidden = 1;
            }
            _viewMyP.hidden = 0;
            break;
        }
    }
    
    NSLog(@"test %@", itemStr);
    _imageBack.image = [UIImage imageNamed:itemStr];
}

- (void) settingQuest{
    _labelCountQuest.hidden = 0;
    _labelCountQuest.text = [NSString stringWithFormat:@"%d", (int) [DataManager getInstance].questList.count + 1];
    [_tableQuest reloadData];
}

- (void) settingQuestDetail{
    Quest *quest = [DataManager getInstance].questDetail;
    _labelQuestDetailTitle.text = quest.title;
    _labelQuestDetailContent.text = quest.content;
    _labelQuestDetailPrice.text = quest.point;
    if([quest.type isEqualToString:@"1"]){
        _iconQuestDetailBuy.hidden = 0;
        _iconQuestDetailSave.hidden = 1;
    }
    else{
        _iconQuestDetailBuy.hidden = 1;
        _iconQuestDetailSave.hidden = 0;
    }
}

- (void) settingSupport{
    self->_viewSupportDone.hidden = 1;
    self->_viewSupportLoadingBack.hidden = 1;
    self->_viewSupportBack.hidden = 0;
    self->_viewSupportPayment.hidden = 0;
    self->_viewSupportCompany.hidden = 1;
    self->_viewSupportItem.hidden = 1;
    if(selectSupport >= 0){
        [_viewSupportPayment setBackgroundColor:[UIColor colorWithRed:255/255.0 green:249/255.0 blue:201/255.0 alpha:1.0]];
        [_btnSupportDone setEnabled:true];
    }
    else{
        [_viewSupportPayment setBackgroundColor:[UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0]];
        [_btnSupportDone setEnabled:false];
    }
    [_tableSupport reloadData];
}

- (void) settingCompany{
    if(selectCompany == 0){
        [_imageCompanySelect setFrame:_btnCompany1.frame];
        _imageCompanySelect.hidden = 0;
        [_btnCompanyDone setEnabled:true];
        [_viewCompanyDone setBackgroundColor:[UIColor colorWithRed:183/255.0 green:215/255.0 blue:255/255.0 alpha:1.0]];
    }
    else if(selectCompany == 1){
        [_imageCompanySelect setFrame:_btnCompany2.frame];
        _imageCompanySelect.hidden = 0;
        [_btnCompanyDone setEnabled:true];
        [_viewCompanyDone setBackgroundColor:[UIColor colorWithRed:183/255.0 green:215/255.0 blue:255/255.0 alpha:1.0]];
    }
    else if(selectCompany == 2){
        [_imageCompanySelect setFrame:_btnCompany3.frame];
        _imageCompanySelect.hidden = 0;
        [_btnCompanyDone setEnabled:true];
        [_viewCompanyDone setBackgroundColor:[UIColor colorWithRed:183/255.0 green:215/255.0 blue:255/255.0 alpha:1.0]];
    }
    else if(selectCompany == 3){
        [_imageCompanySelect setFrame:_btnCompany4.frame];
        _imageCompanySelect.hidden = 0;
        [_btnCompanyDone setEnabled:true];
        [_viewCompanyDone setBackgroundColor:[UIColor colorWithRed:183/255.0 green:215/255.0 blue:255/255.0 alpha:1.0]];
    }
    else{
        _imageCompanySelect.hidden = 1;
        [_btnCompanyDone setEnabled:false];
        [_viewCompanyDone setBackgroundColor:[UIColor colorWithRed:195/255.0 green:195/255.0 blue:195/255.0 alpha:1.0]];
    }
}

- (void) settingItem{
    [_tableStore reloadData];
}

- (void) showButton{
    _imageMenu.image = [UIImage imageNamed:@"icon_close"];
    double delayInSeconds = 0.1;
    _viewMap.hidden = 0;
    _viewMap.transform = CGAffineTransformMakeTranslation(0, 0);
    [UIView animateWithDuration:delayInSeconds * 5 animations:^{
        self->_viewMap.transform = CGAffineTransformMakeTranslation(0, -270);
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        self->_viewVR.hidden = 0;
        self->_viewVR.transform = CGAffineTransformMakeTranslation(0, 0);
        [UIView animateWithDuration:delayInSeconds * 4 animations:^{
            self->_viewVR.transform = CGAffineTransformMakeTranslation(0, -216);
        }];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        self->_viewCamera.hidden = 0;
        self->_viewCamera.transform = CGAffineTransformMakeTranslation(0, 0);
        [UIView animateWithDuration:delayInSeconds * 3 animations:^{
            self->_viewCamera.transform = CGAffineTransformMakeTranslation(0, -162);
        }];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        self->_viewPeople.hidden = 0;
        self->_viewPeople.transform = CGAffineTransformMakeTranslation(0, 0);
        [UIView animateWithDuration:delayInSeconds * 2 animations:^{
            self->_viewPeople.transform = CGAffineTransformMakeTranslation(0, -108);
        }];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * 4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        self->_viewDeco.hidden = 0;
        self->_viewDeco.transform = CGAffineTransformMakeTranslation(0, 0);
        [UIView animateWithDuration:delayInSeconds * 1 animations:^{
            self->_viewDeco.transform = CGAffineTransformMakeTranslation(0, -54);
        }];
    });
}

- (void) hideButton{
    _imageMenu.image = [UIImage imageNamed:@"icon_menu"];
    double delayInSeconds = 0.1;
    _viewMap.transform = CGAffineTransformMakeTranslation(0, -270);
    [UIView animateWithDuration:delayInSeconds * 5 animations:^{
        self->_viewMap.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            self->_viewMap.hidden = 1;
        }
    }];
    _viewVR.transform = CGAffineTransformMakeTranslation(0, -216);
    [UIView animateWithDuration:delayInSeconds * 4 animations:^{
        self->_viewVR.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            self->_viewVR.hidden = 1;
        }
    }];
    _viewCamera.transform = CGAffineTransformMakeTranslation(0, -162);
    [UIView animateWithDuration:delayInSeconds * 3 animations:^{
        self->_viewCamera.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            self->_viewCamera.hidden = 1;
        }
    }];
    _viewPeople.transform = CGAffineTransformMakeTranslation(0, -108);
    [UIView animateWithDuration:delayInSeconds * 2 animations:^{
        self->_viewPeople.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            self->_viewPeople.hidden = 1;
        }
    }];
    _viewDeco.transform = CGAffineTransformMakeTranslation(0, -54);
    [UIView animateWithDuration:delayInSeconds animations:^{
        self->_viewDeco.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            self->_viewDeco.hidden = 1;
        }
    }];
}

- (void) setMyItemPosition:(UIView *)view position:(int)position{
    if(position == 0){
        CGRect frame = view.frame;
        frame.origin.x = 13;
        frame.origin.y = 53;
        [view setFrame:frame];
    }
    else if(position == 1){
        CGRect frame = view.frame;
        frame.origin.x = 147;
        frame.origin.y = 53;
        [view setFrame:frame];
    }
    else if(position == 2){
        CGRect frame = view.frame;
        frame.origin.x = 13;
        frame.origin.y = 225;
        [view setFrame:frame];
    }
    else if(position == 3){
        CGRect frame = view.frame;
        frame.origin.x = 147;
        frame.origin.y = 225;
        [view setFrame:frame];
    }
}

- (void) toast:(NSString *)str{
    _labelToast.text = str;
    _viewToast.hidden = 0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        self->_viewToast.hidden = 1;
    });
}

- (void) clickSupport:(UIButton *)sender{
    [self callApiGetSupport];
    _frameSupport.hidden = 0;
    _frameQuest.hidden = 1;
}

- (void) clickSupportItem:(UIButton *)sender{
    selectSupport = (int) sender.tag;
    Support *support = [[DataManager getInstance].supportList objectAtIndex:selectSupport];
    _labelSupportPopBuy.text = support.buy_point;
    _labelSupportPopSave.text = support.save_point;
    _labelSupportPopPrice.text = support.price;
    [self settingSupport];
}

- (void) clickQuestDetail:(UIButton *)sender{
    Quest *quest = [[DataManager getInstance].questList objectAtIndex:(int)sender.tag];
    [DataManager getInstance].questDetail = quest;
    [self settingQuestDetail];
    _frameQuestDetail.hidden = 0;
    _frameQuest.hidden = 1;
}

- (void) clickStoreBuy:(UIButton *)sender{
    Item *item = [[DataManager getInstance].itemList objectAtIndex:(int)sender.tag];
    if(([item.point_type isEqualToString:@"0"] && [item.price intValue] <= [[DataManager getInstance].user.save_point intValue]) || ([item.point_type isEqualToString:@"1"] && [item.price intValue] <= [[DataManager getInstance].user.buy_point intValue])){
        BOOL isBuy = true;
        if([item.type isEqualToString:@"2"]){
            for(int i = 0 ; i < [DataManager getInstance].myItemList.count ; i++){
                Item *itemData = [[DataManager getInstance].myItemList objectAtIndex:i];
                if([itemData.type isEqualToString:@"2"] && [itemData.name isEqualToString:@"설 산"]){
                    [self toast:@"이미 구매한 아이템이에요!"];
                    isBuy = false;
                    break;
                }
            }
        }
        
        int count = 1;
        for(int i = 0 ; i < [DataManager getInstance].myItemList.count ; i++){
            Item *itemData = [[DataManager getInstance].myItemList objectAtIndex:i];
            if([itemData.type isEqualToString:@"1"]){
                count++;
            }
        }
        if(count > 3){
            count = 3;
        }
        if(isBuy && [item.type isEqualToString:@"1"] && count == 3){
            [self toast:@"최대로 구매했어요!"];
            isBuy = false;
        }
        
        if(isBuy && [item.type isEqualToString:@"0"] && count != 3){
            [self toast:@"냉매가 부족해요!"];
            isBuy = false;
        }
        if(isBuy){
            [self toast:@"아이템을 구매하였어요!"];
            [self callApiBuyItem:item];
        }
    }
    else{
        [self toast:@"포인트가 부족해요!"];
    }
}

- (IBAction)clickMap:(id)sender {
    [self toast:@"전세계 사용자의 파라다이스를 구경해보세요!"];
}

- (IBAction)clickVR:(id)sender {
    [self toast:@"가상 세계의 파라다이스를 구경해보세요!"];
}

- (IBAction)clickCamera:(id)sender {
    [self toast:@"증강현실의 파라다이스를 구경해보세요!"];
}

- (IBAction)clickPeople:(id)sender {
    [self toast:@"다른 사용자의 파라다이스를 구경해보세요!"];
}

- (IBAction)clickDeco:(id)sender {
    [self callApiGetMyItem];
    
    [_frameMain setAlpha:1.0f];
    [UIView animateWithDuration:0.1f animations:^{
        [self->_frameMain setAlpha:0.0f];
    } completion:^(BOOL finished) {
        if (finished) {
            [self->_frameMyItem setAlpha:0.0f];
            self->_frameMyItem.hidden = 0;
            self->_frameMain.hidden = 1;
            [UIView animateWithDuration:0.1f animations:^{
                [self->_frameMyItem setAlpha:1.0f];
            }];
        }
    }];
}

- (IBAction)clickMenu:(id)sender {
    if(_viewMap.hidden == 0){
        [self hideButton];
    }
    else{
        [self showButton];
    }
}

- (IBAction)clickMyApply:(id)sender {
    int count = 1;
    if(selectMyIce){
        for(int i = 0 ; i < [DataManager getInstance].myItemList.count ; i++){
            Item *item = [[DataManager getInstance].myItemList objectAtIndex:i];
            if([item.type isEqualToString:@"1"]){
                count++;
                item.is_use = @"1";
                [[DataManager getInstance].myItemList setObject:item atIndexedSubscript:i];
            }
        }
    }
    else{
        for(int i = 0 ; i < [DataManager getInstance].myItemList.count ; i++){
            Item *item = [[DataManager getInstance].myItemList objectAtIndex:i];
            if([item.type isEqualToString:@"1"]){
                item.is_use = @"0";
                [[DataManager getInstance].myItemList setObject:item atIndexedSubscript:i];
            }
        }
    }
    if(selectMyMountain){
        for(int i = 0 ; i < [DataManager getInstance].myItemList.count ; i++){
            Item *item = [[DataManager getInstance].myItemList objectAtIndex:i];
            if([item.type isEqualToString:@"2"] && [item.name isEqualToString:@"설 산"]){
                item.is_use = @"1";
                [[DataManager getInstance].myItemList setObject:item atIndexedSubscript:i];
            }
        }
    }
    else{
        for(int i = 0 ; i < [DataManager getInstance].myItemList.count ; i++){
            Item *item = [[DataManager getInstance].myItemList objectAtIndex:i];
            if([item.type isEqualToString:@"2"] && [item.name isEqualToString:@"설 산"]){
                item.is_use = @"0";
                [[DataManager getInstance].myItemList setObject:item atIndexedSubscript:i];
            }
        }
    }
    if(selectMyO){
        for(int i = 0 ; i < [DataManager getInstance].myItemList.count ; i++){
            Item *item = [[DataManager getInstance].myItemList objectAtIndex:i];
            if([item.type isEqualToString:@"2"] && [item.name isEqualToString:@"오로라"]){
                item.is_use = @"1";
                [[DataManager getInstance].myItemList setObject:item atIndexedSubscript:i];
            }
        }
    }
    else{
        for(int i = 0 ; i < [DataManager getInstance].myItemList.count ; i++){
            Item *item = [[DataManager getInstance].myItemList objectAtIndex:i];
            if([item.type isEqualToString:@"2"] && [item.name isEqualToString:@"오로라"]){
                item.is_use = @"0";
                [[DataManager getInstance].myItemList setObject:item atIndexedSubscript:i];
            }
        }
    }
    if(selectMyP){
        for(int i = 0 ; i < [DataManager getInstance].myItemList.count ; i++){
            Item *item = [[DataManager getInstance].myItemList objectAtIndex:i];
            if([item.type isEqualToString:@"0"]){
                if(count >= 3){
                    item.is_use = @"1";
                    [[DataManager getInstance].myItemList setObject:item atIndexedSubscript:i];
                }
                else{
                    item.is_use = @"0";
                    [[DataManager getInstance].myItemList setObject:item atIndexedSubscript:i];
                }
            }
        }
    }
    else{
        for(int i = 0 ; i < [DataManager getInstance].myItemList.count ; i++){
            Item *item = [[DataManager getInstance].myItemList objectAtIndex:i];
            if([item.type isEqualToString:@"0"]){
                item.is_use = @"0";
                [[DataManager getInstance].myItemList setObject:item atIndexedSubscript:i];
            }
        }
    }
    if(count < 3 && selectMyP){
        [self toast:@"펭귄은 냉매가 있어야 놀러와요!"];
    }
    [self settingMyItem];
    
    [_frameMyItem setAlpha:1.0f];
    [UIView animateWithDuration:0.1f animations:^{
        [self->_frameMyItem setAlpha:0.0f];
    } completion:^(BOOL finished) {
        if (finished) {
            [self->_frameMain setAlpha:0.0f];
            self->_frameMain.hidden = 0;
            self->_frameMyItem.hidden = 1;
            [UIView animateWithDuration:0.1f animations:^{
                [self->_frameMain setAlpha:1.0f];
            }];
        }
    }];
}

- (IBAction)clickMyO:(id)sender {
    if(selectMyO){
        selectMyO = false;
    }
    else{
        selectMyO = true;
    }
    [self settingMyItem];
}

- (IBAction)clickMyP:(id)sender {
    if(selectMyP){
        selectMyP = false;
    }
    else{
        selectMyP = true;
    }
    [self settingMyItem];
}

- (IBAction)clickMyMountain:(id)sender {
    if(selectMyMountain){
        selectMyMountain = false;
    }
    else{
        selectMyMountain = true;
    }
    [self settingMyItem];
}

- (IBAction)clickMyIce:(id)sender {
    if(selectMyIce){
        selectMyIce = false;
    }
    else{
        selectMyIce = true;
    }
    [self settingMyItem];
}

- (IBAction)clickMyItemClose:(id)sender {
    [_frameMyItem setAlpha:1.0f];
    [UIView animateWithDuration:0.1f animations:^{
        [self->_frameMyItem setAlpha:0.0f];
    } completion:^(BOOL finished) {
        if (finished) {
            [self->_frameMain setAlpha:0.0f];
            self->_frameMain.hidden = 0;
            self->_frameMyItem.hidden = 1;
            [UIView animateWithDuration:0.1f animations:^{
                [self->_frameMain setAlpha:1.0f];
            }];
        }
    }];
}

- (IBAction)clickStoreClose:(id)sender {
    [_frameStore setAlpha:1.0f];
    [UIView animateWithDuration:0.1f animations:^{
        [self->_frameStore setAlpha:0.0f];
    } completion:^(BOOL finished) {
        if (finished) {
            [self->_frameMain setAlpha:0.0f];
            self->_frameMain.hidden = 0;
            self->_frameStore.hidden = 1;
            [UIView animateWithDuration:0.1f animations:^{
                [self->_frameMain setAlpha:1.0f];
            }];
        }
    }];
}

- (IBAction)clickSupportItemDone:(id)sender {
    for(int i = 0 ; i < [DataManager getInstance].myItemList.count ; i++){
        Item *item = [[DataManager getInstance].myItemList objectAtIndex:i];
        if([item.picture isEqualToString:@"오로라"]){
            [[DataManager getInstance].myItemList removeObjectAtIndex:i];
        }
    }
    Item *item = [Item new];
    item.seq = @"0";
    item.type = @"2";
    item.buy_count = @"1";
    item.name = @"오로라";
    item.picture = @"오로라";
    item.is_use = @"0";
    item.left_date = @"30";
    item.content = @"";
    [[DataManager getInstance].myItemList addObject:item];
    [self settingMyItem];
    [self settingUser];
    _frameSupport.hidden = 1;
    _frameQuest.hidden = 0;
}

- (IBAction)clickCompanyDone:(id)sender {
    [self callApiSupportDone];
}

- (IBAction)clickCompany4:(id)sender {
    selectCompany = 3;
    [self settingCompany];
}

- (IBAction)clickCompany3:(id)sender {
    selectCompany = 2;
    [self settingCompany];
}

- (IBAction)clickCompany2:(id)sender {
    selectCompany = 1;
    [self settingCompany];
}

- (IBAction)clickCompany1:(id)sender {
    selectCompany = 0;
    [self settingCompany];
}

- (IBAction)clickSupportDone:(id)sender {
    _viewSupportPop.hidden = 0;
    _tableSupport.hidden = 1;
    _viewSupportLoadingBack.hidden = 0;
    CGRect frameLoding = _viewSupportLoadingBar.frame;
    frameLoding.size.width = _viewSupportLoading.frame.size.width;
    [UIView animateWithDuration:2.0 animations:^{
        [self->_viewSupportLoadingBar setFrame:frameLoding];
    } completion:^(BOOL finished) {
        if (finished) {
            self->_viewSupportLoadingBack.hidden = 1;
            CGRect frameLoding = self->_viewSupportLoadingBar.frame;
            frameLoding.size.width = 10;
            [self->_viewSupportLoadingBar setFrame:frameLoding];
            self->_viewSupportDone.hidden = 0;
            self->_viewSupportPayment.hidden = 1;
            Support *support = [[DataManager getInstance].supportList objectAtIndex:self->selectSupport];
            [DataManager getInstance].user.buy_point = [NSString stringWithFormat:@"%d", [[DataManager getInstance].user.buy_point intValue] + [support.buy_point intValue]];
            [DataManager getInstance].user.save_point = [NSString stringWithFormat:@"%d", [[DataManager getInstance].user.save_point intValue] + [support.save_point intValue]];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
                self->_viewSupportPop.hidden = 1;
                self->_tableSupport.hidden = 0;
                self->_viewSupportDone.hidden = 1;
                self->_viewSupportBack.hidden = 1;
                self->_viewSupportPayment.hidden = 0;
                [self callApiGetCompany];
                self->_viewSupportCompany.hidden = 0;
            });
        }
    }];
}

- (IBAction)clickSupportClose:(id)sender {
    _frameSupport.hidden = 1;
    selectSupport = -1;
    selectCompany = -1;
    _frameQuest.hidden = 0;
}

- (IBAction)clickQuestDetailCamera:(id)sender {
    [self callApiQuestDone];
}

- (IBAction)clickQuestDetailClose:(id)sender {
    _frameQuest.hidden = 0;
    _frameQuestDetail.hidden = 1;
}

- (IBAction)clickQuestClose:(id)sender {
    [_frameQuest setAlpha:1.0f];
    [UIView animateWithDuration:0.1f animations:^{
        [self->_frameQuest setAlpha:0.0f];
    } completion:^(BOOL finished) {
        if (finished) {
            [self->_frameMain setAlpha:0.0f];
            self->_frameMain.hidden = 0;
            self->_frameQuest.hidden = 1;
            [UIView animateWithDuration:0.1f animations:^{
                [self->_frameMain setAlpha:1.0f];
                [self callApiGetUser];
            }];
        }
    }];
}

- (IBAction)clickQuest:(id)sender {
    [_frameMain setAlpha:1.0f];
    [UIView animateWithDuration:0.1f animations:^{
        [self->_frameMain setAlpha:0.0f];
    } completion:^(BOOL finished) {
        if (finished) {
            [self->_frameQuest setAlpha:0.0f];
            self->_frameQuest.hidden = 0;
            self->_frameMain.hidden = 1;
            [UIView animateWithDuration:0.1f animations:^{
                [self->_frameQuest setAlpha:1.0f];
                [self callApiGetQuest];
            }];
        }
    }];
}

- (IBAction)clickStore:(id)sender {
    selectStore = -1;
    [self callApiGetItem];
}

- (void) callApiGetUser{
    [self settingUser];
}

- (void) callApiGetMyItem{
    selectMyIce = false;
    selectMyMountain = false;
    selectMyP = false;
    selectMyO = false;
    [self settingMyItem];
}

- (void) callApiUseItem{
    
}

- (void) callApiGetQuest{
    if([DataManager getInstance].questList.count == 0 || [DataManager getInstance].questList == nil){
        [DataManager getInstance].questList = [NSMutableArray new];
        
        Quest *quest = [Quest new];
        quest.seq = @"0";
        quest.title = @"친환경 마크 찾기";
        quest.type = @"1";
        quest.content = @"이 마크를 인식해주세요";
        quest.picture = @"";
        quest.point = @"100";
        quest.is_success = @"0";
        [[DataManager getInstance].questList addObject:quest];
        
        Quest *quest2 = [Quest new];
        quest2.seq = @"0";
        quest2.title = @"공정무역 마크 찾기";
        quest2.type = @"1";
        quest2.content = @"이 마크를 인식해주세요";
        quest2.picture = @"";
        quest2.point = @"100";
        quest2.is_success = @"0";
        [[DataManager getInstance].questList addObject:quest2];
        
        Quest *quest3 = [Quest new];
        quest3.seq = @"0";
        quest3.title = @"텀블러 챙기기";
        quest3.type = @"1";
        quest3.content = @"텀블러를 인식해주세요";
        quest3.picture = @"";
        quest3.point = @"100";
        quest3.is_success = @"0";
        [[DataManager getInstance].questList addObject:quest3];
        
        Quest *quest4 = [Quest new];
        quest4.seq = @"0";
        quest4.title = @"선풍기 사용하기";
        quest4.type = @"0";
        quest4.content = @"선풍기를 인식해주세요";
        quest4.picture = @"";
        quest4.point = @"100";
        quest4.is_success = @"0";
        [[DataManager getInstance].questList addObject:quest4];
        
        Quest *quest5 = [Quest new];
        quest5.seq = @"0";
        quest5.title = @"집 나가기 전 콘센트 뽑기";
        quest5.type = @"0";
        quest5.content = @"콘센트를 뽑고 인식해주세요";
        quest5.picture = @"";
        quest5.point = @"100";
        quest5.is_success = @"0";
        [[DataManager getInstance].questList addObject:quest5];
        
        Quest *quest6 = [Quest new];
        quest6.seq = @"0";
        quest6.title = @"에코백 챙기기";
        quest6.type = @"0";
        quest6.content = @"에코백을 인식해주세요";
        quest6.picture = @"";
        quest6.point = @"100";
        quest6.is_success = @"0";
        [[DataManager getInstance].questList addObject:quest6];
    }
    
    [self settingQuest];
}

- (void) callApiQuestDone{
    _viewQuestDetailDone.hidden = 0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        [DataManager getInstance].questDetail.is_success = @"1";
        if([[DataManager getInstance].questDetail.type isEqualToString:@"1"]){
            [DataManager getInstance].user.buy_point = [NSString stringWithFormat:@"%d", [[DataManager getInstance].user.buy_point intValue] + [[DataManager getInstance].questDetail.point intValue]];
        }
        else{
            [DataManager getInstance].user.save_point = [NSString stringWithFormat:@"%d", [[DataManager getInstance].user.save_point intValue] + [[DataManager getInstance].questDetail.point intValue]];
        }
        self->_viewQuestDetailDone.hidden = 1;
        self->_frameQuest.hidden = 0;
        self->_frameQuestDetail.hidden = 1;
        [self settingQuest];
    });
    
}

- (void) callApiGetSupport{
    [DataManager getInstance].supportList = [NSMutableArray new];
    
    Support *support = [Support new];
    support.seq = @"1";
    support.buy_point = @"500";
    support.save_point = @"500";
    support.price = @"1000원";
    [[DataManager getInstance].supportList addObject:support];
    
    Support *support2 = [Support new];
    support2.seq = @"2";
    support2.buy_point = @"500";
    support2.save_point = @"2000";
    support2.price = @"2000원";
    [[DataManager getInstance].supportList addObject:support2];
    
    Support *support3 = [Support new];
    support3.seq = @"1";
    support3.buy_point = @"2000";
    support3.save_point = @"500";
    support3.price = @"2000원";
    [[DataManager getInstance].supportList addObject:support3];
    
    Support *support4 = [Support new];
    support4.seq = @"1";
    support4.buy_point = @"3000";
    support4.save_point = @"3000";
    support4.price = @"5000원";
    [[DataManager getInstance].supportList addObject:support4];
    
    selectSupport = -1;
    selectCompany = -1;
    [self settingSupport];
}

- (void) callApiGetCompany{
    [self settingCompany];
}

- (void) callApiSupportDone{
    _viewSupportCompany.hidden = 1;
    _viewSupportItem.hidden = 0;
}

- (void) callApiGetItem{
    [DataManager getInstance].itemList = [NSMutableArray new];
    
    Item *item = [Item new];
    item.seq = @"0";
    item.type = @"1";
    item.buy_count = @"1";
    item.name = @"빙하를 다시 얼려주는 냉매";
    item.picture = @"image_ice.png";
    item.is_use = @"0";
    item.left_date = @"30";
    item.content = @"빙하를 조금 넓혀줍니다.";
    item.price = @"300";
    item.point_type = @"0";
    [[DataManager getInstance].itemList addObject:item];
    
    Item *item2 = [Item new];
    item2.seq = @"0";
    item2.type = @"2";
    item2.buy_count = @"1";
    item2.name = @"설 산";
    item2.picture = @"image_mountain.png";
    item2.is_use = @"0";
    item2.left_date = @"30";
    item2.content = @"산을 넣어줍니다.";
    item2.price = @"700";
    item2.point_type = @"1";
    [[DataManager getInstance].itemList addObject:item2];
    
    Item *item3 = [Item new];
    item3.seq = @"0";
    item3.type = @"0";
    item3.buy_count = @"1";
    item3.name = @"펭귄";
    item3.picture = @"image_p.png";
    item3.is_use = @"0";
    item3.left_date = @"30";
    item3.price = @"900";
    item3.point_type = @"1";
    item3.content = @"펭귄 친구를 만들어줍니다.";
    [[DataManager getInstance].itemList addObject:item3];
    
    [self settingItem];
    
    [_frameMain setAlpha:1.0f];
    [UIView animateWithDuration:0.1f animations:^{
        [self->_frameMain setAlpha:0.0f];
    } completion:^(BOOL finished) {
        if (finished) {
            [self->_frameStore setAlpha:0.0f];
            self->_frameStore.hidden = 0;
            self->_frameMain.hidden = 1;
            [UIView animateWithDuration:0.1f animations:^{
                [self->_frameStore setAlpha:1.0f];
            }];
        }
    }];
}

- (void) callApiBuyItem:(Item *)item{
    item.is_use = @"0";
    if([item.point_type isEqualToString:@"1"]){
        [DataManager getInstance].user.buy_point = [NSString stringWithFormat:@"%d", [[DataManager getInstance].user.buy_point intValue] - [item.price intValue]];
    }
    else{
        [DataManager getInstance].user.save_point = [NSString stringWithFormat:@"%d", [[DataManager getInstance].user.save_point intValue] - [item.price intValue]];
    }
    [[DataManager getInstance].myItemList addObject:item];
    [self settingUser];
    [self settingMyItem];
}

@end
