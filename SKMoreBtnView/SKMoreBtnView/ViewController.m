//
//  ViewController.m
//  SKMoreBtnView
//
//  Created by AY on 2017/8/5.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//


#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

#define MAS_SHORTHAN
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"
#import "ViewController.h"
#import "EquipmentSearchView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	EquipmentSearchView *search = [[EquipmentSearchView alloc]init];
	
	search.frame =CGRectMake(0, 84, kScreenW, kScreenH - 100);
	search.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:search];

}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
