//
//  MyTableViewCell.h
//  demo
//
//  Created by 段昇辰 on 2017/8/24.
//  Copyright © 2017年 www.coolketang.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numberlable;
@property (weak, nonatomic) IBOutlet UIView *myImageview;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *year;

@end
