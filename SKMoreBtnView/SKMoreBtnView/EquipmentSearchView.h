//
//  EquipmentSearchView.h
//  Perfume
//
//  Created by AY on 2017/8/4.
//  Copyright © 2017年 bonfeel. All rights reserved.
//

#import <UIKit/UIKit.h>
// 通过代理告知主界面 用户选择的是哪一个按钮
@protocol SearchBtnClickDelegate <NSObject>
// 点击按钮的标题显示
- (void)clickBtnWithTitle:(NSString *)title;

@end
@interface EquipmentSearchView : UIView
@property (nonatomic,assign)id<SearchBtnClickDelegate> delegate;
@end
