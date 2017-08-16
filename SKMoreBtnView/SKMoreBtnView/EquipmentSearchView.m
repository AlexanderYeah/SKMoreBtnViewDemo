//
//  EquipmentSearchView.m
//  Perfume
//
//  Created by AY on 2017/8/4.
//  Copyright © 2017年 bonfeel. All rights reserved.
//

#import "EquipmentSearchView.h"


#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

#define MAS_SHORTHAN
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

@interface EquipmentSearchView()

@property(nonatomic,strong)UIView *btnBgView;
@end
@implementation EquipmentSearchView


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (instancetype)init
{
    self = [super init];
    if (self) {

        [self createUI];
    }
    return self;
}

- (void)createUI{
	NSLog(@"历史搜索");
	// 1 历史搜索标题
	CGFloat his_w = kScreenW * 0.186;
	CGFloat his_left_padding = 15;
	UILabel *historyLbl = [[UILabel alloc]init];
	historyLbl.font = [UIFont systemFontOfSize:17.0f];
	historyLbl.text = @"历史搜索";
	historyLbl.textColor = [UIColor grayColor];
	[self addSubview:historyLbl];
	
	[historyLbl mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.equalTo(his_w);
		make.height.equalTo(25);
		make.left.equalTo(self.mas_left).offset(his_left_padding);
		make.top.equalTo(self.mas_top).offset(his_left_padding);
	}];
	
	// 2 清空历史搜索记录按钮
	
	CGFloat title_w = [@"清空历史记录" boundingRectWithSize:CGSizeMake(kScreenW/2, 25) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0f]} context:nil].size.width;
	UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	[deleteBtn setTitle:@"清空历史记录" forState:UIControlStateNormal];
	[deleteBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
	[deleteBtn addTarget:self action:@selector(clearAllHistory) forControlEvents:UIControlEventTouchUpInside];
	deleteBtn.titleLabel.font = [UIFont systemFontOfSize:17.0f];
	[self addSubview:deleteBtn];
	[deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.equalTo(title_w);
		make.height.equalTo(25);
		make.right.equalTo(self.mas_right).offset(-his_left_padding);
		make.top.equalTo(self.mas_top).offset(his_left_padding);

	}];
	
	// 3 垃圾篓
	
	UIImageView *iconView = [[UIImageView alloc]init];
	iconView.image = [UIImage imageNamed:@"水杯"];
	[self addSubview:iconView];
	
	[iconView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.equalTo(25);
		make.height.equalTo(25);
		make.right.equalTo(deleteBtn.mas_left).offset(-5);
		make.centerY.equalTo(deleteBtn.mas_centerY).offset(0);
	
	}];
	
	// 4 分割线
	UIView *sepView = [[UIView alloc]init];
	sepView.backgroundColor = [UIColor colorWithRed:230/255.0f green:230/255.0f blue:230/255.0f alpha:1];
	[self addSubview:sepView];
	[sepView mas_makeConstraints:^(MASConstraintMaker *make) {
		
		make.height.equalTo(0.7);
		make.left.equalTo(self.mas_left).offset(his_left_padding);
		make.right.equalTo(self.mas_right).offset(-his_left_padding);
		make.top.equalTo(historyLbl.mas_bottom).offset(10);

	}];
	
	
	_btnBgView = [[UIView alloc]init];
	_btnBgView.backgroundColor = [UIColor whiteColor];
	[self addSubview:_btnBgView];
	
	[_btnBgView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.bottom.equalTo(self.mas_bottom).offset(-10);
		make.left.equalTo(self.mas_left).offset(0);
		make.right.equalTo(self.mas_right).offset(0);
		make.top.equalTo(sepView.mas_bottom).offset(1);

	}];
	


	[self createBtnWithTitleArr:@[@"上海儿童剧院",@"徐汇汉庭",@"上海香格里拉酒店",@"上海嘉定北边",@"上海外滩东方明珠电视塔",@"第二条人生信条",@"牛逼的人生",@"上海外滩电视塔",@"刘行行行刘行"] withView:sepView];
	
}

/** 创建按钮 */

- (void)createBtnWithTitleArr:(NSArray *)titleArr withView:(UIView *)sepView
{
	
	
	
	CGFloat btn_left_padding = 15;
	
	CGFloat total_left_padding = btn_left_padding;
	CGFloat total_title_w = 0;
	CGFloat total_top_padding = btn_left_padding;
	
	// 标记是第几行,精确计算其left
	int col_flag = 0;
	
	int row_index = 0;
	
	// 记录总共的width 计算row_index
	CGFloat total_btn_w = 0;
	
	for (int i = 0; i < titleArr.count; i ++) {
		
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
	[btn  setTitle:titleArr[i] forState:UIControlStateNormal];
	[btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
	[btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
	btn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
	btn.layer.cornerRadius = 3;
	btn.layer.borderWidth = 0.7;
	[btn setBackgroundColor: [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1]];
	btn.layer.borderColor = [UIColor colorWithRed:230/255.0f green:230/255.0f blue:230/255.0f alpha:1].CGColor;
	[_btnBgView addSubview:btn];
	

	CGFloat btn_title_w = [titleArr[i] boundingRectWithSize:CGSizeMake(kScreenW - btn_left_padding * 2, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0f]} context:nil].size.width;
		// 记录left值
		
		
		
		total_title_w = total_title_w + btn_title_w;
		total_left_padding = btn_left_padding * 1 + (i - col_flag) * btn_left_padding + total_title_w ;
		
		// 真正left_padding
		CGFloat true_left_padding = total_left_padding - btn_title_w;
		total_btn_w = btn_title_w + total_btn_w +(i - col_flag) * btn_left_padding;
		NSLog(@"total_btn_w--%d",[[NSString stringWithFormat:@"%f",total_btn_w / kScreenW] intValue]);
		
		row_index = [[NSString stringWithFormat:@"%f",total_btn_w / kScreenW] intValue];
		
		NSLog(@"alex--%f--%f--%d",kScreenW,total_btn_w,row_index);
		
		
		// 判断left的值
		if (total_left_padding >= kScreenW) {
			total_left_padding = btn_left_padding;
			true_left_padding = btn_left_padding;
			total_title_w = btn_title_w;
			// 更改 row_flag
			col_flag = i;
			
			
		}
		total_top_padding = btn_left_padding * (row_index + 1) + 30 * row_index;

		
		[btn mas_makeConstraints:^(MASConstraintMaker *make) {
		
			make.height.equalTo(30);
			make.width.equalTo(btn_title_w);
			make.left.equalTo(self.mas_left).offset(true_left_padding);
			make.top.equalTo(sepView.mas_top).offset(total_top_padding);

		}];

		
	}
	
}


#pragma mark - 按钮的点击事件
- (void)btnClick:(UIButton *)btn
{
	
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"按钮" message:btn.titleLabel.text delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil];
	[alert show];
	
	// 将用户点击传入主界面
	[self.delegate clickBtnWithTitle:btn.titleLabel.text];

}


#pragma mark - 清空历史记录
- (void)clearAllHistory
{
	for (UIView *view in _btnBgView.subviews) {
		[view removeFromSuperview];
	}

}

@end
